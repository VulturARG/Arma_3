/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_ambientAirTraffic
Author: Whiztler
Script version: 1.07

File: fn_ambientAirTraffic.sqf
**********************************************************************************
ABOUT
Function to create ambient air traffic. You can create thru/thru traffic (no
landing) or traffic that lands and takes off again from an airport/helipad.
If landing is enabled the aircraft simulates a startup procedure before taking off
The aircraft remains stationary with the engine running until cleared for takeoff.
After the aircraft reaches the terminate location, the vehicle, group and crew are
deleted and the cycle starts again after a random pause (min max time configurable)

You can send along a variable as a string. The variable is checked at the end of 
each spawn cycle. If the variable returns true then the cycle stops and does not 
spawn a new aircraft. Example

in your script init: stop_air_show = false;
Pass along as "stop_air_show" (11th parameter)
In your script use stop_air_show = true to stop ambient air spawning of that specific
instance.

INSTRUCTIONS:
Execute (spawn) the function on the server or HC.

REQUIRED PARAMETERS:
0. Array:       Array of possible spawn locations. Markers, object, triggers, 
                etc. E.g.: ["startPos1", "startPos2", "startPos3"]
1. Array:       Array of possible terminate locations. Markers, object, triggers, 
                etc.
                E.g.: ["endPos1", "endPos2", "endPos3"]
2. Location     Landing location. Marker, object, trigger or position
                array [x, y, z]
                Helipad for helicopters, location on tarmac for jets.
                E.g.: MyHeliPad
                If you prefer thru and thru traffic (no landing) then use:
                FALSE

OPTIONAL PARAMETERS:              
3. Number       Minimum number of minutes to wait before a new aircraft
                spawns (default: 3 min)
4. Number       Maximum number of minutes to wait before a new aircraft
                spawns (default: 30 min)
5. Side         Side of aircraft west, east, independent, civilian (default: east)
6. Bool         Type of aircraft:
                - true: Helicopters (default)
                - False: airplanes
7. Bool         Attack or transport aircraft
                true: attack aircraft 
                false: transport aircraft (default)  
5. String:      Code to execute on each unit of the crew (e.g. a function).
                Default = "". Code is CALLED. Each unit of the group is passed
                (_this select 0) to the code/fnc.
6. String:      Code to execute on the crew aa a group (e.g. a function).
                Default = "". Code is CALLED. The group is passed
                (_this select 0) to the code/fnc.    
10: Bool:       Does the crew respond to enemy behavior:
                - true: Docile crew does not attack enemy (default: true)
                - false: Normal behavior
11: String:     This can be a variable set to either true or false. At the end off
                each cycle it checks the variable. If set to true it stops the
                cycle. By default it is set to false (infinite cycle).
12: Side/Bool   If you want the crew to be of a different side than that of the
                aircraft then enter the side here. Else it will default in false.

EXAMPLES USAGE IN SCRIPT:
[["startPos1", "startPos2", "startPos3"], ["endPos1", "endPos2", "endPos3"], MyHeliPad, 5, 30, west, true, false, "myFunction", "", true, "AirLoop", independent] spawn ADF_fnc_ambientAirTraffic;

EXAMPLES USAGE IN EDEN:
[["startPos1", "startPos2", "startPos3"], ["endPos1", "endPos2", "endPos3"], MyHeliPad, 5, 30, west, true, false] spawn ADF_fnc_ambientAirTraffic;

DEFAULT/MINIMUM OPTIONS
[["startPos1", "startPos2", "startPos3"], ["endPos1", "endPos2", "endPos3"], MyHeliPad] spawn ADF_fnc_ambientAirTraffic;

RETURNS:
True
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_ambientAirTraffic"};

// Init
params [
	["_spawn", [0, 0, 0], ["", [], objNull, grpNull]], 
	["_term", [0, 0, 0], ["", [], objNull, grpNull]], 
	["_land", [0, 0, 0], ["", [], objNull, false]], 
	["_hmin", 180, [0]], 
	["_hmax", 1800, [0]], 
	["_s", east, [east]], 
	["_t", true, [true]], 
	["_a", false, [false]], 
	["_f1", "", [""]], 
	["_f2", "", [""]], 
	["_b", true, [true]], 
	["_z", false, ["", true]],
	["_cs", false, [west, false]]
];
private _va = [];
private _pl = [];
private _tt = false;

