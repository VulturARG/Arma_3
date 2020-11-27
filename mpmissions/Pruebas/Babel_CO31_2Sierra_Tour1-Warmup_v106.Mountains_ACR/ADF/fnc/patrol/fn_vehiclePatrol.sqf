/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Vehicle patrol script
Author: Whiztler
Script version: 1.06

File: ADF_fnc_vehiclePatrol.sqf
**********************************************************************************
ABOUT
This is a vehicle patrol function for pre-spawned/editor placed (crewed) vehicles.

The function looks for roads. If no nearby road is found a waypoint is created
in the 'field'. Make sure the initial position is close to roads (or on a road)
and roads are within the radius. Keep the radius below 2000 else the script
might take a long time to search for suitable locations.

INSTRUCTIONS:
Execute (call) fro the server or HC

REQUIRED PARAMETERS:
0. Group:       Group (aircraft crew)
1. position:    Center patrol start position. Marker, object, trigger or position
                array [x,y,z]

OPTIONAL PARAMETERS:
2. Number:      Waypoint radius in meters. Default: 500. Maximum: 7500
3. Number:      Number of total waypoints to patrol. Default: 4
4. String:      Waypoint type. Default: "MOVE"
                Info: https:community.bistudio.com/wiki/Waypoint_types
5. String:      Waypoint behaviour. Default: "SAFE"
                Info: https:community.bistudio.com/wiki/setWaypointBehaviour                
6. String:      Waypoint combat mode. Default: "WHITE"
                Info: https:community.bistudio.com/wiki/setWaypointCombatMode
7. String:      Waypoint speed. Default: "LIMITED"
                Info: https:community.bistudio.com/wiki/waypointSpeed
8. Number:      Waypoint completion radius in meters. Default: 5
                Info: https:community.bistudio.com/wiki/setWaypointCompletionRadius 

EXAMPLES USAGE IN SCRIPT:
[_grp, _myPosition, 800, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
[_c, "PatrolMarker", 1000, 6, "MOVE", "SAFE", "RED", "NORMAL", 25] call ADF_fnc_vehiclePatrol;

EXAMPLES USAGE IN EDEN:
[group this, position this, 800, 5, "MOVE", "SAFE", "GREEN", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

DEFAULT/MINIMUM OPTIONS
[_g, "marker"] call ADF_fnc_vehiclePatrol;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_vehiclePatrol"};

// Init
private _dt = diag_tickTime;
params [
	["_g", grpNull, [grpNull]],
	["_p", "", ["", [], objNull, grpNull]],
	["_r", 1000,[0]],
	["_c", 4, [0]],
	["_t", "MOVE", [""]],
	["_b", "SAFE", [""]],
	["_m", "WHITE", [""]],
	["_s", "NORMAL", [""]],
	["_cr", 25,[0]]
];
private _ix = 0;

// Check valid vars
if (_g == grpNull) exitWith {[format ["ADF_fnc_vehiclePatrol - Empty group passed: %1. Exiting", _g], true] call ADF_fnc_log; false};
if (_r > 7500) then {_r = 7500};
if (_c > 10) then {_c = 10};
if (_cr > (_r / _c)) then {_cr = (_r / _c)};

// Check location position
_p = [_p] call ADF_fnc_checkPosition;

// Create the waypoint array
private _a = [_g, _p, _r, _t, _b, _m, _s, "COLUMN", _cr, "road", false, _ix];

// Loop through the number of waypoints needed
for "_i" from 0 to (_c - 1) do {
	_ix = _ix + 1;
	[_g, _p, _r, _t, _b, _m, _s, "COLUMN", _cr, "road", false, _ix] call ADF_fnc_addWaypoint;
};

// Add a cycle waypoint
private _cycle =+ _a;
_cycle set [3, "CYCLE"];
_cycle call ADF_fnc_addWaypoint;

// Remove the spawn/start waypoint
deleteWaypoint ((waypoints _g) select 0);

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_vehiclePatrol - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};

true