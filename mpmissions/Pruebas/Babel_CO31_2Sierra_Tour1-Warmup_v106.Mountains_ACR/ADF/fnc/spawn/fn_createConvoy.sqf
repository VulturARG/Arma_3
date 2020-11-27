/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Create Vehicle Convoy
Author: Whiztler
Script version: 1.04

File: fn_createConvoy.sqf
**********************************************************************************
ABOUT:
This function creates a convoy based on the following preferences:

- type of convoy (trucks, MRAP's, armored vehicles)
- Number of vehicles in the convoy

This is a simple convoy with only two positions. One position where the convoy
spawns and the second position is the destination position where the convoy is
deleted.

INSTRUCTIONS:
Execute (spawn) from the server or headless client.

REQUIRED PARAMETERS:
0. Position:    Spawn position. Marker, object, trigger or position array [x,y,z].
1. Position:    Destination position. Marker, object, trigger or array [x,y,z].

OPTIONAL PARAMETERS:
2: Side:        west, east or independent. Default: east
3: Number:      Type of convoy (lead vehicle is combat vehicle):
                - 1 - Random Transport truck (default)
                - 2 - Random MRAP
                - 3 - Random APC / Armored
4: Number:      Number of vehicles including the lead vehicle. Max: 10. Default: 5
6: Number:      Spawn delay timer in seconds. Default: 0. Maximum 1 hour (3600)
7. String:      Name of this convoy in case you wish to create multiple convoys. 

EXAMPLES USAGE IN SCRIPT:
["spawn_Marker", "destination_Marker", east, 1, 6, 300, "my_CSAT_convoy"] spawn ADF_fnc_createConvoy;

EXAMPLES USAGE IN EDEN:
0 = [position this, "destination_Marker", west, 3, 3, 10, "bluFor_convoy"] spawn ADF_fnc_createConvoy;

DEFAULT/MINIMUM OPTIONS
["spawn_Marker", "destination_Marker"] spawn ADF_fnc_createConvoy;

Returns
Bool (Succes flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createConvoy"};

// Init
params [
	["_ps", "", ["", [], objNull, grpNull]],
	["_pt", "", ["", [], objNull, grpNull]],
	["_s", east, [west]],
	["_a", 1, [0]],
	["_n", 5, [0]],
	["_t", 0, [0]],
	["_chk", "convoy1", [""]]
];
private _cv	= [];
private _lv	= "";
private _d	= 0;
private _ca	= [];

// Check valid vars
if ((_a > 3) || (_a < 1)) then {_a = 1;};
if (_n > 10) then {_n = 10};
if (_t > 3600) then {_t = 3600};

// Check if we should run the convoy script
if !(isNil (format ["%1_exec",_chk])) exitWith {[format ["ADF_fnc_createConvoy - convoy (%1) already executed!",_chk]] call ADF_fnc_log; false};
missionNamespace setVariable [(format ["%1_exec",_chk]), true]; 

// Sleep timer
sleep _t;

// Determine vehicle based on side and type
if (_s == west) then {
	switch (_a) do {
		case 1: {
			_cv = ["B_Truck_01_transport_F", "B_Truck_01_covered_F", "B_Truck_01_mover_F", "B_Truck_01_box_F", "B_Truck_01_Repair_F", "B_Truck_01_ammo_F", "B_Truck_01_fuel_F", "B_Truck_01_medical_F"];
			_lv = selectRandom ["B_APC_Wheeled_01_cannon_F", "B_MRAP_01_gmg_F", "B_MRAP_01_hmg_F"];
		};
		case 2: {
			_cv = ["B_MRAP_01_F", "B_MRAP_01_gmg_F", "B_MRAP_01_hmg_F"];
			_lv = selectRandom ["B_APC_Wheeled_01_cannon_F", "B_MRAP_01_gmg_F", "B_MRAP_01_hmg_F"];
		};
		case 3: {
			_cv = ["B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_CRV_F", "B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_arty_F", "B_MBT_01_TUSK_F"];
			_lv = "B_MRAP_01_F";
		};
	};
};
if (_s == east) then {
	switch (_a) do {		
		case 1: {
			_cv = ["O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F", "O_Truck_03_repair_F", "O_Truck_03_ammo_F", "O_Truck_03_fuel_F", "O_Truck_03_medical_F", "O_Truck_03_device_F", "O_Truck_02_box_F", "O_Truck_02_Ammo_F", "O_Truck_02_fuel_F", "O_Truck_02_covered_F"];
			_lv = selectRandom ["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F", "O_APC_Wheeled_02_rcws_F"];
		};
		case 2: {
			_cv = ["O_MRAP_02_F", "O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"];
			_lv = selectRandom ["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F", "O_APC_Wheeled_02_rcws_F"];
		};
		case 3: {
			_cv = ["O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F", "O_MBT_02_cannon_F", "O_MBT_02_arty_F"];
			_lv = "O_MRAP_02_F";
		};
	};
};
if (_s == independent) then {
	switch (_a) do {
		case 1: {
			_cv = ["I_Truck_02_covered_F", "I_Truck_02_transport_F", "I_Truck_02_ammo_F", "I_Truck_02_box_F", "I_Truck_02_medical_F", "I_Truck_02_fuel_F"];
			_lv = selectRandom ["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F", "I_APC_Wheeled_03_cannon_F"];
		};
		case 2: {
			_cv = ["I_MRAP_03_F", "I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"];
			_lv = selectRandom ["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F", "I_APC_Wheeled_03_cannon_F"];
		};
		case 3: {
			_cv = ["I_MBT_03_cannon_F"];
			_lv = "I_APC_Wheeled_03_cannon_F";
		};
	};
};

// Get the direction of the spawn position
if (_ps isEqualType "") then {_d = markerDir _ps} else {_d = getDir _ps};

// Create the group and create group directives 
private _g = createGroup _s;
_g setCombatMode "GREEN";
_g setFormation "COLUMN";
_g setBehaviour "CARELESS";

// Check the destination position
_pt = [_pt] call ADF_fnc_checkPosition;

// Create the waypoint first so that the convoy move immediately after spawn
private _wp = _g addWaypoint [_pt,0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointCompletionRadius 20;
_wp setWaypointFormation "COLUMN";	
	
// Create the convoy lead vehicle and add it to the convoy array
_vl = [_ps, _d, _lv, _g] call ADF_fnc_createCrewedVehicle;
_ca pushBack (_vl select 0);
(commander (_vl select 0)) setRank "MAJOR";

// Create the convoy vehicles
private "_i";
private _r = -15;
for "_i" from 1 to _n do {
	_v = [((_vl select 0) modelToWorld [0,_r,0]), 0, selectRandom _cv, _g] call ADF_fnc_createCrewedVehicle;
	(_v select 0) setDir _d;
	_ca pushBack (_v select 0);
	_r = _r - 15;
};

// Set the convoy vehicle directives
{_x forceFollowRoad true; _x setConvoySeparation 50; _x limitSpeed 70} forEach _ca;

// Once the convoy reaches its destination it will be deleted. The convoy has 30 seconds to catch up with the lead vehicle
waitUntil {sleep 1; ((currentWaypoint (_wp select 0)) > (_wp select 1))};
private _t = time;
waitUntil {sleep 0.5; time > (_t + 30)};
[_ca] call ADF_fnc_delete;

// Return success flag
true