// Check valid vars
if (_hmin < 1) then {_hmin = 1;};
if (_hmax > 6000) then {_hmax = 5400;};
if (_f1 != "") then {if (isNil _f1) then {_f1 = ""}; if (ADF_debug) then {[format ["ADF_fnc_ambientAirTraffic - incorrect code (%1) passed for group: %2. Defaulted to ''.", _f1, _g]] call ADF_fnc_log;}};
if (_f2 != "") then {if (isNil _f2) then {_f2 = ""}; if (ADF_debug) then {[format ["ADF_fnc_ambientAirTraffic - incorrect code (%1) passed for group: %2. Defaulted to ''.", _c1, _g]] call ADF_fnc_log;}};

// Assign aircraft array based on the requested side
switch (_s) do {
	case west: {
		if (_a) then {
			_va = [
				["B_Heli_Light_01_armed_F", "B_Heli_Attack_01_F"], // Helicopters
				["B_Plane_CAS_01_F", "B_UAV_02_CAS_F", "B_T_UAV_03_F"] // airplanes/UAVS
			];
		} else {
			_va = [
				["B_Heli_Light_01_F", "B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F", "B_Heli_Transport_03_F", "B_Heli_Transport_03_black_F", "B_Heli_Transport_03_unarmed_green_F", "B_CTRG_Heli_Transport_01_sand_F", "B_CTRG_Heli_Transport_01_tropic_F"], // Helicopters
				["B_T_VTOL_01_infantry_F", "B_T_VTOL_01_vehicle_F", "B_T_VTOL_01_armed_F", "B_T_VTOL_01_armed_olive_F"] // airplanes
			];		
		};
	};
	
	case east: {
		if (_a) then {
			_va = [
				["O_Heli_Light_02_F", "O_Heli_Attack_02_F", "O_Heli_Attack_02_black_F"], // Helicopters
				["O_Plane_CAS_02_F", "O_UAV_02_CAS_F", "O_T_VTOL_02_infantry_F", "O_T_VTOL_02_vehicle_F"] // airplanes
			];
		} else {
			_va = [
				["O_Heli_Light_02_unarmed_F", "O_Heli_Light_02_v2_F", "O_Heli_Transport_04_F", "O_Heli_Transport_04_ammo_F", "O_Heli_Transport_04_bench_F", "O_Heli_Transport_04_box_F", 
				"O_Heli_Transport_04_covered_F", "O_Heli_Transport_04_fuel_F", "O_Heli_Transport_04_medevac_F", "O_Heli_Transport_04_repair_F", "O_Heli_Transport_04_black_F", 
				"O_Heli_Transport_04_ammo_black_F", "O_Heli_Transport_04_bench_black_F", "O_Heli_Transport_04_box_black_F", "O_Heli_Transport_04_covered_black_F", 
				"O_Heli_Transport_04_fuel_black_F", "O_Heli_Transport_04_medevac_black_F", "O_Heli_Transport_04_repair_black_F"], // Helicopters
				["O_T_VTOL_02_infantry_hex_F", "O_T_VTOL_02_infantry_ghex_F", "O_T_VTOL_02_infantry_grey_F", "O_T_VTOL_02_vehicle_hex_F", "O_T_VTOL_02_vehicle_ghex_F", "O_T_VTOL_02_vehicle_grey_F"] // airplanes
			];		
		};
	};
	
	case independent: {
		if (_a) then {
			_va = [
				["I_Heli_light_03_F", "I_Heli_light_03_dynamicLoadout_F"], // Helicopters
				["I_Plane_Fighter_03_CAS_F", "I_Plane_Fighter_03_AA_F", "I_UAV_02_CAS_F"] // airplanes?UAVS
			];
		} else {
			_va = [
				["I_Heli_Transport_02_F", "I_Heli_light_03_unarmed_F"], // Helicopters
				["I_UAV_02_F", "I_C_Plane_Civil_01_F"] // UAVS
			];		
		};
	};
	
	case civilian: {
		_va = [
			["C_Heli_Light_01_civil_F", "I_Heli_Transport_02_F", "C_Heli_light_01_blue_F", "C_Heli_light_01_red_F", "C_Heli_light_01_blueLine_F", "C_Heli_light_01_digital_F", 
			"C_Heli_light_01_elliptical_F", "C_Heli_light_01_furious_F", "C_Heli_light_01_graywatcher_F", "C_Heli_light_01_jeans_F", "C_Heli_light_01_light_F", 
			"C_Heli_light_01_shadow_F", "C_Heli_light_01_sheriff_F", "I_Heli_Transport_02_F", "C_Heli_light_01_speedy_F", "C_Heli_light_01_sunset_F", "C_Heli_light_01_vrana_F", 
			"C_Heli_light_01_wasp_F", "C_Heli_light_01_wave_F", "C_Heli_light_01_stripped_F", "C_Heli_light_01_luxe_F", "I_Heli_Transport_02_F"], // Helicopters
			["C_Plane_Civil_01_F", "C_Plane_Civil_01_racing_F", "I_C_Plane_Civil_01_F"] // Airplanes
		];	
	};
};

