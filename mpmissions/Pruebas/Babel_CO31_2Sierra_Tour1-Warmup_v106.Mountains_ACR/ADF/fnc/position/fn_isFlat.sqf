/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_isFlat
Author: Whiztler
Script version: 1.01

File: fn_isFlat.sqf
**********************************************************************************
ABOUT
Checks if a passed position is on flat ground.
Info: https://en.wikipedia.org/wiki/Normal_(geometry)

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Position:        marker / object / vehicle / group

OPTIONAL PARAMETERS:
n/a

EXAMPLES USAGE IN SCRIPT:
_isFlat = ["myMarker"] call ADF_fnc_isFlat;

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
_isFlat = ["myMarker"] call ADF_fnc_isFlat;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_isFlat"};

// Init
params [
	["_p", "", ["", [], objNull, grpNull]]
];

// Check location position
_p = [_p] call ADF_fnc_checkPosition;

private _s	= surfaceNormal _p;
private _z	= if (((_s select 2) * 1000) > 995) then {true} else {false};

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_isFlat - Flat Position Z-axe: %1", _s select 2]] call ADF_fnc_log};

// Return result (true or false)
_z