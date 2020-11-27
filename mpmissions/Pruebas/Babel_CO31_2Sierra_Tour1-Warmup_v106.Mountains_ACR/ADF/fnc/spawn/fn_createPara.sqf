/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Para drop script
Author: Whiztler
Script version: 1.17

File: fn_createPara.sqf
**********************************************************************************
ABOUT:
This script creates a transport helicopter and an infantry fire team or infantry
squad. The units are loaded into the helicopter and then flown to the drop off
point where they will para drop.

You can pass 2 functions to the script:

Function1 will run (call) on individual units once the infantry group has been
created (e.g. a loadout script). Params passed to the function:
_this select 0: unit 

Function2 will run (spawn) on the group itself. Can be used to give the group
directives once they have landed (e.g. assault waypoints). Params passed to the
function: 
_this select 0: group.

After dropping off the para group, the helicopter returns to the spawn position
where the helicopter and its crew are deleted.

INSTRUCTIONS:
Execute (spawn) from the server.

REQUIRED PARAMETERS:
0. Position:    Spawn position. Marker, Object or Trigger. This is the position
                where both the helicopter and the para group are created
                E.g.. getMarkerPos "Spawn" -or- "SpawnPos" -or- MyObject
1. Position:    Para drop position. Marker, Object or Trigger. The para drop
                starts approx 350m from the drop position.

OPTIONAL PARAMETERS:
2. Side:        Side of the helicopter and the para group. Can be west, east or
                independent. Default: east
3. Number:      Para group size:
                - 1: Fire team
                - 2: Squad (default)
4. String:      Code to execute on each unit of the crew (e.g. a function).
                Default = "". Code is CALLED. Each unit of the group is passed
                (_this select 0) to the code/fnc.
5. String:      Code to execute on the crew on a group (e.g. a function).
                Default = "". Code is CALLED. The group is passed
                (_this select 0) to the code/fnc.

EEXAMPLES USAGE IN SCRIPT:
["paraSpawnMarker", "paraDropMarker", east, 2, "My_fnc_loadouteast", "My_fnc_paraAssault"] spawn ADF_fnc_createPara;

EXAMPLES USAGE IN EDEN:
0 = ["paraSpawnMarker", "paraDropMarker", east, 2] spawn ADF_fnc_createPara;

DEFAULT/MINIMUM OPTIONS
[_posA, _posB] spawn ADF_fnc_createPara;

RETURNS:
group
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createPara"};

// Init
private _dt	= diag_tickTime;
params [
	["_ps", "", ["", [], objNull, grpNull]],
	["_pd", "", ["", [], objNull, grpNull]],
	["_s", east, [west]],
	["_gt", 2, [0]],
	["_f1", "", [""]],
	["_f2", "", [""]]
];
private _vc	= "";
private _gs	= "";
private _gf	= "";
private _gfs	= "";
private _gft	= "";
private _sbi	= [];
private _sb	= "";
private _d 	= random 360;
private _ub	= false;

// Check valid vars
if !(_s in [west, east, independent]) exitWith {[format ["ADF_fnc_createPara - %1  side passed. Exiting", _s], true] call ADF_fnc_log; grpNull};
if (_f1 != "") then {if (isNil _f1) then {if (ADF_debug) then {[format ["ADF_fnc_createPara - incorrect code (%1) passed. Defaulted to ''.", _f1]] call ADF_fnc_log;}; _f1 = "";}};
if (_f2 != "") then {if (isNil _f2) then {if (ADF_debug) then {[format ["ADF_fnc_createPara - incorrect code (%1) passed. Defaulted to ''.", _f2]] call ADF_fnc_log;}; _f2 = "";}};
if (_gt > 2 || _gt < 1) then {_gt = 2;};

// Check the direction of the spawn position
if (_ps isEqualType "") then {
	_d = markerDir _ps
} else {
	if (_ps isEqualType objNull) then {
		_d = getDir _ps
	};
};

// Validate the spawn/drop-off position
_ps = [_ps] call ADF_fnc_checkPosition;
_pd = [_pd] call ADF_fnc_checkPosition;

// Check the side to determine the class of the transport helicopter and the para group
switch _s do {
	case west		: {_vc = "B_Heli_Transport_01_F"; _gf = "BLU_F"; _gfs = str _s; _gft = "BUS"};
	case east		: {_vc = "O_Heli_Transport_04_bench_F"; _gf = "OPF_F"; _gfs = str _s; _gft = "OIA"};
	case independent	: {_vc = "I_Heli_light_03_unarmed_F"; _gf = "IND_F"; _gfs = "Indep"; _gft = "HAF"};
};

