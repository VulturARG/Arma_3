/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_checkClosest
Author: Whiztler
Script version: 1.02

File: fn_checkClosest.sqf
**********************************************************************************
ABOUT
Checks closest players to an object, marker, trigger, AI, etc.

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Array:      E.g. allPlayer, allUnits, etc.
1. Position:   Marker, object, trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
N/A

EXAMPLES USAGE IN SCRIPT:
[allPlayers, myObject] call ADF_fnc_checkClosest;

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
[EnemyArray, "bluBase"] call ADF_fnc_checkClosest;

RETURNS:
Integer (distance in meters)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_checkClosest"};

params [
	["_a", [], [[]]],
	["_b", "", ["", [], objNull, grpNull, locationNull]],
	["_r", 10^5, [0]]
];	
private _z = _r + 1;

{
	_z = [_x, _b] call ADF_fnc_checkDistance;

	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_checkClosest - distance %1 to %2 is %3 meters", _x, _b, _z]] call ADF_fnc_log};
	
	if (_z < _r) then {_r = _z};
} forEach _a;

_z