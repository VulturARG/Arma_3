/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: foot patrol script
Author: Whiztler
Script version: 1.12

File: ADF_fnc_footPatrol.sqf
**********************************************************************************
ABOUT
This is an infantry foot patrol function for pre-existing (editor placed or
scripted) groups

INSTRUCTIONS:
Execute (call) fro the server or HC

REQUIRED PARAMETERS:
0. Group:       Group (aircraft crew)
1. position:    Center patrol start position. Marker, object, trigger or position
                array [x,y,z]

OPTIONAL PARAMETERS:
2. Number:      Waypoint radius in meters. Default: 500. Maximum: 5000
3. Number:      Number of total waypoints to patrol. Default: 4. Maximum: 10
4. String:      Waypoint type. Default: "MOVE"
                Info: https:community.bistudio.com/wiki/Waypoint_types
5. String:      Waypoint behaviour. Default: "SAFE"
                Info: https:community.bistudio.com/wiki/setWaypointBehaviour                
6. String:      Waypoint combat mode. Default: "WHITE"
                Info: https:community.bistudio.com/wiki/setWaypointCombatMode
7. String:      Waypoint speed. Default: "LIMITED"
                Info: https:community.bistudio.com/wiki/waypointSpeed
8. String:      Waypoint formation. Default: "FILE"
                Info: https:community.bistudio.com/wiki/waypointFormation
9. Number:      Waypoint completion radius. Default: 5
                Info: https:community.bistudio.com/wiki/setWaypointCompletionRadius
10. Bool        Search buildings: 
                - true: Search buildings within a 50 meter radius upon waypoint
                  completion.
                - false: Do not search buildings (default)

EXAMPLES USAGE IN SCRIPT:
[_grp, _pos, 300, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
[_myGroup, "PatrolMarker", 500, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, false] call ADF_fnc_footPatrol;

EXAMPLES USAGE IN EDEN:
[group this, position this, 750, 5, "MOVE", "SAFE", "RED", "NORMAL", "WEDGE", 5, false] call ADF_fnc_footPatrol;

DEFAULT/MINIMUM OPTIONS
[_grp, "myMarker"] call ADF_fnc_footPatrol;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_footPatrol"};

// Init
params [
	["_g", grpNull, [grpNull]],
	["_p", "", ["", [], objNull, grpNull]],
	["_r", 500, [0]],
	["_c", 4, [0]],
	["_t", "MOVE", [""]],
	["_b", "SAFE", [""]],
	["_m", "WHITE", [""]],
	["_s", "LIMITED", [""]],
	["_f", "FILE", [""]],
	["_cr", 5, [0]],
	["_sb", false, [true]]
];
private _ix = 0;

// Check valid vars
if (_g == grpNull) exitWith {[format ["ADF_fnc_footPatrol - Empty group passed: %1. Exiting", _g], true] call ADF_fnc_log; false};
if (_r > 5000) then {_r = 5000};
if (_c > 10) then {_c = 10};
if (_cr > (_r / _c)) then {_cr = (_r / _c)};

// Check location position
_p = [_p] call ADF_fnc_checkPosition;

// Create the waypoint array
private _a = [_g, _p, _r, _t, _b, _m, _s, _f, _cr, "foot", _sb, _ix];

// Loop through the number of waypoints needed
for "_i" from 0 to (_c - 1) do {
	_ix = _ix + 1;
	[_g, _p, _r, _t, _b, _m, _s, _f, _cr, "foot", _sb, _ix] call ADF_fnc_addWaypoint;
};

// Add a cycle waypoint
private _cx =+ _a;
_cx set [3, "CYCLE"];
_cx call ADF_fnc_addWaypoint;

// Remove the spawn/start waypoint
deleteWaypoint ((waypoints _g) select 0);

true