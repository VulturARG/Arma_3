/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_takeCover
Author: Whiztler
Script version: 1.01

File: fn_takeCover.sqf
**********************************************************************************
ABOUT
Function used by the defend (garrison) function to change behavior and stance of
an AI simulating a natural response to gunfire.

INSTRUCTIONS:
Execute (call) from the server

REQUIRED PARAMETERS:
0. Object:      the unit you wish to apply the skill set to.

OPTIONAL PARAMETERS:
1. String:      The current stance of the unit:
                - "UP" (default)
                - "MIDDLE"
                - "DOWN"
2. Bool:        Switch behavior to combat mode?
                - true (default)
                - false

EXAMPLES USAGE IN SCRIPT:
[_myUnit, "veteran"] call ADF_fnc_takeCover;

EXAMPLES USAGE IN EDEN:
[this, "expert"] call ADF_fnc_takeCover;

DEFAULT/MINIMUM OPTIONS
[_soldier] call ADF_fnc_takeCover;

RETURNS:
Object
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_takeCover"};

// Init
params [
	["_u", objNull, [objNull]],
	["_s", "UP", [""]],
	["_b", true, [false]],
	["_w", "MIDDLE", [""]]
];

// Check valid vars
if !(_u isKindOf "CAManBase") exitWith {[format ["ADF_fnc_takeCover - Incorrect unit passed: '%1'. Exiting", _u], true] call ADF_fnc_log; false};
if (	(_s != "UP") && (_s != "MIDDLE") && (_s != "DOWN")) then {	_s = "UP"; if (ADF_debug) then {[format ["ADF_fnc_takeCover - incorrect stance (%1) passed for unit: %2. Defaulted to 'UP'.",_s, _u]] call ADF_fnc_log;}};

// Remove EH
_u removeAllEventHandlers "FiredNear";

// If the unit is already prone then do nothing.
if (_s == "DOWN") exitWith {if (ADF_debug) then {[format ["ADF_fnc_takeCover - unit '%1' is already in a 'DOWN' stance. Exiting", _u]] call ADF_fnc_log}; false};

// Check the cover position stance
if (_s == "MIDDLE") then {_w = "DOWN"}; 

if (ADF_debug) then {[format ["ADF_fnc_takeCover - unit: %1, org stance: %2, new stance: %3", _u, _s, _w]] call ADF_fnc_log};


if (_b) then {_u setBehaviour "COMBAT"; };

// Spawn a new thread that will make the unit take cover and return to the original stance after a random pause.
[_u, _s, _w] spawn {
	params ["_u", "_s", "_w"];
	sleep (random 1.5);
	_u setUnitPos _w;
	
	// Debug reporting
	if (ADF_debug && alive _u) then {[format ["ADF_fnc_takeCover - Stance changed to '%1' for unit: %2", _w, _u]] call ADF_fnc_log};
	
	sleep (2 + random 3 + random 2);
	if (!alive _u) exitWith {};
	_u setUnitPos _s;
	
	_u addEventHandler ["FiredNear", {[_this select 0, _s, _w] call ADF_fnc_takeCover}];
};

true