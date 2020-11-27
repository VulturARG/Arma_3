/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Create Foot Patrol
Author: Whiztler
Script version: 1.14

File: ADF_fnc_createFootPatrol.sqf
**********************************************************************************
ABOUT
This function creates a group (2, 4 or 8 pax) that patrols a given position. The 
function creates waypoints in a radius. There are options you can define 
such as waypoint behaviour/speed/etc. and search nearest building.
You can execute (optional) two functions. One for the group and one for each unit
of the group.

INSTRUCTIONS:
Execute from the server or headless client.

REQUIRED PARAMETERS:
0: Position:    Spawn position. Marker, Object or Trigger.              

OPTIONAL PARAMETERS:
1. Side:        west, east or independent. Default: east
2. Number:      Group size: 1 - 8 units. Default: 4
3. Bool:        true for weapons squad, false for rifle squad. Default: false
4. Number:      Radius in meters from the spawn position. Default: 250
5. Number:      Number of patrol waypoints. Default: 4
6. String:      Waypoint type. Info: https://community.bistudio.com/wiki/Waypoint_types (Default: "MOVE")
7. String:      Waypoint behaviour. Info: https://community.bistudio.com/wiki/setWaypointBehaviour (Default: "SAFE")
8. String:      Combat mode. Info: https://community.bistudio.com/wiki/setWaypointCombatMode (Default: "YELLOW")
9. String:      Waypojnt speed. Info: https://community.bistudio.com/wiki/waypointSpeed (Default: "LIMITED")
10. String:     Waypoint formation. Info: https://community.bistudio.com/wiki/waypointFormation
11. Number:     Completion radius. Info: https://community.bistudio.com/wiki/setWaypointCompletionRadius
12. Bool:       Search buildings (patrol units):
                - true: search nearest building
                - false: Do not search nearest building. (Default)
13. String:     Code to execute on each unit of the crew (e.g. a function).
                Default = "". Code is CALLED. Each unit of the group is passed
                (_this select 0) to the code/fnc.
14. String:     Code to execute on the crew aa a group (e.g. a function).
                Default = "". Code is CALLED. The group is passed
                (_this select 0) to the code/fnc. 

EXAMPLES USAGE IN SCRIPT:
[_spawnPos, west, 6, true, 1000, 6, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true, "", ""] call ADF_fnc_createFootPatrol;

EXAMPLES USAGE IN EDEN:
["myMarker", east, 8, true, 500, 6, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, false, "fnc_myFunction", ""] call ADF_fnc_createFootPatrol;

DEFAULT/MINIMUM OPTIONS
["myMarker"] call ADF_fnc_createFootPatrol;

RETURNS:
Group
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createFootPatrol"};

// Init
private _dt = diag_tickTime;
params [
	["_p", "", ["", [], objNull, grpNull]],
	["_gs", east, [west]],
	["_gc", 5,[0]],
	["_gw", false, [true]],
	["_r", 250,[0]],
	["_c", 4,[0]],
	["_t", "MOVE", [""]],
	["_b", "SAFE", [""]],
	["_m", "YELLOW", [""]],
	["_s", "LIMITED", [""]],
	["_f", "COLUMN", [""]],
	["_cr", 5,[0]],
	["_sb", false, [true]],
	["_c1", "", [""]],
	["_c2", "", [""]]
];

// Check valid vars
if (_gs == sideLogic) exitWith {[format ["ADF_fnc_createFootPatrol - %1  side passed. Exiting", _gs], true] call ADF_fnc_log; grpNull};
if (_c1 != "") then {if (isNil _c1) then {if (ADF_debug) then {[format ["ADF_fnc_createFootPatrol - incorrect code (%1) passed. Defaulted to ''.", _c1]] call ADF_fnc_log;}; _c1 = "";}};
if (_c2 != "") then {if (isNil _c2) then {if (ADF_debug) then {[format ["ADF_fnc_createFootPatrol - incorrect code (%1) passed. Defaulted to ''.", _c2]] call ADF_fnc_log;}; _c2 = "";}};
if (_gc > 8) then {_gc = 8;};
if (_gc < 2) then {_gc = 2;};

// Check the location position
_p = [_p] call ADF_fnc_checkPosition;

private _gi	= "";
private _gd	= "";
private _gf	= "";

// check group size/type
private _gz = switch (_gc) do {
	case 1;
	case 2: {"InfSentry"};
	case 3;
	case 4;
	case 5: {selectRandom ["InfTeam","InfTeam_AA","InfTeam_AT"]};
	case 6;
	case 7;
	case 8: {if (_gw) then {"InfSquad_Weapons"} else {"InfSquad"}};		
	default {"InfTeam"};
};

switch (_gs) do {
	case west:			{_gd = "WEST"; _gf = "BLU_F"; _gi = "BUS_"};
	case east: 			{_gd = "EAST"; _gf = "OPF_F"; _gi = "OIA_"};
	case independent:		{_gd = "INDEP"; _gf = "IND_F"; _gi = "HAF_"};
};

private _gt = format ["%1%2",_gi,_gz];

//Create the group
private _g = [_p, _gs, (configFile >> "CfgGroups" >> _gd >> _gf >> "Infantry" >> _gt)] call BIS_fnc_spawnGroup;
_g deleteGroupWhenEmpty true;

// Execute custom passed code/function
if (_c1 != "") then {
	// Each unit in the group
	{[_x] call (call compile format ["%1", _c1])} forEach units _g;
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createFootPatrol - call %1 for each unit of group: %2",_c1,_g]] call ADF_fnc_log};	
};

if (_c2 != "") then {
	// Group
	[_g] call (call compile format ["%1", _c2]);
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createFootPatrol - call %1 for group: %2",_c2,_g]] call ADF_fnc_log};		
};

// Create the foot patrol for the created group
[_g, _p, _r, _c, _t, _b, _m, _s, _f, _cr, _sb] call ADF_fnc_footPatrol;

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_createFootPatrol - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};

// Return the group
_g