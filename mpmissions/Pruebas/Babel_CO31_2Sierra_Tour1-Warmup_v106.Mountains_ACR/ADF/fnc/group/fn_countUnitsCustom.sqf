/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_countUnitsCustom
Author: Whiztler
Script version: 1.02

File: fn_countUnitsCustom.sqf
**********************************************************************************
ABOUT
Counts units per side as stored in a predefined array of your choice. The function
does count civilian units

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. String       Existing array. E.g. "AO_Kavala"

OPTIONAL PARAMETERS:
1. Side         west, east, independent    

EXAMPLES USAGE IN SCRIPT:
["AO_Kavala", west] call ADF_fnc_countUnitsCustom;

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
["AO_Kavala"] call ADF_fnc_countUnitsCustom;

RETURNS:
Number (unit count)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_countUnitsCustom"};

// Init
params [
	["_a", "", [""]],
	["_s", east, [west]]
];

// Chec if array is valid
if (_a isEqualTo "") exitWith {
	if (ADF_debug || ADF_extRpt) then {["ADF Debug: ADF_fnc_countUnitsCustom - ERROR, array does not exist. Execute ADF_fnc_logGroupCustom first. Exiting.", true] call ADF_fnc_log};
	0
};

private _c = 0;
_n = missionNamespace getVariable [_a,[]];

switch _s do {
	case west		: {{_c = _c + (count _x)} forEach _n};
	case east		: {{_c = _c + (count _x)} forEach _n};
	case independent	: {{_c = _c + (count _x)} forEach _n};
	case default		  {0}
};

_c