// Check type of aircraft
_va = if (_t) then {_va select 0} else {_va select 1};
if (ADF_debug) then {[format ["ADF_fnc_ambientAirTraffic - selected aircraft array: %1", _va]] call ADF_fnc_log};

// Check if thru & thru traffic -or- landing/takeoff traffic
if 	(_land isEqualType false) then {
	_tt = true;
	if (ADF_debug) then {["ADF Debug: ADF_fnc_ambientAirTraffic - Through & Through traffic selected. No landing"] call ADF_fnc_log};
} else {_pl 	= [_land] call ADF_fnc_checkPosition};

// Check if the vehicle crew is of the same side as the aircraft side
if (_cs isEqualType false) then {_cs = _s};

///// Start the show

waitUntil {
	// set the scope
	scopeName "trafficLoop";
	
	// select a random spawn and terminate position. Check which kind of location position for spawn, terminate and land.
	private _ps	= selectRandom _spawn;
	private _pt	= selectRandom _term;
	
	// Are spawn and terminate position the same? 
	if (_ps isEqualTo _pt) then {
		// Try 3 times to make sure the spawn and terminate position are not the same. If still the same then assume it was intentional.
		private "_i";
		for "_i" from 1 to 3 do {		
			_pt = selectRandom _term;
			_ps = selectRandom _spawn;
			if !(_ps isEqualTo _pt) exitWith {};
		};	
	};		

	// Check the position location
	_ps = [_ps] call ADF_fnc_checkPosition;
	_pt = [_pt] call ADF_fnc_checkPosition;		
	if (ADF_debug) then {[format ["ADF_fnc_ambientAirTraffic - spawn: %1 - exit: %2", _ps, _pt]] call ADF_fnc_log};
	if (ADF_debug && !_tt) then {[format ["ADF_fnc_ambientAirTraffic - landing at: %1", _pl]] call ADF_fnc_log};
	
	// check if one of the locations (spawn, terminate or land) is 0, 0, 0. If it is then set the error var to true.
	{
		if (_x isEqualTo [0, 0, 0]) exitWith {
		private _m = format ["Incorrect location provided. %1: %2", (if _x == _ps) then {"Spawn"} else {"Terminate"}, _x];
		["ADF_fnc_ambientAirTraffic", _m] call ADF_fnc_terminateScript;	
		breakOut "trafficLoop";
		};	
	} forEach [_ps, _pt];
	if !(_tt) then {
		if (_pl isEqualTo [0, 0, 0]) exitWith {
		private _m = format ["Incorrect location provided. Land: %1", _pl];
		["ADF_fnc_ambientAirTraffic", _m] call ADF_fnc_terminateScript;	
		breakOut "trafficLoop";
		};
	};				
	
	// Select an aircraft from the predetermined array per side and type
	private _vc	= selectRandom _va;
	if (ADF_debug) then {[format ["ADF_fnc_ambientAirTraffic - selected aircraft: %1", _vc]] call ADF_fnc_log};

	// random cycle sleep and random wait sleep before takeoff	
	private _h 	= [_hmin * 60, _hmax * 60] call BIS_fnc_randomNum;
	private _w 	= [_hmin * 60, _hmin * 15] call BIS_fnc_randomNum;
	if (ADF_debug) then {[format ["ADF_fnc_ambientAirTraffic - cycle sleep: %1 secs - takeoff delay: %2 secs", _h, _w]] call ADF_fnc_log};

	// Create the vehicle and crew
	private _c 	= createGroup _cs;	
	private _vx	= [_ps, random 360, _vc, _c, _f1, _f2, true] call ADF_fnc_createCrewedVehicle;
	private _v	= _vx select 0;
	
	//Reskin the CH-49 for civilian use
	if ((_s == civilian) && (_vc == "I_Heli_Transport_02_F")) then {
		if ((random 1) > .5) then {
			_v setObjectTextureGlobal [0, "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa"];
			_v setObjectTextureGlobal [1, "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa"];
			_v setObjectTextureGlobal [2, "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"];
		} else {
			_v setObjectTextureGlobal [0, "a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa"];
			_v setObjectTextureGlobal [1, "a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa"];
			_v setObjectTextureGlobal [2, "a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"]; 				
		};
	};
	
	// Lock the aircraft for players 
	_v lock 3;
	
	// For docile pilots we give them lots of alcohol
	if (_b) then {[driver _v] call ADF_fnc_heliPilotAI};
	
	// Set a random altitude. Planes get a higher altitude
	if (_t) then {_v flyInHeight 50 + (random 50)} else {_v flyInHeight 100 + (random 100)};

	// Check if landing is needed. Start flight
	if !(_tt) then {
		private _wp = _c addWaypoint [_pl, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
					
		// Wait at airport/helipad. Helis wait till they reach the WP
		if (_t) then {_wp setWaypointCompletionRadius 25; waitUntil {sleep 1; ((currentWaypoint (_wp select 0)) > (_wp select 1)) || !(alive _v)}};			
		_v flyInHeight 0;
		_v land "land";
		
		// Start timer in case the aircraft gets stuck somehow. Aircraft has 60 secs (jets 180 secs) to land. If successful with landing, it will wait on the tarmac before takeoff.
		private _m = time;
		private _n = 60;
		if !(_t) then {_n = 180};
		if (ADF_debug) then {[format ["ADF_fnc_ambientAirTraffic - Landing timer started at: %1", time]] call ADF_fnc_log};

		// Touchdown
		waitUntil {isTouchingGround _v || (time > (_m + _n)) || !(alive _v)};
		if !(alive _v) exitWith {};
		if (time > (_m + _n)) exitWith {if (ADF_debug) then {[format ["ADF_fnc_ambientAirTraffic - Aircraft could not land. Timer ran out: %1 secs", time-_m]] call ADF_fnc_log}};
		if (ADF_debug) then {[format ["ADF_fnc_ambientAirTraffic - Aircraft touchdown. Timer %1 secs", time-_m]] call ADF_fnc_log};
		
		// Switch off and wait
		_v flyInHeight 0;
		_v setFuel 0;			
		if (_t) then {{_v animateDoor [(configName _x), 1]} forEach ("((toLower (getText (_x >> 'source'))) == 'door')" configClasses (configFile >> "CfgVehicles" >> (typeOf _v) >> "AnimationSources"))};
		sleep _w;
		
		// Take off for termination waypoint
		if !(alive _v) exitWith {};
		_v setFuel 1;
		_v engineOn true;
		_v flyInHeight 0;
		if (_t) then {{_v animateDoor [(configName _x), 0]} forEach ("((toLower (getText (_x >> 'source'))) == 'door')" configClasses (configFile >> "CfgVehicles" >> (typeOf _v) >> "AnimationSources"))};
		
		// Do checklist and wait for takeoff clearing
		sleep ([60, 180] call BIS_fnc_randomNum);			
		if (_t) then {_v flyInHeight 50 + (random 50)} else {_v flyInHeight 100 + (random 100)};
	};
	
	// Terminate waypoint
	private _wp = _c addWaypoint [_pt, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "NORMAL";		
	
	// Wait till the termination waypoint is reached and delete the aircraft and its crew
	waitUntil {sleep 1; ((currentWaypoint (_wp select 0)) > (_wp select 1)) || !(alive _v)};	
	if !(isNil "_v") then {[_v] call ADF_fnc_delete};
	
	// Rewind
	sleep _h;
	
	// Check cycle loop status
	if (_z isEqualType "") then {missionNamespace getVariable [_z, false]} else {_z}
};

true