/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_carBombDetonate
Author: Whiztler
Script version: 1.04

File: fn_carBombDetonate.sqf
**********************************************************************************
ABOUT
Detonates a car bomb. Can be used manually or via the createCarBomb module.

INSTRUCTIONS (MANUAL USAGE):
Place a fuel truck (or other vehicle) on the map. Create a trigger around  the 
fuel truck and call the function on trigger activation.
Or call from script on the server.

REQUIRED PARAMETERS:
0. Position:        Marker, object, trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
n/a

EXAMPLES USAGE IN SCRIPT:
[iedTrigger] call ADF_fnc_carBombDetonate;

EXAMPLES USAGE IN EDEN:
[thisTrigger] call ADF_fnc_carBombDetonate;

DEFAULT/MINIMUM OPTIONS
[iedTrigger] call ADF_fnc_carBombDetonate;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_carBombDetonate"};

if (!isServer) exitWith {};

// init
params [
	["_p", "", ["", [], objNull, grpNull, locationNull]]
];

// check position location
_p = [_p] call ADF_fnc_checkPosition;

private _a = nearestObjects [_p, ["CAR"], 8];

// Terminate when no vehicle found
if (count _a == 0) exitWith {if (ADF_debug) then {["ADF Debug: ADF_fnc_carBombDetonate - ERROR, no vehicle found. Exiting", true] call ADF_fnc_log}; false};

// Disable vehicle simulation
private _v = _a select 0;
_v allowDamage false;
_v enableSimulationGlobal false;

// Create the explosion
private _b = createVehicle ["HelicopterExploBig", _p, [], 0, "NONE"];
private _b = createVehicle ["Bo_GBU12_LGB", [_p select 0, _p select 1, (_p select 2) + 3], [], 0, "NONE"];

// Enable vehicle simulation + destroy the vehicle
enableCamShake true;
addCamShake [4, 3, 3];
_v allowDamage true;
_v enableSimulationGlobal true;
_v setDamage 1;

true