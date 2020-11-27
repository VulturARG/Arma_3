/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: air patrol script
Author: Whiztler
Script version: 1.15

File: ADF_fnc_airPatrol.sqf
**********************************************************************************
ABOUT
This is an patrol function for pre-spawned, crewed aircraft. 

INSTRUCTIONS:
Execute from the server

REQUIRED PARAMETERS:
0. Group:       Group (aircraft crew)
1. position:    Center patrol start position. Marker, object, trigger or position
                array [x,y,z]

OPTIONAL PARAMETERS:
2. Number:      Waypoint radius in meters. Default: 2500 
3. Number:      Aircraft altitude (above ground level in meters). Default: 100
4. Number:      Number of total waypoints to patrol. Default: 4
5. String:      Waypoint type. Default: "MOVE"
                Info: https:community.bistudio.com/wiki/Waypoint_types
6. String:      Waypoint behaviour. Default: "SAFE"
                Info: https:community.bistudio.com/wiki/setWaypointBehaviour                
7. String:      Waypoint combat mode. Default: "WHITE"
                Info: https:community.bistudio.com/wiki/setWaypointCombatMode
8. String:      Waypoint speed. Default: "LIMITED"
                Info: https:community.bistudio.com/wiki/waypointSpeed
9. String:      Waypoint formation. Default: "FILE"
                Info: https:community.bistudio.com/wiki/waypointFormation
10. Number:     Waypoint completion radius in meters. Default: 5
                Info: https:community.bistudio.com/wiki/setWaypointCompletionRadius
11. Bool        Pilot Behavior: 
                - true: Pilots do not ignore combat situations. 
                - false: Pilots ignore combat situations. (Default)  

EXAMPLES USAGE IN SCRIPT:
[_grp, _Position, 1000, 100, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250, false] call ADF_fnc_airPatrol;

EXAMPLES USAGE IN EDEN:
[group this, position this, 5000, 100, 8, "MOVE", "SAFE", "RED", "NORMAL", "FILE", 250, false] call ADF_fnc_airPatrol;

DEFAULT/MINIMUM OPTIONS
[_g, "ap_marker"] call ADF_fnc_airPatrol;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_airPatrol"};

// Init
params [
	["_g", grpNull, [grpNull]],
	["_p", "", ["", [], objNull, grpNull, locationNull]],
	["_r", 2500, [0]],
	["_h" , 100, [0]],
	["_c", 4, [0]],
	["_t", "MOVE", [""]],
	["_b", "SAFE", [""]],
	["_m", "WHITE", [""]],
	["_s", "LIMITED", [""]],
	["_f", "DIAMOND", [""]],
	["_cr", 250, [0]],
	["_pb", false, [false]]
];
private _ix = 0;

// Check valid vars
if (_g == grpNull) exitWith {[format ["ADF_fnc_airPatrol - Empty group passed: %1. Exiting", _g], true] call ADF_fnc_log; false};
if (_h > 1000) then {_h = 1000};
if (_c > 10) then {_c = 10};
if (_cr > (_r / _c)) then {_cr = (_r / _c)};

// Check the position of the location
_p = [_p] call ADF_fnc_checkPosition;

// Create the waypoint array
private _a = [_g, _p, _r, _t, _b, _m, _s, _f, _cr, "air", false, _ix];

// Loop through the number of waypoints needed
for "_i" from 0 to (_c - 1) do {
	_ix = _ix + 1;
	[_g, _p, _r, _t, _b, _m, _s, _f, _cr, "air", false, _ix] call ADF_fnc_addWaypoint;
};

// Add a cycle waypoint
private _cx =+ _a;
_cx set [3, "CYCLE"];
_cx call ADF_fnc_addWaypoint;

// Remove the spawn/start waypoint
deleteWaypoint ((waypoints _g) select 0);

// Set the patrol altitude
(vehicle (leader _g)) flyInHeight _h;

// Set pilot behavior
if (_pb) then {[driver (vehicle _l)] call ADF_fnc_heliPilotAI};

true