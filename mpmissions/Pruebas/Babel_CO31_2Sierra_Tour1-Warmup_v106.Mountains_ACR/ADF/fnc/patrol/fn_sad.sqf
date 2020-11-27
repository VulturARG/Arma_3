/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: search and destroy
Author: Whiztler
Script version: 1.01

File: fn_createSAD.sqf
**********************************************************************************
ABOUT
This function orders a group to search and destroy another group.

INSTRUCTIONS:
Execute (spawn) fro the server or HC

REQUIRED PARAMETERS:
0. Group:       SAD/Assaulting group.
1. Group:       Group that will be tracked/assaulted.

OPTIONAL PARAMETERS:
2: String:     This can be a variable set to either true or false. At the end off
                each cycle it checks the variable. If set to true it stops the
                cycle. By default it is set to false (infinite cycle).

EXAMPLES USAGE IN SCRIPT:
[_redGroup, _bluGroup] spawn ADF_fnc_sad;
[_redGroup, _bluGroup, "huntBlue"] spawn ADF_fnc_sad;

EXAMPLES USAGE IN EDEN:
[group this, blueGroup1] spawn ADF_fnc_sad;

DEFAULT/MINIMUM OPTIONS
[_g1, _g2] spawn ADF_fnc_sad;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_sad"};

// Init
params [
	["_g", grpNull, [grpNull]],
	["_t", grpNull, [grpNull]],
	["_z", false, ["", true]]
];

// Check valid vars
if (_g == grpNull) exitWith {[format ["ADF_fnc_footPatrol - Empty SAD group passed: %1. Exiting", _g], true] call ADF_fnc_log; false};
if (_t == grpNull) exitWith {[format ["ADF_fnc_footPatrol - Empty target group passed: %1. Exiting", _t], true] call ADF_fnc_log; false};

// Search and Destroy
waitUntil {	
	// Get an estimated position (50 m radius) of the leader of the target group
	private _p = [_t, 50] call ADF_fnc_randomPos;
	
	// Move order
	{_x allowSprint false; _x doMove _p;} forEach units _g;	
	_g setSpeedMode "FULL";
	
	// Check how close the SAD group is to their target.
	if (([_g, _t] call ADF_fnc_checkDistance) < 125) then {
		_g setCombatMode "RED";
		_g setBehaviour "COMBAT";
	};
	
	sleep 10;
	
	// Check if the SAD order is still valid. If so, repeat the cycle.
	(
		({alive _x} count (units _g) < 1) || 
		({alive _x} count (units _t) < 1) ||
		(if (_z isEqualType "") then {missionNamespace getVariable [_z, false]} else {_z})
	)
};

if (ADF_debug) then {[format ["ADF_fnc_sad - SAD canceled for group %1 assaulting group %2.", _g, _t]] call ADF_fnc_log};

true