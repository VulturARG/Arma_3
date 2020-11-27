/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: sea patrol script
Author: Whiztler
Script version: 1.03

File: ADF_fnc_seaPatrol.sqf
**********************************************************************************
ABOUT
This is an patrol function for pre-spawned, pre-crewed boats.

INSTRUCTIONS:
Execute (call) fro the server or HC

REQUIRED PARAMETERS:
0. Group:       Group (vessel crew)
1. position:    Center patrol start position. Marker, object, trigger or position
                array [x,y,z]

OPTIONAL PARAMETERS:
2. Number:      Waypoint radius in meters. Default: 1000. Maximum: 7500
3. Number:      Number of total waypoints to patrol. Default: 5. Maximum: 10
4. String:      Waypoint type. Default: "MOVE"
                Info: https:community.bistudio.com/wiki/Waypoint_types
5. String:      Waypoint behaviour. Default: "SAFE"
                Info: https:community.bistudio.com/wiki/setWaypointBehaviour                
6. String:      Waypoint combat mode. Default: "WHITE"
                Info: https:community.bistudio.com/wiki/setWaypointCombatMode
7. String:      Waypoint speed. Default: "LIMITED"
                Info: https:community.bistudio.com/wiki/waypointSpeed
8. String:      Waypoint formation. Default: "DIAMOND"
                Info: https:community.bistudio.com/wiki/waypointFormation
9. Number:      Waypoint completion radius in meters. Default: 15
                Info: https:community.bistudio.com/wiki/setWaypointCompletionRadius

EXAMPLES USAGE IN SCRIPT:
[_grp, _Pos, 1000, 4, "MOVE", "COMBAT"] call ADF_fnc_seaPatrol;
[_grp, "PatrolMarker", 2500, 7, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 25] call ADF_fnc_seaPatrol;

EXAMPLES USAGE IN EDEN:
[group this, position this, 1500, 6, "MOVE", "SAFE", "RED", "NORMAL", "FILE", 35] call ADF_fnc_seaPatrol;

DEFAULT/MINIMUM OPTIONS
[_g, "marker"] call ADF_fnc_seaPatrol;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_seaPatrol"};

// Init
params [
	["_g", grpNull, [grpNull]],
	["_p", "", ["", [], objNull, grpNull]],
	["_r", 1000,[0]],
	["_c", 5,[0]],
	["_t", "MOVE", [""]],
	["_b", "SAFE", [""]],
	["_m", "WHITE", [""]],
	["_s", "NORMAL", [""]],
	["_f", "DIAMOND", [""]],
	["_cr", 15,[0]]
];
private _ix = 0;

// Check valid vars
if (_g == grpNull) exitWith {[format ["ADF_fnc_seaPatrol - Empty group passed: %1. Exiting", _g], true] call ADF_fnc_log; false};
if (_r > 7500) then {_r = 7500};
if (_c > 10) then {_c = 10};
if (_cr > (_r / _c)) then {_cr = (_r / _c)};

// Check the location position
_p = [_p] call ADF_fnc_checkPosition;

// Create the waypoint array
private _a = [_g, _p, _r, _t, _b, _m, _s, _f, _cr, "sea", false, _ix];

// Loop through the number of waypoints needed
for "_i" from 0 to (_c - 1) do {
	_ix = _ix + 1;
	[_g, _p, _r, _t, _b, _m, _s, _f, _cr, "sea", false, _ix] call ADF_fnc_addWaypoint;
};

// Add a cycle waypoint
private _cx =+ _a;
_cx set [3, "CYCLE"];
_cx call ADF_fnc_addWaypoint;

// Remove the spawn/start waypoint
deleteWaypoint ((waypoints _g) select 0);

true