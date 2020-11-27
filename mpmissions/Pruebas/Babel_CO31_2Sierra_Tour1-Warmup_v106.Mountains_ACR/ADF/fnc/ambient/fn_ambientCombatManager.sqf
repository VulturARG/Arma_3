/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Ambient Combat Manager
Author: Whiztler
Script version: 1.16

Game type: N/A
File: fn_ambientCombatManager.sqf
**********************************************************************************
ABOUT
This script creates ambient combat in a predefined area. The area can be defined
by a marker, an object, position array, etc.

The script has the following options:
- Ambient artillery/grenade explosions
- Ambient vehicle explosions
- Ambient small arms fire
- side selection enemy (west, east, independent)
- Intensity (from 1 to 10). 10 is very intense and most resource heavy
- Duration. Can be set to run from anywhere from 1 minute to several hours
- Cancel function. Run ADF_cancel_ACM = true on the server to cancel ACM.
- Server FPS sensitive. When the server FPS drops below 20, ACM will pause.

Small arms fire units is not visible so make sure the center position + radius
is not too close to players.

You have have multiple ACM's active (e.g. different locations, duration, two
different sides). Although AMC is performance friendly, it is recommended not
to spawn more than 2 ACM's at the time.

INSTRUCTIONS:
Place a marker or object on the map that represents the center of the ACM radius.
Execute (call) from the server or HC. THIS FUNCTION MUST BE SPAWNED!!

REQUIRED PARAMETERS:
0. Position:    The center of the position where ACM is active. Marker, object,
                trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
1. Number:      Radius in meters around the position. Size of the AO.
                Default: 750        
2. Number:      Time in MINUTES that ACM will be active on the position. You can
                have multiple ACM's with different positions / times        
3. Bool:        Ambient artillery/40 mike
                - true - enable ambient artillery (default)
                - false - disable ambient artillery
4. Bool:        Random vehicle explosions
                - true - enable random vehicle explosions (default)
                - false - disable random vehicle explosions     
5. Bool:        Small arms fire
                - true - enable Small arms fire (default)
                - false - disable Small arms fire
6. Side:        east, west, independent. Default: east
7. Number:      Intensity. Default: 2
                - 10 - Maximum intensity setting
                - 1 - minimum intensity setting
8. Number:      Distance from players for ambient combat activity to spawn
                Default: 150

EXAMPLES USAGE IN SCRIPT:
// Example with a marker and 500 meter radius, 15 minutes:
["ACM_marker", 500, 15, true, true, true, east, 3, 150] spawn ADF_fnc_ambientCombatManager;

EXAMPLES USAGE IN EDEN:
// Example around position player and 800 meter radius, 25 minutes, medium intensity:
[position player, 800, 25, true, true, true, east, 5, 300] spawn ADF_fnc_ambientCombatManager;

DEFAULT/MINIMUM OPTIONS
["Ambient_AO"] spawn ADF_fnc_ambientCombatManager;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Local function: create random explosion 
private _ACM_explosion = {
	params [["_p", [0, 0, 0], [[]], [3]]];
	
	private _bc = selectRandom ["Bo_GBU12_LGB", "M_Mo_82mm_AT_LG", "R_80mm_HE", "G_40mm_HE", "HelicopterExploBig"];
	private _b = createVehicle [_bc, [_p select 0, _p select 1, (_p select 2) + 3], [], 0, "NONE"];
	
	if (ADF_debug) then {
		private _m = createMarker [ format["p_%1%2", round (random 500), round (_p select 1)], _p];
		_m setMarkerSize [.7, .7];
		_m setMarkerShape "ICON";
		_m setMarkerType "hd_dot";
		_m setMarkerColor "ColorYellow";
		[format ["_ACM_explosion - explosion created at position: %1", _p]] call ADF_fnc_log;
	};
	
	true
};

