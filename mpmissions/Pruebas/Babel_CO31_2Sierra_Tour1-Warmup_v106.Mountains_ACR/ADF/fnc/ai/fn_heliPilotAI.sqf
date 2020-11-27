/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_heliPilotAI
Author: Whiztler
Script version: 1.02

File: fn_heliPilotAI.sqf
**********************************************************************************
ABOUT
Makes pilots perform their pilot duties even when under fire or when they
have spotted enemies. Works on both heli and jet pilots

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Object:      Aircraft pilot

OPTIONAL PARAMETERS:
N/A

EXAMPLES USAGE IN SCRIPT:
[driver _veh] call ADF_fnc_heliPilotAI;

EXAMPLES USAGE IN EDEN:
[driver this] call ADF_fnc_heliPilotAI;

DEFAULT/MINIMUM OPTIONS
[driver _veh] call ADF_fnc_heliPilotAI; 

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_heliPilotAI"};

// Init
params [
	["_u", objNull, [objNull]]
];

// Check vars
if !(_u isKindOf "CAManBase") exitWith {[format ["ADF_fnc_heliPilotAI - Incorrect unit passed: '%1'. Exiting", _u], true] call ADF_fnc_log; false}; 


private _g = group _u;

// Disable targetting modes, combat modes for pilots
_u setBehaviour "SAFE";
_g setCombatMode "BLUE";

_u disableAI "SUPPRESSION"; 
_u disableAI "CHECKVISIBLE";
_u disableAI "TARGET";
_u disableAI "AUTOTARGET";
_u disableAI "AUTOCOMBAT";

_g enableAttack false;
_g allowFleeing 0;

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_heliPilotAI - Helicopter pilot AI aspects disabled for: %1", _u]] call ADF_fnc_log};

true