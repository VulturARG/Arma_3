/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_setGroupID
Author: Whiztler
Script version: 1.01

File: fn_setGroupID.sqf
**********************************************************************************
Applies a custom group ID (Call sign) to an unit. Use on every unit of the group.

INSTRUCTIONS:
Call from script on the local client.

REQUIRED PARAMETERS:
0. Group:       Existing group
1. String:      GroupID

OPTIONAL PARAMETERS:
N/A

EXAMPLE
[_myGroup, "SEAL-6"] call ADF_fnc_setGroupID;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_setGroupID"};
	
params [
	["_g", "empty", [""]],
	["_c", "empty", [""]]
];

if ((_g == "empty") || (_c == "empty")) exitWith {false};

_g = call compile format ["%1", _g];
_g setGroupId [format ["%1", _c]];

true