// local function: create a temp agent for the purpose of machine gun fire simulation
private _ACM_createAgent = {
	// init
	params ["_s"];
	private _a	= "";
	private _uc	= "";
	
		// Check side
	switch _s do {
		case east		: {_a = "200Rnd_65x39_belt_Tracer_Green"; _uc = "o_soldier_f"};
		case west		: {_a = "200Rnd_65x39_belt_Tracer_Red"; _uc = "b_soldier_f"};
		case independent	: {_a = "200Rnd_65x39_belt_Tracer_Yellow"; _uc = "i_soldier_f"};
		default 			  {_a = "200Rnd_65x39_belt_Tracer_Green"; _uc = "o_soldier_f"};
	};
	
	// Create the agent
	private _u = createAgent [_uc, [0, 0, 0], [], 0, "NONE"];	
	_u allowDamage false;
	_u setCaptive true;
	_u hideObject true;	

	// FSM aspects
	_u disableAI "anim";
	_u disableAI "move";
	_u disableAI "target";
	_u disableAI "autotarget";
	_u setBehaviour "careless";
	_u setCombatMode "blue";
	
	// Disarm and arm the agent
	removeAllWeapons _u;
	private _w = "FakeWeapon_moduleTracers_F";
	_u addMagazine _a;
	_u addWeapon _w;
	_u selectWeapon _w;
	_u switchMove "amovpercmstpsraswrfldnon";
	
	// Disable HC Load balancing and Caching
	private _g = group _u;
	_g setVariable ["ADF_noHC_transfer", true];
	_g setVariable ["zbe_cacheDisabled", true];
	
	_u
};


// local function: small arms flare and smoke simulation
private _ACM_smallArms = {
	// init
	params ["_u", ["_p", [0, 0, 0], [[]], [3]]];

	_u setPosATL _p;
	
	if (ADF_debug) then {
		private _m = createMarker [format ["p_%1%2", round (random 500), round (_p select 1)], _p];
		_m setMarkerSize [.7, .7];
		_m setMarkerShape "ICON";
		_m setMarkerType "hd_dot";
		_m setMarkerColor "ColorWhite";
		[format ["_ACM_smallArms - small arms agent at position: %1", _p]] call ADF_fnc_log;
	};		
	
	_u setVehicleAmmo 1;
	
	// Smoke and flare effects
	if ((random 1) > 0.80) then {
		private _v = (selectRandom ["SmokeShell", "SmokeShellRed", "SmokeShellGreen"]) createVehicle _p;
		
	};
	if ((date select 3 >= 19) && (date select 3 < 4.5)) then {
		if ((random 1) > 0.90) then {
			private _f = (selectRandom ["F_40mm_Red", "F_40mm_White", "F_40mm_Green"]) createVehicle [_p select 0, _p select 1, (_p select 2) + 180];
			_f setVelocity [0, 0, -6.2];
		};
	};
	
	private _s = 0.05 + random 0.1;
	private _d = -5 + random 10;
	private _a = 30 + random 60;
	
	_u setDir (random 360);		
	[_u, _a, 0] call BIS_fnc_setPitchBank;
	
	sleep 0.1;
	
	_time = time + 0.1 + random 0.9;
	
	while {time < _time} do {
		_u forceWeaponFire [primaryWeapon _u, "MANUAL"];
		sleep _s;
		_u setDir (direction _u + _d);
		[_u, _a, 0] call BIS_fnc_setPitchBank;
		if (random 1 > 0.95) then {sleep (2 * _s)};
	};
	
	true
};


// local function - vehicle explosion simulation	
private _ACM_vehicle = {
	params [
		["_p", [0, 0, 0], [[]], [3]],
		["_r", 750, [0]]
	];
	
	_p = [_p, _r] call ADF_fnc_roadPos;
	
	private _vc = selectRandom ["O_MRAP_02_F", "O_Truck_02_covered_F", "O_MBT_02_arty_F", "O_APC_Tracked_02_cannon_F"];
	private _v = createVehicle [_vc, _p, [], 0, "NONE"];
	_v setDamage 1;
	
	if (ADF_debug) then {
		private _m = createMarker [format ["p_%1%2", round (random 500), round (_p select 1)], _p];
		_m setMarkerSize [.7, .7];
		_m setMarkerShape "ICON";
		_m setMarkerType "hd_dot";
		_m setMarkerColor "ColorRed";
		[format ["_ACM_vehicle - vehicle created at position: %1", _p]] call ADF_fnc_log;
	};
	
	sleep 60;
	deleteVehicle _v;
	
	true
};	
	
