/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_getTurrets
Author: Whiztler
Script version: 1.15

File: fn_getTurrets.sqf
**********************************************************************************
ABOUT
Creates and populates an array of empty unlocked static weapons and vehicles with 
empty turrets. If you have vehicles on the map you DO NOT want to be populated by
AI's, then 'LOCK' the vehicle (not player lock!).
The function is exclusively used by ADF_fnc_DefendArea.

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Array:       Position [X,Y,Z]
1. Number:      Radius in meters

OPTIONAL PARAMETERS:
N/a

EXAMPLE
[[1234,1234,0], 100] call ADF_fnc_getTurrets;

RETURNS:
Array (available turrets)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_getTurrets"};

// init
params [
	["_p", [0, 0, 0], [[]], [3]],
	["_r", 10,[0]]
];
private _t = [];
private _a = [];	

// Create array of empty static turrets
{_t append (_p nearEntities [[_x], _r])} forEach ["TANK", "APC", "CAR", "StaticWeapon"];

// Remove already populated turrest from the array
{if ((_x emptyPositions "gunner") > 0 && ((count crew _x) == 0 && (locked _x) != 2)) then {_a append [_x]}} forEach _t;

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_getTurrest - Turrets array: %1",_a]] call ADF_fnc_log};

// return turrets array
_a