/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_log
Author: Whiztler
Script version: 1.02

File: fn_log.sqf
**********************************************************************************
ABOUT
Creates an Error message or Debug message. Error messages are always show on the
BIS bottom info screen. Both SP and MP.
Debug messages are logged in the RPT and displayed using systemChat. Note that
the messages are only logged on the local machine.

INSTRUCTIONS:
Execute (call) from anywhere

REQUIRED PARAMETERS:
0. String:      Message

OPTIONAL PARAMETERS:
1. Bool:        Is this an error message?
                - true - for error message
                - false - for debug message (default)

EXAMPLES USAGE IN SCRIPT:
if (ADF_debug) then {["YourErrorMessageHere", true] call ADF_fnc_log}; // Only in debug mode

EXAMPLES USAGE IN EDEN:
["YourErrorMessageHere"] call ADF_fnc_log;

DEFAULT/MINIMUM OPTIONS
["YourErrorMessageHere"] call ADF_fnc_log; // Always show (also MP)

RETURNS:
Nothing
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_log"};
	
// init
params [
	["_m", "", [""]],
	["_e", false, [true]]
];

// Error message?
if (_e) then { 
	private _h = "ADF Error: ";
	private _w = format ["%1%2", _h, _m];
	[_w] call BIS_fnc_error;
	diag_log _w;
	
// Debug log message?	
} else { 
	private _h = "ADF Debug: ";
	private _w = format ["%1%2", _h, _m];
	if (ADF_debug) then {_w remoteExec ["systemChat", -2, false]};
	diag_log _w;		
};	
