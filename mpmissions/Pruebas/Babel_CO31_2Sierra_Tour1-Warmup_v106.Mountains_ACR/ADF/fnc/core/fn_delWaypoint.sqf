/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_delWaypoint
Author: Whiztler. Based on CBA fnc_clearWaypoints by SilentSpike
Script version: 1.01

File: fn_delWaypoint.sqf
**********************************************************************************
ABOUT
This function deletes all waypoints assigned to a group

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Group:       Existing group that has the waypoints assigned

OPTIONAL PARAMETERS:
None

EXAMPLE
[_group] call ADF_fnc_delWaypoint; 

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_delWaypoint"};

// init	
params [
	["_g", grpNull, [grpNull]]
];

// Check valid vars
if (_g == grpNull) exitWith {[format ["ADF_fnc_delWaypoint - Empty or invalid group passed: %1. Exiting", _g], true] call ADF_fnc_log; false};

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_delWaypoint - group: %1", _g]] call ADF_fnc_log};

private _wp = waypoints _g;
{deleteWaypoint [_g, 0]} forEach _wp;

// Create a last waypoint and delete on execution
private _last = _g addWaypoint [getPosATL (leader _g), 0];
_last setWaypointStatements ["true", "deleteWaypoint [group this,currentWaypoint (group this)]"];

true