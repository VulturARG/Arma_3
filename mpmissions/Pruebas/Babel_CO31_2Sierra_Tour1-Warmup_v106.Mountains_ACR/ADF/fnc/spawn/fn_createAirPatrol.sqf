/*********************************************************************************
 _____ ____  _____
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Create Air Patrol
Author: Whiztler
Script version: 1.14

File: fn_createAirPatrol.sqf
**********************************************************************************
ABOUT
This module creates a crewed aircaft that patrols a given position. The
module creates waypoints in a given radius. You can define which type of aircaft.

INSTRUCTIONS:
Execute from the server or headless client.

REQUIRED PARAMETERS:
0. Position:    Spawn position. Marker, Object or Trigger.

OPTIONAL PARAMETERS:
1. Position:    Patrol position. Marker, Object or Trigger.
                Default: "" (Spawn position will be used)
2: Side:        west, east or independent. Default: east
3: Number:      Type of aircraft:
                - 1 - Unarmed transport helicopter (default)
                - 2 - Armed transport helicopter
                - 3 - Attack helicopter
                - 4 - Fighter jet
                - 5 - UAV
4. Number:      Patrol radius in meters from the patrol position. Default: 2500
5. Number:      Altitude. The aircraft patrol altitude in meters. Default: 75
6. Number:      Number of patrol waypoints. Default: 4
7. String       Waypoint type. Info: https://community.bistudio.com/wiki/Waypoint_types (default = "MOVE")
8. String       Waypoint behaviour. Info: https://community.bistudio.com/wiki/setWaypointBehaviour (default = "SAFE")
9. String:      Combat mode. Info: https://community.bistudio.com/wiki/setWaypointCombatMode (default = "YELLOW")
10. String:     Waypojnt speed. Info: https://community.bistudio.com/wiki/waypointSpeed (default = "LIMITED")
11. String:     Waypoint formation. Info: https://community.bistudio.com/wiki/waypointFormation (default = "COLUMN")
12. Number:     Completion radius. Info: https://community.bistudio.com/wiki/setWaypointCompletionRadius (default = 250)
13. String:     Code to execute on each unit of the crew (e.g. a function).
                Default = "". Code is CALLED. Each unit of the group is passed (_this select 0) to the code/fnc.
14. String:     Code to execute on the crew aa a group (e.g. a function).
                Default = "". Code is CALLED. The group is passed (_this select 0) to the code/fnc.

EXAMPLES USAGE IN SCRIPT:
[_spawnPos, _patrolPos, west, 1, 2500, 100, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250, "ADF_fnc_heliPilotAI", ""] call ADF_fnc_createAirPatrol;

EXAMPLES USAGE IN EDEN:
[getMarkerPos "myMarker", getMarkerPos "PatrolMarker", east, 2, 3500, 50, 6, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250, "", ""] call ADF_fnc_createAirPatrol;

DEFAULT/MINIMUM OPTIONS
["myMarker"] call ADF_fnc_createAirPatrol;

RETURNS:
Array:          0. new vehicle (Object).
                1. all crew (Array of Objects).
                2. vehicle's group (Group).
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createAirPatrol"};

// Init
private _dt = diag_tickTime;
params [
	["_ps", "", ["", [], objNull, grpNull]],
	["_pp", "", ["", [], objNull, grpNull]],
	["_gs", east, [west]],
	["_gc", 1, [0]],
	["_r", 2500, [0]],
	["_h", 75, [0]],		
	["_c", 4, [0]],
	["_t", "MOVE", [""]],
	["_b", "SAFE", [""]],
	["_m", "YELLOW", [""]],
	["_s", "LIMITED", [""]],
	["_f", "COLUMN", [""]],
	["_cr", 150, [0]],
	["_c1", "", [""]],
	["_c2", "", [""]]	
];
private _vc = "";

// Check valid vars
if (_c1 != "") then {if (isNil _c1) then {if (ADF_debug) then {[format ["ADF_fnc_createAirPatrol - incorrect code (%1) passed. Defaulted to ''.", _c1]] call ADF_fnc_log;}; _c1 = "";}};
if (_c2 != "") then {if (isNil _c2) then {if (ADF_debug) then {[format ["ADF_fnc_createAirPatrol - incorrect code (%1) passed. Defaulted to ''.", _c2]] call ADF_fnc_log;}; _c2 = "";}};

// Check the location position. If no patrol position was provided then assume the spawn position as the patrol position
if (typeName _ps != "ARRAY") then {_ps = [_ps] call ADF_fnc_checkPosition};
if (typeName _pp == "STRING") then {if (_pp == "") then {_pp = _ps}};

// Select the aircraft based on side, type, etc
if (_gs == west) then {
	switch (_gc) do {
		case 1: {_vc = selectRandom ["B_Heli_Light_01_F", "B_Heli_Transport_03_unarmed_F", "B_Heli_Transport_03_unarmed_green_F"]};
		case 2: {_vc = selectRandom ["B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F", "B_Heli_Transport_03_F", "B_Heli_Transport_03_black_F"]};
		case 3: {_vc = selectRandom ["B_Heli_Attack_01_F", "B_Heli_Light_01_armed_F"]};
		case 4: {_vc = "B_Plane_CAS_01_F"};
		case 5: {_vc = "B_UAV_02_CAS_F"};
	}
};
if (_gs == east) then {
	switch (_gc) do {		
		case 1: {_vc = selectRandom ["O_Heli_Light_02_unarmed_F", "O_Heli_Transport_04_F", "O_Heli_Transport_04_ammo_F", "O_Heli_Transport_04_bench_F", "O_Heli_Transport_04_box_F", "O_Heli_Transport_04_covered_F", "O_Heli_Transport_04_fuel_F", "O_Heli_Transport_04_medevac_F", "O_Heli_Transport_04_repair_F", "O_Heli_Transport_04_black_F"]};
		case 2: {_vc = selectRandom ["O_Heli_Light_02_F", "O_Heli_Light_02_v2_F"]};
		case 3: {_vc = selectRandom ["O_Heli_Attack_02_F", "O_Heli_Attack_02_black_F"]};
		case 4: {_vc = "O_Plane_CAS_02_F"};
		case 5: {_vc = "O_UAV_02_CAS_F"};
	};
};
if (_gs == independent) then {
	switch (_gc) do {
		case 1: {_vc = selectRandom ["I_Heli_light_03_unarmed_F", "I_Heli_Transport_02_F"]};
		case 2: {_vc = "I_Heli_light_03_F"};
		case 3: {_vc = "I_Heli_light_03_F"};
		case 4: {_vc = selectRandom ["I_Plane_Fighter_03_CAS_F", "I_Plane_Fighter_03_AA_F"]};
		case 5: {_vc = "I_UAV_02_CAS_F"};
	};
};

// Create the vehicle and vehicle crew
private _g = createGroup _gs;
_g deleteGroupWhenEmpty true;
private _v = [_ps, (random 360), _vc, _g] call ADF_fnc_createCrewedVehicle;
(_v select 0) setPosATL [_ps select 0, _ps select 1, _h];

// Execute custom passed code/function
if (_c1 != "") then {
	// Each unit in the crew
	{[_x] call (call compile format ["%1", _c1])} forEach units _g;
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createAirPatrol - call %1 for units of the aircraft crew: %2",_c1,_g]] call ADF_fnc_log};
};

if (_c2 != "") then {
	// Crew group
	[_g] call (call compile format ["%1", _c2]);
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createAirPatrol - call %1 for crew (group): %2",_c2,_g]] call ADF_fnc_log};	
};

// Execute the air patrol function
[_g, _pp, _r, _h, _c, _t, _b, _m, _s , _f , _cr] call ADF_fnc_airPatrol;

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_createAirPatrol - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};

// return the vehicle, crew and group array
_v