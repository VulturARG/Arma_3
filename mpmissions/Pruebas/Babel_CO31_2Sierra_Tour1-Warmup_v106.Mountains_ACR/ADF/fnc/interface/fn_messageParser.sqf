/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_messageParser
Author: Whiztler
Script version: 1.02

File: fn_messageParser.sqf
**********************************************************************************
ABOUT
This function is used by the Message Parser module (ADF_mod_messageParser.sqf).
It processes messages configured in the Message Parser module:

- Display a hint
- Stamp the message in the logbook (if configured as true in the module)

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_messageParser"};

if (!hasInterface) exitWith {};

// Init
params [
	"_cID",
	"_rID",
	"_msg"
];
private _o = ADF_messageParserConfig select 0;
private _c = ADF_messageParserConfig find _cID;
private _r = ADF_messageParserConfig find _rID;

// Check if a logo has been defined
if (isNil "ADF_clanLogo") then {ADF_clanLogo = ""};

private _p = if ((ADF_messageParserConfig select (_c + 2)) != "") then {format ["<img size= '5' shadow='false' image='mission\images\%1'/>", ADF_messageParserConfig select (_c + 2)]} else {""};

// Radio transmission squelch sound
playSound "radioTransmit";

// Compile message and display to client
private _m = format ["%1 this is %2. %3", toUpper (ADF_messageParserConfig select (_r + 1)), toUpper (ADF_messageParserConfig select (_c + 1)), _msg];
hintSilent parseText format ["%1<br/><br/><t color='%2' align='left' size='1.1' font='EtelkaNarrowMediumPro'>%3</t><br/><br/>"	,_p , ADF_messageParserColor, _m];

if ((ADF_messageParserConfig select _c) != _o && ADF_messageParserLog) then {[ADF_messageParserConfig select (_c + 1), _m] call ADF_fnc_MessageLog};

true