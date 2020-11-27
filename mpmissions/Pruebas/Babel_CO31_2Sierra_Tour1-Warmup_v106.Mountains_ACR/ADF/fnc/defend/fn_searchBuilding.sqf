/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_searchBuilding
Author: Whiztler
Script version: 1.15

File: fn_searchBuilding.sqf
**********************************************************************************
This function can be used for a group leader to search a building close to him.
The function is used by ADF_fnc_foorPatrol.
The group leader searches a closeby building within the given radius. After
searching the group continues with their directives (e.g. waypoints, patrol, etc).

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Group:       group that will search the nearest building

OPTIONAL PARAMETERS:
1. Number:      Maximum search time in seconds. Default: 60.
2. Number:      Maximum distance to search for nearest building. Default: 50.

EXAMPLES USAGE IN SCRIPT:
[_grp, 30, 25] call ADF_fnc_searchBuilding;

EXAMPLES USAGE IN EDEN:
[group this, 120, 100] call ADF_fnc_searchBuilding;

DEFAULT/MINIMUM OPTIONS
[_g] call ADF_fnc_searchBuilding;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_searchBuilding"};

// init
params [
	"_a",
	["_s", 60, [0]],
	["_d", 50, [0]]
];
private "_i";
private _g = if (typeName _a == "GROUP") then {_a} else {group _a;};
private _l = leader _g;
private _p = getPosASL _l;

// Lock the wayoint cycle
_g lockwp true;

// Ownership change and debug reporting
if !(local _g) exitWith {if (ADF_debug || ADF_extRpt) then {[format ["ADF_fnc_searchBuilding - Group %1 -- Ownership changed. Current owner ID: %2 [EXITING]", _g, (groupOwner _g)]] call ADF_fnc_log}};
if (ADF_debug) then {[format ["ADF_fnc_searchBuilding - starting. Time: %1 (search timer: %2 seconds) -- Max. search distance: %3 meters", time, _s, _d]] call ADF_fnc_log};

// Check the closest building and verify that the diatance group leader, building is less than 50 meters
private _b = nearestBuilding _p;
if ((isNil "_b") || (_b == objNull) || ((_p distance (getPosASL _b)) > _d)) exitWith {
	_g lockwp false;
	if (ADF_debug) then {[format ["ADF_fnc_searchBuilding - No results for group: %1 -- Building: %2 (distance: %4) -- Position group loader: %3", _g, _b, _p, round (_l distance _b)]] call ADF_fnc_log};
};

// Get the building positions within the building
private _bp = [_b, 5] call BIS_fnc_buildingPositions;
_bc = (count _bp);
if (ADF_debug) then {[format ["ADF_fnc_searchBuilding - Group: %1 -- Building: %2 (distance: %5) -- Positions: %3 (max: %4)", _g, _b, count _bp, _bc, round (_l distance _b)]] call ADF_fnc_log};

// Order the leader to search max 4 of the building positions within the building.
for "_i" from 0 to _bc do {
	// Set the timer
	private _z = time + _s;
	
	// Ownership change and debug reporting
	if !(local _g) exitWith {if (ADF_debug || ADF_extRpt) then {[format ["ADF_fnc_searchBuilding - Group %1 -- Ownership changed. Current owner ID: %2 [EXITING]", _g, (groupOwner _g)]] call ADF_fnc_log}};
	if (ADF_debug) then {[format ["ADF_fnc_searchBuilding - Time: %1 (max time: %2)", time, _z]] call ADF_fnc_log};
	
	// All positions searched. Continue with patrol
	if (_i == _bc) exitWith {
		if (ADF_debug) then {[format ["ADF_fnc_searchBuilding - Group: %1 -- Last position reached. Position: %2", _g, _i]] call ADF_fnc_log};
		_g lockwp false;
	};	
	
	// Order the group leader to search the building positions
	_l commandMove (_b buildingPos _i);
	if (ADF_debug) then {[format ["ADF_fnc_searchBuilding - SEARCHING Position: %1", _i]] call ADF_fnc_log};
	
	// Stop searching when the timer runs out
	if (time > _z) exitWith {
		if (ADF_debug) then {[format ["ADF_fnc_searchBuilding - Group: %1 -- Search timer (%2 seconds) ran out: %3 seconds. Time: %4", _g, _s, time - _z, time]] call ADF_fnc_log};
		_g lockwp false;
	};
	
	waitUntil {sleep 1; unitready _l || !(local _g) || !alive _l};
	if (ADF_debug) then {[format ["ADF_fnc_searchBuilding - Finished Searching Position: %1 -- Time: %2", _i, time]] call ADF_fnc_log};
};

true
