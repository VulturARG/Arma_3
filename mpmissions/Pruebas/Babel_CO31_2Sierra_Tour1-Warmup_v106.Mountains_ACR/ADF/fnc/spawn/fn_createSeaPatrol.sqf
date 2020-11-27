/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Create Sea Patrol
Author: Whiztler
Script version: 1.06

File: fn_createSeaPatrol.sqf
**********************************************************************************
ABOUT:
This function creates a crewed boat that patrols a given position. The module
creates water waypoints in a given radius. You can define which type of ship.

INSTRUCTIONS:
Execute from the server or headless client.

REQUIRED PARAMETERS:
0: Position:    Spawn position. Marker, object, trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
1. Position:    Patrol position. Marker, object, trigger or position array [x,y,z]
                Default: "" (Spawn position will be used)
2. Side:        west, east or independent. Default: east
3. Number       Type of vessel:
                - 1 - speedboat mini-gun (default)
                - 2 - assault boat (RHIB)
4. Bool:        Gunner(s):
                - True - driver + gunner(s)/crew (default)
                - false - driver only
5. Number:      Patrol Radius in meters from the spawn position. Default: 1000
6. Number:      Number of patrol waypoints. Default: 4
7. String:      Waypoint type. Info: https://community.bistudio.com/wiki/Waypoint_types (default = "MOVE")
8. String:      Waypoint behavior. Info: https://community.bistudio.com/wiki/setWaypointBehaviour (default = "SAFE")
9. String:      Combat mode. Info: https://community.bistudio.com/wiki/setWaypointCombatMode (default = "YELLOW")
10. String:     Waypoint speed. Info: https://community.bistudio.com/wiki/waypointSpeed (default = "LIMITED")
11. String:     Waypoint formation. Info: https://community.bistudio.com/wiki/waypointFormation (default = "COLUMN")
12. Number:     Completion radius. Info: https://community.bistudio.com/wiki/setWaypointCompletionRadius (default = 25)
13. String:     Code to execute on each unit of the crew (e.g. a function).
                Default = "". Code is CALLED. Each unit of the group is passed
                (_this select 0) to the code/fnc.
14. String:     Code to execute on the crew aa a group (e.g. a function).
                Default = "". Code is CALLED. The group is passed
                (_this select 0) to the code/fnc.     

EXAMPLES USAGE IN SCRIPT:
[_spawnPos, PatrolPos, west, 1, false, 300, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, "", ""] call ADF_fnc_createSeaPatrol;

EXAMPLES USAGE IN EDEN:
["spawnMarker", "PatrolMarker", east, 2, true, 500, 6, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, "", "fnc_myFunction"] call ADF_fnc_createSeaPatrol;

DEFAULT/MINIMUM OPTIONS
[_spawnPos] call ADF_fnc_createSeaPatrol;

RETURNS:
Object
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createSeaPatrol"};

// Init
private _dt = diag_tickTime;
params [
	["_ps", "", ["", [], objNull, grpNull]], 
	["_pp", "", ["", [], objNull, grpNull]], 
	["_gs", east, [west]], 
	["_gc", 1, [0]], 
	["_gt", true, [true]], 
	["_r", 1000, [0]], 
	["_c", 4, [0]], 
	["_t", "MOVE", [""]], 
	["_b", "SAFE", [""]], 
	["_m", "YELLOW", [""]], 
	["_s", "LIMITED", [""]], 
	["_f", "COLUMN", [""]], 
	["_cr", 25, [0]], 
	["_c1", "", [""]], 
	["_c2", "", [""]]	
];
private _vc	= "";
private _cc	= "";

// Check valid vars
if !(_gs in [west, east, independent]) exitWith {[format ["ADF_fnc_createSeaPatrol - %1  side passed. Exiting", _gs], true] call ADF_fnc_log; grpNull};
if (_c1 != "") then {if (isNil _c1) then {if (ADF_debug) then {[format ["ADF_fnc_createSeaPatrol - incorrect code (%1) passed. Defaulted to ''.", _c1]] call ADF_fnc_log;}; _c1 = "";}};
if (_c2 != "") then {if (isNil _c2) then {if (ADF_debug) then {[format ["ADF_fnc_createSeaPatrol - incorrect code (%1) passed. Defaulted to ''.", _c2]] call ADF_fnc_log;}; _c2 = "";}};
if (_gc > 2 || _gc < 1) then {_gc = 2;};
if (_gc == 2) then {_gt = false};

// Check the location position. If no patrol position was provided then assume the spawn position as the patrol position
if (typeName _ps != "ARRAY") then {_ps = [_ps] call ADF_fnc_checkPosition};
if (typeName _pp == "STRING") then {if (_pp == "") then {_pp = _ps}};

// Select vessel and crew based on the determined side
if (_gs == west) then {
	if (_gc == 1) then {_vc = "B_Boat_Armed_01_minigun_F"} else {_vc = "B_Boat_Transport_01_F";};
	_cc = "B_Soldier_F";
};
if (_gs == east) then {
	if (_gc == 1) then {_vc = "O_Boat_Armed_01_hmg_F"} else {_vc = "O_Boat_Transport_01_F";};
	_cc = "O_Soldier_F";
};
if (_gs == independent) then {
	if (_gc == 1) then {_vc = "I_Boat_Armed_01_minigun_F"} else {_vc = "I_Boat_Transport_01_F";};
	_cc = "I_Soldier_F";
};

// Create the vessel
private _v = createVehicle [_vc, [0,0,0], [], 0, "NONE"];
_v setPos _ps;

//Create the boat crew and assign to the position with the vessel
private _g	= createGroup _gs;
private _bc	= _g createUnit [_cc, _ps, [], 0, "NONE"]; _bc moveInDriver _v;
_g deleteGroupWhenEmpty true;

if (_gt) then {
	private _bc = _g createUnit [_cc, _ps, [], 0, "NONE"]; _bc setRank "LIEUTENANT"; _bc moveInCommander _v;
	private _bc = _g createUnit [_cc, _ps, [], 0, "NONE"]; _bc moveInGunner _v;
} else {
	private "_i";
	for "_i" from 1 to 3 do {
		private _bc = _g createUnit [_cc, _ps, [], 0, "NONE"]; _bc moveInCargo _v;
	};	
};

// Execute custom passed code/function
if (_c1 != "") then {
	// Each unit in the crew
	{[_x] call (call compile format ["%1", _c1])} forEach units _g;
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createSeaPatrol - call %1 for units of group: %2",_c1,_g]] call ADF_fnc_log};
};

if (_c2 != "") then {
	// Crew
	[_g] call (call compile format ["%1", _c2]);
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createSeaPatrol - call %1 for the vessel crew: %2",_c2,_g]] call ADF_fnc_log};	
};

// Create the sea patrol
[_g, _pp, _r, _c, _t, _b, _m, _s , _f , _cr] call ADF_fnc_seaPatrol;

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_createSeaPatrol - Diag time to execute function: %1", diag_tickTime - _dt]] call ADF_fnc_log};

// Return the vessel
_v