// init
params [
	["_p", [0, 0, 0], ["", [], objNull, grpNull]], 
	["_r", 750, [0]],
	["_t", 20, [0]],
	["_b", true, [true]],
	["_v", true, [true]],
	["_s", true, [true]],
	["_f", east, [west]],
	["_y", 2, [0]],
	["_d", 150, [0]]
];
ADF_cancel_ACM	= false;
private _w		= 2;
private _u		= objNull;
diag_log format ["ADF RPT: Starting ADF_fnc_ACM. Params: %1, %2, %3, %4, %5, %6, %7, %8, %9", _p, _r, _t, _b, _v, _s, _f, _y, _d];

// Check the position (marker, array, etc.)
_p = [_p] call ADF_fnc_checkPosition;
// convert minutes to seconds
_t = _t * 60;

// Cycle time
if (_t < 6) then {
	_w = (_y / 10) + 1.3;		
} else {
	_w = (_y / 10) + 2;
};	

// Intensity	
_y = 1 - (_y / 10);
if (_y < 0.1) then {_y = 0.1};
if (_y > 0.8) then {_y = 0.8};	

// Create agent for small arms function
if (_s) then {_u = [_f] call _ACM_createAgent};

if (ADF_debug) then {
	private _m = createMarker [format ["m_%1%2", round (random 9999), round (random 9999)], _p];
	_m setMarkerSize [_r, _r];
	_m setMarkerShape "ELLIPSE";
	_m setMarkerBrush "Solid";
	_m setMarkerColor "ColorGreen";
};	

for "_i" from _t to 0 step -1 do {
	private _dt 	= diag_tickTime;
	private _c		= random 1;
	private _fps	= 0;

	// Select a random position within the pre-defined radius
	private _a = [_p, _r, random 360] call ADF_fnc_randomPos;
	
	// Check FPS in multiplayer
	if (isMultiplayer) then {_fps = diag_fps} else {_fps = 25};
	
	// No effects when FPS drops below 20
	if (_fps > 20) then {
		// Check if no players are near
		if ({alive _x && _a distance _x < _d} count allPlayers == 0) then {
			// Select a random effect
			if (_b && _c > 0.5 && (random 1) > _y) then {[_a] call _ACM_explosion};
			if (_v && _c < 0.2 && ((random 1) > (_y + 0.1))) then {[_a, _r] spawn _ACM_vehicle};
			if (_s && ((random 1) > (_y - 0.1))) then {[_u, _a] call _ACM_smallArms};
		};
	} else {
		_w = 5; // FPS below 20. Sleep 5 seconds.
	};
	
	// Reporting
	if (ADF_debug) then {
		hintSilent format ["ACM Timer: %1 left (FPS: %2)", [((_i) / 60) + .01, "HH:MM"] call BIS_fnc_timeToString, _fps];
		[format ["ADF_fnc_ambientCombatManager - Cycle diag: %1", diag_tickTime]] call ADF_fnc_log;			
	};	
	if (ADF_extRpt) then {
		diag_log format ["ADF RPT: ACM Timer - %1 left (FPS: %2)", [((_i) / 60) + .01, "HH:MM"] call BIS_fnc_timeToString, _fps];
	};
	if (ADF_debug) then {[format ["ADF_fnc_ambientCombatManager - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};
	
	// Cancel function for scripts. To cancel ACM: ADF_cancel_ACM = true; // (server)
	if (ADF_cancel_ACM) exitWith {if (ADF_debug || ADF_extRpt) then {[format ["ADF Debug: ADF_fnc_ACM - ACM cancelled at cycle %1", _i]] call ADF_fnc_log}};
	
	sleep _w;
};

// Delete the small arms agent if small arms was activated.
if (_s) then {deleteVehicle _u; deleteGroup (group _u); _u = nil};
if (ADF_debug || ADF_extRpt) then {format ["ADF_fnc_ambientCombatManager finished."] call ADF_fnc_log};

true