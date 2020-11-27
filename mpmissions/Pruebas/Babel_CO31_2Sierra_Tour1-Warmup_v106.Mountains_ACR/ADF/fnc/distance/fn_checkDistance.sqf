/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_checkDistance
Author: Whiztler
Script version: 1.04

File: fn_checkDistance.sqf
**********************************************************************************
ABOUT
Returns the distance between two positions.

INSTRUCTIONS:
Execute (call) from any client

REQUIRED PARAMETERS:
0. Position:        Marker, object, trigger or position array [x,y,z]
1. Position:        Marker, object, trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
n/a

EXAMPLES USAGE IN SCRIPT:
[_veh, "myMarker"] call ADF_fnc_checkDistance;

EXAMPLES USAGE IN EDEN:
[player, "myMarker"] call ADF_fnc_checkDistance;

DEFAULT/MINIMUM OPTIONS
[_veh, flagPole] call ADF_fnc_checkDistance;

RETURNS:
Integer (distance in meters)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_checkDistance"};

// Init
params [
	["_a", "", ["", [], objNull, grpNull, locationNull]],
	["_b", "", ["", [], objNull, grpNull, locationNull]]
];

// Check the location type and report as position
private _p1 = [_a] call ADF_fnc_checkPosition;
private _p2 = [_b] call ADF_fnc_checkPosition;

// Determine the distance between the two positions
private _r = round (_p1 distance2D _p2);

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_checkDistance - Distance (%1 -- %2): %3 meters",_a, _b, _r]] call ADF_fnc_log};

// Return the result
_r