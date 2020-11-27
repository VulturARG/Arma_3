/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_defendAreaPatrol
Author: Whiztler
Script version: 1.16

File: fn_defendAreaPatrol.sqf
**********************************************************************************
ABOUT
The defendAreaPatrol function is executed by the defendArea function for units
that cannot be garrisoned (no buildings, or no positions left). The remaining
units are grouped in a new group and send out to patrol the area. Same radius as
the garrison area radius.

INSTRUCTIONS:
Called from ADF_fnc_defendArea

REQUIRED PARAMETERS:
0: Number:      Index for reporting
1: Group:       Left over units for the garrison group
2: Array:       Position [X,Y,Z]

OPTIONAL PARAMETERS:
3: Number:      Radius in meters (default: 75)
4. Bool:        Search nearby building (default: false)

EXAMPLE
Called from within ADF_fnc_defendArea

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_defendAreaPatrol"};

// Init
private _dt = diag_tickTime;
params [
	["_i", 0, [0]],
	["_g", grpNull, [grpNull]],
	["_p", [], ["", [], objNull, grpNull]],
	["_r", 75, [0]],
	["_sb", false, [true]]
];
private _u = units _g;
private _a = [];

// Debug reporting
if (ADF_debug || ADF_extRpt) then {[format ["ADF_fnc_defendAreaPatrol - Group units: %1",_u]] call ADF_fnc_log};

// Check if the unit is garrisoned
{
	if !(_x getVariable ["ADF_garrSet",true]) then {
		_a append [_x];
		// Debug reporting
		if (ADF_debug) then {[format ["ADF_fnc_defendAreaPatrol - Unit: %1 -- ADF_garrSet: %2",_x, _x getVariable ["ADF_garrSet",true]]] call ADF_fnc_log};
	}
} forEach _u;	

// Debug reporting
if (ADF_debug || ADF_extRpt) then {[format ["ADF_fnc_defendAreaPatrol - # garrisoned units: %1 -- # patrol units: %2 -- Patrol units: %3",_i,count _a,_a]] call ADF_fnc_log};

// Create a new group for not-garrisoned units 
private _gt = createGroup (side _g);
{[_x] joinSilent _gt} forEach _a;

// Check and set the patrol radius/distance
if (_r < 75) then {_r = 75};

// Send the group on patrol, set the variable as non-garrisoned and re-enable the combat mode
[_gt, _p, _r, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, _sb] call ADF_fnc_footPatrol;
_gt setVariable ["ADF_hc_garrison_ADF",false];
_gt enableAttack true;

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_defendAreaPatrol - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};

true