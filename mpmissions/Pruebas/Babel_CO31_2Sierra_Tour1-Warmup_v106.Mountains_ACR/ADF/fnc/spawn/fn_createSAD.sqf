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
This function spawns an foot mobiles group that actively tracks another group and
assaults them when possible.

INSTRUCTIONS:
Execute (call) fro the server or HC

REQUIRED PARAMETERS:
0. Group:       Group that will be tracked/assaulted.

OPTIONAL PARAMETERS:
1. Side:        Side of OpFor. Default: east 
2. Number:      Opfor group size. 2, 4 or 8. Default: 4
3. Number:      Spawn distance in meters. Default: 500
4. String:      Skill set:
                "untrained"
                "recruit"
                "novice" (default)
                "veteran"
                "expert"
5. String:      Code to execute on each unit of the crew (e.g. a function).
                Default = "". Code is CALLED. Each unit of the group is passed
                (_this select 0) to the code/fnc.
6. String:      Code to execute on the crew of a group (e.g. a function).
                Default = "". Code is CALLED. The group is passed
                (_this select 0) to the code/fnc.
7: String:     This can be a variable set to either true or false. At the end off
                each cycle it checks the variable. If set to true it stops the
                cycle. By default it is set to false (infinite cycle).

EXAMPLES USAGE IN SCRIPT:
[_targetGrp, east, 8, "veteran", "", "my_fnc_uniformChange", "cancelHunt"] call ADF_fnc_createSAD;
[_targetGrp, east, 2] call ADF_fnc_createSAD;

EXAMPLES USAGE IN EDEN:
[group this, west, 8] call ADF_fnc_createSAD;

DEFAULT/MINIMUM OPTIONS
[_grp] call ADF_fnc_createSAD;

RETURNS:
SAD group
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createSAD"};

// Init
params [
	["_t", grpNull, [grpNull]],
	["_s", east, [west]],
	["_n", 4, [0]],
	["_r", 500, [999]],
	["_k", "novice", [""]],
	["_c1", "", [""]],
	["_c2", "", [""]],
	["_z", false, ["", true]]
];
private _gi = "";
private _gd = "";
private _gf = "";

// Check valid vars
if (_t == grpNull) exitWith {[format ["ADF_fnc_createSAD - Invalid group passed: %1. Exiting", _t]] call ADF_fnc_log; grpNull};	
if (_s == civilian || _s == sideLogic) exitWith {[format ["ADF_fnc_createSAD - %1 SAD side passed for group %2. Exiting", _s, _t]] call ADF_fnc_log; grpNull};
if (_r < 250) then {_r = 250;};
if (_n > 8) then {_n = 8;};
if (	(_k != "untrained") && (_k != "recruit") && (_k != "novice") && (_k != "veteran") && (_k != "expert")) then {_k = "novice"; if (ADF_debug) then {[format ["ADF_fnc_createSAD - incorrect skill (%1) passed for group: %2. Defaulted to 'novice'.",_k, _g]] call ADF_fnc_log;}};
if (_c1 != "") then {if (isNil _c1) then {if (ADF_debug) then {[format ["ADF_fnc_createSAD - incorrect code (%1) passed. Defaulted to ''.", _c1]] call ADF_fnc_log;}; _c1 = "";}};
if (_c2 != "") then {if (isNil _c2) then {if (ADF_debug) then {[format ["ADF_fnc_createSAD - incorrect code (%1) passed. Defaulted to ''.", _c2]] call ADF_fnc_log;}; _c2 = "";}};
	
// check group size/type
private _gz = switch (_n) do {
	case 1;
	case 2: {"InfSentry", "SniperTeam"};
	case 3;
	case 4;
	case 5: {selectRandom ["InfTeam","InfTeam_AA","InfTeam_AT"]};
	case 6;
	case 7;
	case 8: {selectRandom ["InfSquad_Weapons", "InfSquad"]};		
	default {"InfTeam"};
};

switch (_s) do {
	case west:			{_gd = "WEST"; _gf = "BLU_F"; _gi = "BUS_"};
	case east: 			{_gd = "EAST"; _gf = "OPF_F"; _gi = "OIA_"};
	case independent:		{_gd = "INDEP"; _gf = "IND_F"; _gi = "HAF_"};
};

// Determine spawn position
private _p = [_t, _r] call ADF_fnc_randomPosMax;

// Format the group class
private _gt = format ["%1%2",_gi,_gz];

// Create the SAD group
private _g = [_p, _s, (configFile >> "CfgGroups" >> _gd >> _gf >> "Infantry" >> _gt)] call BIS_fnc_spawnGroup;
_g deleteGroupWhenEmpty true;
_g setBehaviour "CARELESS";
_g allowFleeing 0;

// Set the given skill set
[_g, _k] call ADF_fnc_groupSetSkill;

// Execute custom passed code/function
if (_c1 != "") then {
	// Each unit in the group
	{[_x] call (call compile format ["%1", _c1])} forEach units _g;
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createSAD - call %1 for each unit of group: %2",_c1,_g]] call ADF_fnc_log};	
};

if (_c2 != "") then {
	// Group
	[_g] call (call compile format ["%1", _c2]);
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createSAD - call %1 for group: %2",_c2,_g]] call ADF_fnc_log};		
};

// call the SAD function
[_g, _t, _z] spawn ADF_fnc_sad;

// Return the new group
_g