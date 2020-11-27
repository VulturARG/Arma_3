/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_iedDetonate
Author: Whiztler
Script version: 1.04

File: fn_iedDetonate.sqf
**********************************************************************************
ABOUT
Detonates an IED. Function is executed by the createIED module

INSTRUCTIONS (MANUAL USAGE):
Call from script on the server.

REQUIRED PARAMETERS:
0. Object - Trigger

OPTIONAL PARAMETERS:
n/a

EXAMPLE
[thisTrigger] call ADF_fnc_iedDetonate;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_iedDetonate"};

if (!isServer) exitWith {};

// Init
params [
	["_t", objNull, [objNull]]
];
// check position location
_p = [_t] call ADF_fnc_checkPosition;

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_iedDetonate - trigger (%1) position: %2", _t, _p]] call ADF_fnc_log};

// Check for IED objects
private _a = nearestObjects [_p, ["Land_Wreck_Car3_F", "Land_GarbagePallet_F", "Land_CanisterPlastic_F", "Land_Sack_F", "Land_JunkPile_F", "Land_BarrelTrash_F", "Land_GarbageBarrel_01_F"], 8];
// If no IED object found then terminate the script
if (count _a == 0) exitWith {if (ADF_debug) then {["ADF Debug: ADF_fnc_iedDetonate - ERROR, no IED object found. Exiting", true] call ADF_fnc_log; false}};

// Get the IED object position and delete the object
private _p = getPos (_a select 0);
{deleteVehicle _x} forEach _a;

// Create the explosion
private _b = createVehicle ["HelicopterExploSmall", _p, [], 0, "NONE"];

true