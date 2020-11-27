/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_outsidePos
Author: Whiztler
Script version: 1.02

File: fn_outsidePos.sqf
**********************************************************************************
ABOUT
Checks if a given position is outside by checking the z-axe for a 25 meter
visibility. If inside the roof will break visibility and the function will return
true.

INSTRUCTIONS:
Call from script on the server

REQUIRED PARAMETERS:
0. position:         Marker, object, trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
n/a

EXAMPLES USAGE IN SCRIPT:
_outside = [myObject] call ADF_fnc_outsidePos;

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
_outside = ["myMarker"] call ADF_fnc_outsidePos;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_outsidePos"};

// Init
params [
	["_p", "", ["", [], objNull, grpNull]]
];

// Check location position
_p = [_p] call ADF_fnc_checkPosition;

private _z = lineIntersects [ATLToASL [_p select 0, _p select 1, 1], ATLToASL [_p select 0, _p select 1, 25]];

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_outsidePos - Position inside: %1", _r]] call ADF_fnc_log};

// Return result (true or false)
_z
