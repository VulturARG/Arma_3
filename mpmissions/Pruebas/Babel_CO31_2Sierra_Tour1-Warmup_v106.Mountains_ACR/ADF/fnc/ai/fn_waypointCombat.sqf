/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_waypointCombat
Author: Whiztler
Script version: 1.05

File: fn_waypointCombat.sqf
**********************************************************************************
ABOUT:
This function makes groups in vehicles switch to combat mode when attacked or when
they spot an enemy. The function is triggered when the groups combat mode changes
from safe/aware to combat. The group pauses their 'normal' patrol and enter a 
'search and destroy' mode for at least 3 minutes. After the SAD period the group
continues with their original patrol.

Note that this function is automatically spawned with the 
ADF_fnc_createVehiclePatrol function for any vehicle that has a turret.

INSTRUCTIONS
Execute (spawn) from the server or HC

REQUIRED PARAMETERS:
0. Group:       Group. Should be in a vehicle with a turret.

OPTIONAL PARAMETERS:
N/A

EXAMPLES USAGE IN SCRIPT:
[_grp] spawn ADF_fnc_waypointCombat;

EXAMPLES USAGE IN EDEN:
[group this] spawn ADF_fnc_waypointCombat;

DEFAULT/MINIMUM OPTIONS
[myGroup] spawn ADF_fnc_waypointCombat;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_waypointCombat"};

// Init
params [
	["_g", grpNull, [grpNull]]
];
private _l = leader _g;
private _s = side _g;
private _v = vehicle _l;
private _b = behaviour _l;

// Check valid vars & valid application
if (_g == grpNull) exitWith {[format ["ADF_fnc_waypointCombat - Empty group passed: %1. Exiting", _g], true] call ADF_fnc_log; false};	
if (_b == "COMBAT") exitWith {if (ADF_debug) then {[format ["ADF_fnc_waypointCombat - group (%1) behavior is set at %2. Exiting.", _g, behaviour _l]] call ADF_fnc_log}; false};
if (isNull objectParent _l) exitWith {if (ADF_debug) then {[format ["ADF_fnc_waypointCombat - group (%1) leader is not in a vehicle. Exiting.", _g]] call ADF_fnc_log}; false};
if !(canFire _v || canMove _v) exitWith {if (ADF_debug) then {[format ["ADF_fnc_waypointCombat - The groups (%1) vehicle (%2) cannot move or fire. Exiting.", _g, _v]] call ADF_fnc_log}; false};

if (ADF_debug) then {[format ["ADF_fnc_waypointCombat - monitoring combat behavior for group: %1 (current: %2)", _g, _b]] call ADF_fnc_log};

// monitor behavior change. 3 seconds interval
waitUntil {
	sleep 3;
	((behaviour (leader _g)) == "COMBAT" || !alive (leader _g))
};
if (!alive (leader _g)) exitWith {if (ADF_debug) then {[format ["ADF_fnc_waypointCombat - Group (%1) seems no longer to be alive. Exiting", _g], true] call ADF_fnc_log;}; false};	

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_waypointCombat - group (%1) combat behavior changed to: %1", _b]] call ADF_fnc_log};

// Create a dummy group and store the waypoints. The dummy units is created else ARMA or the cleanup script deletes the empty group.
private _dummy = createGroup _s;
private _u = _dummy createUnit ["C_man_1", [0,0,0] ,[], 0, "NONE"];
_u allowDamage false;
[_u] call ADF_fnc_objectSimulation;
_dummy copyWaypoints _g;

// Delete the waypoints and assign a SAD waypoint
[_g] call ADF_fnc_delWaypoint;
private _p = getPosWorld _v;
private _wp = _g addWaypoint [_p, 0];
_wp setWaypointType "SAD";

// Let's override the default BIS timeout and set the SAD to at least 3 minutes.
private _t = time;
waitUntil {
	sleep 5;
	if (speed _v == 0) then {
		[_g] call ADF_fnc_delWaypoint;
		private _wp = _g addWaypoint [_p, 0];
		_wp setWaypointType "SAD";
	};
	(time > (_t + (180 + (random 30))) || !alive (leader _g))
};

// monitor when the group change back to safe/aware mode
waitUntil {
	sleep 3;
	(!((behaviour (leader _g)) == "COMBAT") || !alive (leader _g))
};
if (!alive (leader _g)) exitWith {
	if (ADF_debug) then {[format ["ADF_fnc_waypointCombat - Group (%1) seems no longer to be alive. Exiting", _g], true] call ADF_fnc_log;};
	[_dummy] call ADF_fnc_delete;
	false
};	

// Debug reporting
if (ADF_debug) then {systemChat format ["ADF_fnc_waypointCombat - group (%1) combat behavior changed to: %1. Continue original patrol", _b];};

// Return the original waypoints & combat behavior
[_g] call ADF_fnc_delWaypoint;
_g copyWaypoints _dummy;
[_dummy] call ADF_fnc_delete;
_g setBehaviour _b;

// Repeat
if (alive (leader _g)) then {
	[_g] spawn ADF_fnc_waypointCombat;
	true
} else {
	if (ADF_debug) then {[format ["ADF_fnc_waypointCombat - Group (%1) seems no longer to be alive. Exiting", _g], true] call ADF_fnc_log;};
	false
};	
