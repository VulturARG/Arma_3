/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_stripUnit
Author: Whiztler
Script version: 1.02

File: fn_stripUnit.sqf
**********************************************************************************
ABOUT
Removes all items, all weapons, vest, backpack, headgear. There is an option to 
keep the uniform.

INSTRUCTIONS:
Execute (call) from any client where the unit is local. Server can delete on any
client.

REQUIRED PARAMETERS:
0. Object:      AI unit, player

OPTIONAL PARAMETERS:
1. Bool:        Remove the uniform:        
                - true - remove the uniform  (default)      
                - false - do not remove the uniform        

EXAMPLES USAGE IN SCRIPT:
[player, false] call ADF_fnc_stripUnit;

EXAMPLES USAGE IN EDEN:
player call ADF_fnc_stripUnit;

DEFAULT/MINIMUM OPTIONS
[_unit] call ADF_fnc_stripUnit;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_stripUnit"};

// Init
params [
	["_o", objNull, [objNull]],
	["_u", true, [false]]
];

if !(_o isKindOf "CAManBase") exitWith {[format ["ADF_fnc_heliPilotAI - Incorrect unit passed: '%1'. Exiting", _o], true] call ADF_fnc_log; false};


// Only run on local machines
//if !(local _o) exitWith {};

// Strip all items
removeAllWeapons _o;
removeAllAssignedItems _o;
removeAllItems _o;
removeHeadgear _o;
removeGoggles _o;
removeVest _o;
removeBackpack _o;

// If the uniform needs to be deleted then do so
if (_u) then  {removeUniform _o};

true