/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Create Garrison
Author: Whiztler
Script version: 1.06

File: fn_createGarrison.sqf
**********************************************************************************
ABOUT:
This function creates a group (2, 4 or 8 pax) that will garrison/militarize a
given area/position. The units will first populate all available empty turrets
(static weapons and vehicle turrets).If you do not want a turret to be populated
than lock the turret in the editor/script (lock, NOT lock player).

Units will look for buildings that have pre-defined (ARMA 3 engine) garrison
positions. There is a 60% chance they will populate the highest (incl roof)
positions first. 
Once all the garrison positions have been populated, the units that could not
get a garrison position will patrol the area (same radius). You can order the
patrol units to search nearby houses (default is false).
You can execute (optional) two functions. One for the group and one for each unit
of the group.

INSTRUCTIONS:
Execute from the server or headless client.

REQUIRED PARAMETERS:
0. Position:    Spawn position. Marker, Object or Trigger.

OPTIONAL PARAMETERS:
1. Side:        west, east or independent. Default: east
2. Number:      Group size: 1 - 8 units. Default: 4
3. Bool:        true for weapons squad, false for rifle squad. Default: false
4. Number:      Radius in meters from the spawn position.  . Default: 50)
5. Bool:        Search buildings (patrol units)
                - true
                - false (default)
6. String:      Code to execute on each unit of the crew (e.g. a function).
                Default = "". Code is CALLED. Each unit of the group is passed
                (_this select 0) to the code/fnc.
7. String:      Code to execute on the crew aa a group (e.g. a function).
                Default = "". Code is CALLED. The group is passed
                (_this select 0) to the code/fnc.
8. Number:      Maximum number of positions to be occuppied in each building.
                Default: -1 (uncapped)
9. Bool:        Roof top and top floor positions get prioritized for garrison?
                - true (default)
                - false

EXAMPLES USAGE IN SCRIPT:
[_spawnPos, west, 4, false, 100, false, "my_fnc_changeUniform"] call ADF_fnc_createGarrison;

EXAMPLES USAGE IN EDEN:
["mySpawnMarker", east, 8, true, 100, true, "", ""] call ADF_fnc_createGarrison;

DEFAULT/MINIMUM OPTIONS
["DefendMarker"] call ADF_fnc_createGarrison;

RETURNS:
Group
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createGarrison"};

// Init
private _dt = diag_tickTime;
params [
	["_p", "", ["", [], objNull, grpNull]],
	["_s", east, [west]],
	["_n", 4, [0]],
	["_w", false, [true]],
	["_r", 50],
	["_b", false, [true]],
	["_c1", "", [""]],
	["_c2", "", [""]],
	["_m", -1, [0]],
	["_z", true, [false]]
];

// Check valid vars
if (_s == sideLogic) exitWith {[format ["ADF_fnc_createGarrison - %1  side passed. Exiting", _s], true] call ADF_fnc_log; grpNull};
if (_c1 != "") then {if (isNil _c1) then {if (ADF_debug) then {[format ["ADF_fnc_createGarrison - incorrect code (%1) passed. Defaulted to ''.", _c1]] call ADF_fnc_log;}; _c1 = "";}};
if (_c2 != "") then {if (isNil _c2) then {if (ADF_debug) then {[format ["ADF_fnc_createGarrison - incorrect code (%1) passed. Defaulted to ''.", _c2]] call ADF_fnc_log;}; _c2 = "";}};
if (_n > 8) then {_n = 8;};
if (_n < 2) then {_n = 2;};

// Check the location position
_p = [_p] call ADF_fnc_checkPosition;

private _gi	= "";
private _gs	= "";
private _gf	= "";

// check group size/type
private _gt = switch (_n) do {
	case 1;
	case 2: {"InfSentry"};
	case 3;
	case 4;
	case 5: {"InfTeam"};
	case 6;
	case 7;
	case 8: {if (_w) then {"InfSquad_Weapons"} else {"InfSquad"}};		
	default {"InfTeam"};
};

switch (_s) do {
	case west:		{_gs = "west"; _gf = "BLU_F"; _gi = "BUS_"};
	case east: 		{_gs = "east"; _gf = "OPF_F"; _gi = "OIA_"};
	case independent:	{_gs = "indep"; _gf = "IND_F"; _gi = "HAF_"};
};

private _gg = format ["%1%2",_gi,_gt];

// Create the group
private _g = [_p, _s, (configFile >> "CfgGroups" >> _gs >> _gf >> "Infantry" >> _gg)] call BIS_fnc_spawnGroup;
_g deleteGroupWhenEmpty true;

// Execute custom passed code/function
if (_c1 != "") then {
	// Each unit in the group
	{[_x] call (call compile format ["%1", _c1])} forEach units _g;
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_mod_createGarrison - call %1 for each unit of group: %2",_c1,_g]] call ADF_fnc_log};
};

if (_c2 != "") then {
	// Group
	[_g] call (call compile format ["%1", _c2]);
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_mod_createGarrison - call %1 for group: %2",_c2,_g]] call ADF_fnc_log};		
};

// Garrison function
[_g, _p, _r, _m, _b, _z] call ADF_fnc_defendArea;

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_mod_createGarrison - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};

// Return the group
_g