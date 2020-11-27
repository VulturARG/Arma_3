/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_countRadius
Author: Whiztler
Script version: 1.02

File: fn_countRadius.sqf
**********************************************************************************
ABOUT
Counts the number of units / vehicles / object (whatever you specify) in a certain
radius.

INSTRUCTIONS:
Execute (call) from the server

REQUIRED PARAMETERS:
0. Position:    Marker, object, trigger or position array [x,y,z].
1. Side:        east, west, independent, etc.


OPTIONAL PARAMETERS:
2. Number:      Radius in meters. Default: 250. Maximum is 5000
3. type:        ["man", "car", "apc", "tank", "all"]. Default: "man"
                either string for a single type or an array for multiple types

EXAMPLES USAGE IN SCRIPT:
_enemyCount = ["myMarker", independent, 250, "MAN"] call ADF_fnc_countRadius;

EXAMPLES USAGE IN EDEN:
AO_EI_East = ["eastAO", east, 750, ["MAN", "CAR"]] call ADF_fnc_countRadius;

DEFAULT/MINIMUM OPTIONS
_cnt = ["myMarker", west] call ADF_fnc_countRadius;

RETURNS:
Integer (number of units / vehicles / etc.)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_countRadius"};

// Init
params [
	["_p", "", ["", [], objNull, grpNull, locationNull]],
	["_s", east, [west]],
	["_r", 100, [0]],
	["_t", "man", ["",[]]]
];

// Check valid vars
if (_r > 5000) then {_r = 5000;};

// Check the position of the location
_p = [_p] call ADF_fnc_checkPosition;

private _z = {side _x == _s} count (_p nearEntities [_t, _r]);

_z