/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Create AO
Author: Whiztler
Script version: 1.12

File: fn_createAO.sqf
**********************************************************************************
ABOUT
This function creates (populates) a given AO (position, markersize). The amount of
units/vehicles depend on the size of the ao (size of the marker). Infantry units
garrison or go on patrol (if no buildings near). Vehicles go on patrol.
NOTE THAT SPAWNING AN AO CAN TAKE UP TO 5 MINUTES!

What the function spawns is based on the size of the marker:

< 100 meters        : 8 x inf, 1 vehicle
100 - 250 meters    : 16 x inf, 1 vehicle
250 - 500 meters    : 24 x inf, 2 x vehicle, 1 x apc
500 - 750 meters    : 32 x inf, 3 x vehicle, 2 x apc, 1 x armor
750 - 1000 meters   : 48 x inf, 5 x vehicle, 2 x apc, 2 x armor
> 1000 meters       : 48 x inf, 5 x vehicle, 2 x apc, 2 x armor, 1 helicopter

INSTRUCTIONS:
Execute (spawn!) from the server or headless client.

REQUIRED PARAMETERS:
0. String:  Spawn marker name. Size of marker determines AO size.

OPTIONAL PARAMETERS:
1. Side:        west, east or independent. Default: east
2. Bool:        make AO maker transparent (invisible to players).
                - true: make transparent  (default)
                - false: leave as is
3. Bool:        Infantry units search nearby buildings?
                - true: search buildings
                - false: do not search buildings (default)
4. Bool:        Random IED's in the AO?
                - true: place random IED's
                - false: Do not place random IED's (default)
5. String:      Code to execute on each unit of the crew (e.g. a function).
                Default = "". Code is CALLED. Each unit of the group is passed
                (_this select 0) to the code/fnc.
6. String:      Code to execute on the crew aa a group (e.g. a function).
                Default = "". Code is CALLED. The group is passed
                (_this select 0) to the code/fnc.         

EXAMPLES USAGE IN SCRIPT:
[_AO1marker, independent, false, true, true, "", "myFunction"] spawn ADF_fnc_createAO;

EXAMPLES USAGE IN EDEN:
0 = ["myAOmarker", east, false, true, true, "", "myFunction"] spawn ADF_fnc_createAO;

DEFAULT/MINIMUM OPTIONS
["myAOmarker"] spawn ADF_fnc_createAO;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createAO"};

// Init
private _dt = diag_tickTime;
params [
	["_m", "", [""]],
	["_s", east, [west]],
	["_mt", true, [false]],
	["_sb", false, [true]],
	["_e", false, [true]],
	["_c1", "", [""]],
	["_c2", "", [""]]
];

// Check valid vars
if !(_m in allMapMarkers) exitWith {[format ["ADF_fnc_createAO - %1 does not appear to be a valid AO marker. Exiting", _m], true] call ADF_fnc_log; false};
if (_c1 != "") then {if (isNil _c1) then {if (ADF_debug) then {[format ["ADF_fnc_createAO - incorrect code (%1) passed. Defaulted to ''.", _c1]] call ADF_fnc_log;}; _c1 = "";}};
if (_c2 != "") then {if (isNil _c2) then {if (ADF_debug) then {[format ["ADF_fnc_createAO - incorrect code (%1) passed. Defaulted to ''.", _c2]] call ADF_fnc_log;}; _c2 = "";}};

// Init vars
if (_mt) then {_m setMarkerAlpha 0};
private _r	= (((getMarkerSize _m) select 0) + ((getMarkerSize _m) select 1)) / 2;
private _rx	= _r;
private _p 	= getMarkerPos _m;
private _ei	= 0;
private _ev	= 0;
private _ea	= 0;
private _et	= 0;
private _eh	= 0;
private _ie	= 0;

// Set spawn size based on marker size
if (_r <= 100) 				then {_ei = 1; _ev = 1; _ea = 0; _et = 0; _eh = 0; _ie = 1};
if (_r > 100 && _r <= 250)	then {_ei = 2; _ev = 1; _ea = 0; _et = 0; _eh = 0; _ie = 1};
if (_r > 250 && _r <= 500)	then {_ei = 3; _ev = 2; _ea = 1; _et = 0; _eh = 0; _ie = 3};
if (_r > 500 && _r <= 750)	then {_ei = 4; _ev = 3; _ea = 2; _et = 1; _eh = 0; _ie = 3};
if (_r > 750 && _r <= 999)	then {_ei = 5; _ev = 5; _ea = 2; _et = 2; _eh = 0; _ie = 4};
if (_r > 999)				then {_ei = 6; _ev = 5; _ea = 2; _et = 2; _eh = 1; _ie = 5};
	