// Create the helicopter at the spawn position
private _c = createGroup _s;
_c deleteGroupWhenEmpty true;
private _v = [_ps, (random 360), _vc, _c] call ADF_fnc_createCrewedVehicle;
_v = _v select 0;
_v setDir _d;

// Let's give the pilot a lot of alcohol so he doesn't get scared too much.
[(driver _v)] call ADF_fnc_heliPilotAI;

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_createPara - Heli crew group: %1 --- Helicopter: %2", _c, _v]] call ADF_fnc_log};

// Determine group size and put together classnames for ACM
switch _gt do {
	case 1	: {_gs = "_InfTeam"};
	case 2	: {_gs = if ((random 1) < 0.75) then {if (_s == independent) then {"_InfSquad"} else {"_InfAssault"}} else {"_InfSquad_Weapons"}};
};

_gs = format ["%1%2", _gft, _gs];
// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_createPara - group ACM class: %1", _gs]] call ADF_fnc_log};

// Create the para group. Disabled cached and ownership transfer to the HC for the time being
private _g = [_ps, _s, (configFile >> "CfgGroups" >> _gfs >> _gf >> "Infantry" >> _gs)] call BIS_fnc_spawnGroup;	
private _u = units _g;
_g setVariable ["ADF_noHC_transfer", true];
_g setVariable ["zbe_cacheDisabled", true];

// Apply the units function on the para group units (call)
if (_f1 != "") then {
	{[_x] call (call compile format ["%1", _f1])} forEach _u;
	if (ADF_debug) then {[format ["ADF_fnc_createPara - call %1 for units of group: %2",_f1,_g]] call ADF_fnc_log};
};
// Apply the para group function on the para group (spawn)
if (_f2 != "") then {
	[_g] spawn (call compile format ["%1", _f2]);
	if (ADF_debug) then {[format ["ADF_fnc_createPara - spawn %1 for group: %2",_f2,_g]] call ADF_fnc_log};	
};

// If the unit has a backpack then store the backpack + backpack items before we move the unit inside the cargo of the helicopter
{
	if ((backpack _x) != "") then {
		_sbi = backpackItems _x;
		_sb = backpack _x;
		removeBackpack _x;
		_ub = true;
	};
	_x assignAsCargo _v;
	_x moveInCargo _v;
	_x allowDamage false;
	_x disableCollisionWith _v;
} forEach _u;

[_u] allowGetIn false;

// Check distance to drop off location and spawn the para drop function
[_u, _ub, _sb, _sbi, _v, _pd] spawn {
	params ["_u","_ub","_sb","_sbi","_v","_pd"];
	waitUntil {
		sleep 1;
		([_v, _pd] call ADF_fnc_checkDistance) < 350
	};
	{[_x, _ub, _sb, _sbi] spawn ADF_fnc_paraDrop; sleep 0.6} forEach _u;
};

// Create the waypoints for the helicopter
_v flyInHeight (110 + (random 50));
private _wp = _c addWaypoint [_pd, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointCombatMode "GREEN";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointCompletionRadius 50;

_wpx = _c addWaypoint [_ps, 0];
_wpx setWaypointType "MOVE";
_wpx setWaypointBehaviour "COMBAT";
_wpx setWaypointCombatMode "GREEN";
_wpx setWaypointSpeed "NORMAL";
_wpx setWaypointCompletionRadius 50;

// Start fall back timer. If the aircraft is stuck at the spawn position for 30+ seconds then delete the vehicle + crew + para group
private _t = round time;
waitUntil {
	sleep 3;
	(([_ps, _pd] call ADF_fnc_checkDistance) > 100) || (time > _t + 30.1) || !(alive _v)
};
if (time > (_t + 30)) exitWith {
	[[_v, _g]] call ADF_fnc_delete;
	[format ["ADF_fnc_createPara - Terminate for helicopter: %1 - group: %2 - Stuck at spawn position (30 seconds timer)", _v, _g]] call ADF_fnc_log;
};

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_createPara - Diag time to execute function: %1", diag_tickTime - _dt]] call ADF_fnc_log};

// Delete the para aircraft and its crew after they have returned or when they are stuck the ARMA way (5 min timer).
waitUntil {sleep 2; !(alive _v) || ((currentWaypoint (_wp select 0)) > (_wp select 1))};
private _t = round time;
waitUntil {sleep 1; !(alive _v) || (time > _t + 300) || ((currentWaypoint (_wpx select 0)) > (_wpx select 1))};
if !(isNull _v) then {[_v] call ADF_fnc_delete};

// Return the group
_g