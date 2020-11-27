/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Create Vehicle Patrol
Author: Whiztler
Script version: 1.12

File: fn_createVehiclePatrol.sqf
**********************************************************************************
ABOUT:
This function creates a vehicle and vehicle crew and sends the vehicle out on
patrol. The function creates waypoints on roads in a given radius. You can define
which type of vehicle will be created.

INSTRUCTIONS:
Make sure the spawn position is close to roads (or on a road) and roads are within
the radius. Keep the radius below 1500 else the script might take a long time to
search for suitable locations.
Execute from the server or headless client.

REQUIRED PARAMETERS:
0. Position:    Spawn position. Marker, object, trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
1. Position:    Patrol position.Marker, object, trigger or position array [x,y,z]
                Default: "" (Spawn position ill be used)
2: Side:        west, east or independent. Default: east
3: Nbr/Str:     Type of vehicle:
                - 1 - Random Transport truck (default)
                - 2 - Random Unarmed MRAP/Car
                - 3 - Random Armed MRAP/Car
                - 4 - Random APC
                - 5 - Random Armored
			  In case of a string then the vehicle class will be used.
4: Number:      Patrol radius in meters from the spawn position.  (default = 750)
6: Number:      Number of patrol waypoints (default = 4)
7. String:      Waypoint type. Info: https://community.bistudio.com/wiki/Waypoint_types (default = "MOVE")
8. String:      Waypoint behavior. Info: https://community.bistudio.com/wiki/setWaypointBehaviour (default = "SAFE")
9. String:      Combat mode. Info: https://community.bistudio.com/wiki/setWaypointCombatMode (default = "YELLOW")
10. String:     Waypoint speed. Info: https://community.bistudio.com/wiki/waypointSpeed (default = "LIMITED")
11. String:     Waypoint formation. Info: https://community.bistudio.com/wiki/waypointFormation (default = "COLUMN")
12. Number:     Completion radius. Info: https://community.bistudio.com/wiki/setWaypointCompletionRadius (default = 25)
13. String:     Code to execute on each unit of the crew (e.g. a function).
                Default = "". Code is CALLED. Each unit of the group is passed
                (_this select 0) to the code/fnc.
14. String:     Code to execute on the crew as a group (e.g. a function).
                Default = "". Code is CALLED. The group is passed
                (_this select 0) to the code/fnc.   

EXAMPLES USAGE IN SCRIPT:
["SpawnMarker", "PatrolMarker", east, 4, 800, 5, "MOVE", "SAFE", "RED", "LIMITED", 25, "myFunction", "anotherFunction"] call ADF_fnc_createVehiclePatrol;
["SpawnMarker", "PatrolMarker", east, "O_G_Offroad_01_armed_F", 800, 5, "MOVE", "SAFE", "RED", "LIMITED", 25, "myFunction", "anotherFunction"] call ADF_fnc_createVehiclePatrol;

EXAMPLES USAGE IN EDEN:
["SpawnMarker", west] call ADF_fnc_createVehiclePatrol;

DEFAULT/MINIMUM OPTIONS
["SpawnMarker"] call ADF_fnc_createVehiclePatrol;

RETURNS:
Array:          0. new vehicle (Object).
                1. all crew (Array of Objects).
                2. vehicle's group (Group).
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createVehiclePatrol"};

private _dt = diag_tickTime;

// Init
params [
	["_ps", "", ["", [], objNull, grpNull]],
	["_pp", "", ["", [], objNull, grpNull]],
	["_gs", east, [west]],
	["_vt", 1, [0, ""]],
	["_r", 1000, [0]],
	["_c", 4, [0]],
	["_t", "MOVE", [""]],
	["_b", "UNCHANGED", [""]],
	["_m", "YELLOW", [""]],
	["_s", "NORMAL", [""]],
	["_cr", 15, [0]],
	["_c1", "", [""]],
	["_c2", "", [""]]		
];
private _vc = "";

// Check valid vars
if !(_gs in [west, east, independent]) exitWith {[format ["ADF_fnc_createVehiclePatrol - %1  side passed. Exiting", _gs], true] call ADF_fnc_log; objNull};
if (_c1 != "") then {if (isNil _c1) then {if (ADF_debug) then {[format ["ADF_fnc_createVehiclePatrol - incorrect code (%1) passed. Defaulted to ''.", _c1]] call ADF_fnc_log;}; _c1 = "";}};
if (_c2 != "") then {if (isNil _c2) then {if (ADF_debug) then {[format ["ADF_fnc_createVehiclePatrol - incorrect code (%1) passed. Defaulted to ''.", _c2]] call ADF_fnc_log;}; _c2 = "";}};
if !(_vt isEqualType "") then {if (_vt > 5 || _vt < 1) then {_vt = 1;}};

