/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_countGroupsCustom
Author: Whiztler
Script version: 1.01

File: fn_countGroupsCustom.sqf
**********************************************************************************
ABOUT
Counts groups per side as stored in a previously defined array of your choice. 

INSTRUCTIONS:
Call from script on the server. The function does not count civilian groups

REQUIRED PARAMETERS:
0. String       Existing array. E.g. "AO_Kavala"

OPTIONAL PARAMETERS:
1. Side         west, east, independent (default: east)

EXAMPLES USAGE IN SCRIPT:
["AO_Kavala", west] call ADF_fnc_countGroupsCustom;

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
["AO_Kavala"] call ADF_fnc_countGroupsCustom;

RETURNS:
Number (group count)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_countGroupsCustom"};

// Init
params [
	["_a", "", [""]],
	["_s", east, [east]]
];

// Check if the array is valid
if (_a == "" || isNil _a) exitWith {
	if (ADF_debug || ADF_extRpt) then {["ADF Debug: ADF_fnc_countGroups - Error, array does not exist. Execute ADF_fnc_logGroupCustom first. Exiting", true] call ADF_fnc_log};
	0
};

_n = missionNamespace getVariable [_a,[]];

private _c = switch _s do {
	case west		: {count _n};
	case east		: {count _n};
	case independent	: {count _n};
	default			  {0}
};

_c