/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_outsidePosUnit
Author: Whiztler
Script version: 1.03

File: fn_outsidePosUnit.sqf
**********************************************************************************
Checks if an AI/player is outside by checking the z-axe for a 25 meter visibility.
If inside the roof will break visibility and the function will return true. The
script can be used to determine rooftop positions.

INSTRUCTIONS:
Call from script on the server

REQUIRED PARAMETERS:
0: Object:      Object or position array [x,y,z]

OPTIONAL PARAMETERS:
N/A

EXAMPLES USAGE IN SCRIPT:
_inside = [player] call ADF_fnc_outsidePosUnit;

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
_inside = [_ei] call ADF_fnc_outsidePosUnit;

RETURNS:
Bool (true if inside)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_outsidePosUnit"};

// Init
params [
	["_u", objNull, [objNull]]
];

private _z = lineIntersects [eyePos _u, (eyePos _u) vectorAdd [0, 0, 25]];

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_outsidePosUnitUnit - Position inside: %1", _z]] call ADF_fnc_log};

// Return result (true or false)
_z