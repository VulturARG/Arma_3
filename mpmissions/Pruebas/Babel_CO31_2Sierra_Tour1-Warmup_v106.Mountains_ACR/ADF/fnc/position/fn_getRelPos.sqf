/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_getRelPos
Author: Whiztler
Script version: 1.02

File: fn_getRelPos.sqf
**********************************************************************************
ABOUT
Use this function to determine a relative position.

INSTRUCTIONS:
n/a

REQUIRED PARAMETERS:
0. Position:    Marker, object, trigger or position array [x,y,z]
1. Number:      distance in meters

OPTIONAL PARAMETERS:
2. Number:      Azimuth (0-360). Default: 0
3. Number:      Z-axe, altitude offset. Default: -1

EXAMPLES USAGE IN SCRIPT:
_rePos = [_unit, 10, 45, 0] call ADF_fnc_getRelPos;

EXAMPLES USAGE IN EDEN:
n/a

DEFAULT/MINIMUM OPTIONS
_rePos = [_unit, 10] call ADF_fnc_getRelPos;

RETURNS:
Array:          0.  position X
                1.  position y
                2.  position Z
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_getRelPos"};

// Init
params [
	["_p", "", ["", [], objNull, grpNull]],
	["_d", 15, [0]],
	["_r", 0, [0]],
	["_z", -1, [0]]
];

private _a = [(_p select 0) + sin _d * _r, (_p select 1) + cos _d * _r, _z];

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_getRelPos - Position: [%1,%2, 0]", _pX, _pY]] call ADF_fnc_log};

// Return the result
_a