// Determine vehicle based on side and type
if (_vt isEqualType 0) then {
	if (_gs == west) then {
		switch (_vt) do {
			case 1: {_vc = selectRandom ["B_Truck_01_transport_F", "B_Truck_01_covered_F", "B_Truck_01_mover_F", "B_Truck_01_box_F", "B_Truck_01_Repair_F", "B_Truck_01_ammo_F", "B_Truck_01_fuel_F", "B_Truck_01_medical_F"]};
			case 2: {_vc = selectRandom ["B_MRAP_01_F", "B_Quadbike_01_F"]};
			case 3: {_vc = selectRandom ["B_MRAP_01_gmg_F", "B_MRAP_01_hmg_F"]};
			case 4: {_vc = selectRandom ["B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_CRV_F", "B_APC_Wheeled_01_cannon_F"]};
			case 5: {_vc = selectRandom ["B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_arty_F", "B_MBT_01_TUSK_F"]};
		}
	};
	if (_gs == east) then {
		switch (_vt) do {		
			case 1: {_vc = selectRandom ["O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F", "O_Truck_03_repair_F", "O_Truck_03_ammo_F", "O_Truck_03_fuel_F", "O_Truck_03_medical_F", "O_Truck_03_device_F", "O_Truck_02_box_F", "O_Truck_02_Ammo_F", "O_Truck_02_fuel_F", "O_Truck_02_covered_F"]};
			case 2: {_vc = selectRandom ["O_MRAP_02_F", "O_Quadbike_01_F"]};
			case 3: {_vc = selectRandom ["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"]};
			case 4: {_vc = selectRandom ["O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F"]};
			case 5: {_vc = selectRandom ["O_APC_Tracked_02_AA_F", "O_MBT_02_cannon_F", "O_MBT_02_arty_F"]};
		};
	};
	if (_gs == independent) then {
		switch (_vt) do {
			case 1: {_vc = selectRandom ["I_Truck_02_covered_F", "I_Truck_02_transport_F", "I_Truck_02_ammo_F", "I_Truck_02_box_F", "I_Truck_02_medical_F", "I_Truck_02_fuel_F"]};
			case 2: {_vc = selectRandom ["I_MRAP_03_F", "I_Quadbike_01_F"]};
			case 3: {_vc = selectRandom ["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"]};
			case 4: {_vc = "I_APC_Wheeled_03_cannon_F"};
			case 5: {_vc = "I_MBT_03_cannon_F"};
		};
	};
} else {
	_vc = _vt;
};

//Create the crew and determine the spawn direction
private _g 	= createGroup _gs;
private _vd	= if (typeName _ps == "STRING") then {markerDir _ps} else {random 360};
_g deleteGroupWhenEmpty true;

// Check the location position. If no patrol position was provided then assume the spawn position as the patrol position
_ps = [_ps] call ADF_fnc_checkPosition;
if (typeName _pp == "STRING") then {
	if (_pp == "") then {
		_pp = _ps
	} else {
		_pp = [_pp] call ADF_fnc_checkPosition;
	};
} else {
	_pp = [_pp] call ADF_fnc_checkPosition;
};

// create the vehicle
private _v = [_ps, _vd, _vc, _g] call ADF_fnc_createCrewedVehicle;

// Execute custom passed code/function
if (_c1 != "") then {
	// Each unit in the crew
	{[_x] call (call compile format ["%1", _c1])} forEach units _g;
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createVehiclePatrol - call %1 for units of group: %2",_c1,_g]] call ADF_fnc_log};
};

if (_c2 != "") then {
	// Crew
	[_g] call (call compile format ["%1", _c2]);
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createVehiclePatrol - call %1 for group: %2",_c2,_g]] call ADF_fnc_log};	
};

// Create the vehicle patrol
[_g, _pp, _r, _c, _t, _b, _m, _s, _cr, "car", false] call ADF_fnc_vehiclePatrol;

if !(_vt isEqualType "") then {if (_vt > 2) then {[_g] spawn ADF_fnc_waypointCombat}}; // v1.11

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_createVehiclePatrol - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};

// Return the vehicle array
_v