// FOOT: Garrison & patrol
if (_ei > 1) then {
	private "_i";
	for "_i" from 1 to _ei do {
		private _w = if (random 1 > 0.60) then {true} else {false};
		// half patrol / half garrison
		private _gp = [_p, _r, random 360] call ADF_fnc_randomPos;
		[_gp, _s, 4, true, (_r/2), _sb, _c1, _c2] call ADF_fnc_createGarrison;
		[_p, _s, 4, _w, _r, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, _sb, _c1, _c2] call ADF_fnc_createFootPatrol;
	};
} else {
	if (_ei == 0) exitWith {};
	private _gp = [_p, _r, random 360] call ADF_fnc_randomPos;
	[_gp, _s, 8, true, (_r/4), _sb, _c1, _c2] call ADF_fnc_createGarrison;
};

// ROAD: Transport vehicles & IFV's
if (_ev > 1) then {
	private "_i";
	for "_i" from 1 to _ev do {
		private _t = selectRandom [1, 2, 3];
		
		// Get a random spawn position on a road with the AO		
		for "_i" from 1 to 4 do {
			private _k = [_p, _r, random 360] call ADF_fnc_randomPos;
			_rd = [_k, _rx] call ADF_fnc_roadPos;
			// If a suitable position has been found then exit else continue looking
			if (isOnRoad _rd) exitWith {_p = _rd};
			_rx = _rx + (_r / 10);
			if (_i == 3) then {_rx = _rx + (_r / 7)};
			if (_i == 4) then {_p = [_p, _r, (random 180) + (random 180)] call ADF_fnc_randomPosMax;};
		};	
		
		// Create a crewed veicle and send it on patrol
		[_p, _p, _s, _t, _r, 4, "MOVE", "SAFE", "RED", "LIMITED", 25, _c1, _c2] call ADF_fnc_createVehiclePatrol;
		sleep 10;
	};
} else {
	if (_ev == 0) exitWith {};
	// Create a crewed vehicle and send it on patrol
	private _t = selectRandom [1, 2, 3];
	[_p, _p, _s, _t, _r, 4, "MOVE", "SAFE", "RED", "LIMITED", 25, _c1, _c2] call ADF_fnc_createVehiclePatrol;
};

// ROAD: APC's
if (_ea > 1) then {
	private "_i";
	for "_i" from 1 to _ea do {
	
			// Get a random spawn position on a road with the AO		
			for "_i" from 1 to 4 do {
				private _k = [_p, _r, random 360] call ADF_fnc_randomPos;
				_rd = [_k, _rx] call ADF_fnc_roadPos;
				// If a suitable position has been found then exit else continue looking
				if (isOnRoad _rd) exitWith {_p = _rd};
				_rx = _rx + (_r / 10);
				if (_i == 3) then {_rx = _rx + (_r / 7)};
				if (_i == 4) then {_p = [_p, _r, (random 180) + (random 180)] call ADF_fnc_randomPosMax;};
			};	
	
		// Create a crewed vehicle and send it on patrol
		[_p, _p, _s, 4, _r, 4, "MOVE", "SAFE", "RED", "LIMITED", 25, _c1, _c2] call ADF_fnc_createVehiclePatrol;
		sleep 10;
	};
} else {
	if (_ea == 0) exitWith {};
	// Create a crewed vehicle and send it on patrol
	[_p, _p, _s, 4, _r, 4, "MOVE", "SAFE", "RED", "LIMITED", 25, _c1, _c2] call ADF_fnc_createVehiclePatrol;
};

// ROAD: Armored/MBT
if (_et > 1) then {
	private "_i";
	for "_i" from 1 to _et do {
	
		// Get a random spawn position on a road with the AO		
		for "_i" from 1 to 4 do {
			private _k = [_p, _r, random 360] call ADF_fnc_randomPos;
			_rd = [_k, _rx] call ADF_fnc_roadPos;
			// If a suitable position has been found then exit else continue looking
			if (isOnRoad _rd) exitWith {_p = _rd};
			_rx = _rx + (_r / 10);
			if (_i == 3) then {_rx = _rx + (_r / 7)};
			if (_i == 4) then {_p = [_p, _r, (random 180) + (random 180)] call ADF_fnc_randomPosMax;};
		};	
		
		// Create a crewed vehicle and send it on patrol	
		[_p, _p, _s, 5, _r, 4, "MOVE", "SAFE", "RED", "LIMITED", 25, _c1, _c2] call ADF_fnc_createVehiclePatrol;
		sleep 10;
	};
} else {
	if (_et == 0) exitWith {};
	// Create a crewed vehicle and send it on patrol
	[_p, _p, _s, 5, _r, 4, "MOVE", "SAFE", "RED", "LIMITED", 25, _c1, _c2] call ADF_fnc_createVehiclePatrol;
};

// AIR: Helicopter
if (_eh > 0) then {
	private _t = selectRandom [1, 2, 3, 5];
	[_p, _p, _s, _t, (_r * 2), 30 + (random 100), 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250, _c1, _c2] call ADF_fnc_createAirPatrol;
};

// Random IED's
if (_e) then {
	private "_i";
	for "_i" from 1 to _ie do {
		private _ep = [_p, _r, random 360] call ADF_fnc_randomPos;
		[_ep, _r / 4, 100, 4.5] call ADF_fnc_createIED;
	};
};

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_createAO - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};

true