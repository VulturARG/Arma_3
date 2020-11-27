/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_messageLog
Author: Whiztler
Script version: 1.02

File: fn_messageLog.sqf
**********************************************************************************
This function is exclusively used by ADF_fnc_messageParser.
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_messageLog"};

if (!hasInterface) exitWith {};

// Init
params ["_n","_m"];

// Create the Message Parser logbook entry (if enabled)
private _t = [dayTime] call BIS_fnc_timeToString;
private _l = format ["Log: %1", _t];
private _b = format ["<br/><br/><font color='#9da698' size='14'>From: %1<br/>Time: %2</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>%3</font><br/><br/>", _n, _t, _m];
player createDiaryRecord [ADF_messageParserLogName, [_l, _b]];

true