/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_unitSetSkill
Author: Whiztler
Script version: 1.01

File: fn_unitSetSkill.sqf
**********************************************************************************
ABOUT
Function to change the skill set of an AI in one swoop. See optional parameters for
skill set options.

Applies skill to a single unit. Use ADF_fnc_groopSetSkill if you wish to apply a
skill set for an entire group.
Info: https://community.bistudio.com/wiki/AI_Sub-skills

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Object:      the unit you wish to apply the skill set to.

OPTIONAL PARAMETERS:
1. String:      The skill set to apply:
                "untrained" - unskilled, slow to react 
                "recruit"   - semi skilled
                "novice"    - Skilled, trained. Vanilla+ setting (default)
                "veteran"   - Very skilled, Well trained
                "expert"    - Special forces quality

EXAMPLES USAGE IN SCRIPT:
[_myUnit, "veteran"] call ADF_fnc_unitSetSkill;

EXAMPLES USAGE IN EDEN:
[this, "expert"] call ADF_fnc_unitSetSkill;

DEFAULT/MINIMUM OPTIONS
[_soldier] call ADF_fnc_unitSetSkill;

RETURNS:
Object
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_unitSetSkill"};

// Init
params [
	["_u", objNull, [objNull]],
	["_s", "novice", [""]]
];

// Check if an AI behavior mod is running. Exit the script if this is the case.
if (ADF_mod_ASRAI || ADF_mod_VCOMAI || ADF_mod_BCOMBAT) exitWith {if (ADF_debug) then {["ADF_fnc_unitSetSkill - AI skill & behavior is controlled by a mod. Exiting."] call ADF_fnc_log;}; _u};

// Check valid vars
if !(_u isKindOf "CAManBase") exitWith {[format ["ADF_fnc_unitSetSkill - Incorrect unit passed: '%1'. Exiting", _u], true] call ADF_fnc_log; false};
if (	(_s != "untrained") && (_s != "recruit") && (_s != "novice") && (_s != "veteran") && (_s != "expert")) then {	_s = "novice"; if (ADF_debug) then {[format ["ADF_fnc_unitSetSkill - incorrect skill (%1) passed for group: %2. Defaulted to 'novice'.",_s, _g]] call ADF_fnc_log;}};

// Default skill values (novice)
private _k	= false;
private _s1	= 0.15;
private _s2	= 0.3;
private _s3	= 0.2;
private _s4	= 0.5;
private _s5	= 0.4;
private _s6	= 0.3;
private _s7	= 0.5;
private _s8	= 0.4;
private _s9	= 0.4;
private _s10	= 0.6;
private _s11	= 0.3; 

// Switch to selected skill set
switch _s do {	
	case "untrained"	: {_s1 = 0.05; _s2 = 0.1; _s3 = 0.1; _s4 = 0.1; _s5 = 0.3; _s6 = 0.1; _s7 = 0.2; _s8 = 0.1; _s9 = 0.2; _s10 = 0.2; _s11 = 0; _k = true};
	case "recruit"	: {_s1 = 0.07; _s2 = 0.2; _s3 = 0.1; _s4 = 0.2; _s5 = 0.4; _s6 = 0.2; _s7 = 0.3; _s8 = 0.3; _s9 = 0.3; _s10 = 0.4; _s11 = 0.1};
	case "novice"	: {};
	case "veteran"	: {_s1 = 0.2; _s2 = 0.6; _s3 = 0.25; _s4 = 0.6; _s5 = 0.5; _s6 = 0.4; _s7 = 0.8; _s8 = 0.6; _s9 = 0.5; _s10 = 0.7; _s11 = 0.4};
	case "expert"	: {_s1 = 0.35; _s2 = 0.75; _s3 = 0.35; _s4 = 1; _s5 = 0.8; _s6 = 0.55; _s7 = 1; _s8 = 0.7; _s9 = 0.6; _s10 = 1; _s11 = 0.7; };
};

// Set the skills
if (_k) then {_u disableAI "FSM";};
_u setSkill ["aimingAccuracy",_s1];
_u setSkill ["aimingShake",_s2];
_u setSkill ["aimingSpeed",_s3];
_u setSkill ["endurance",_s4];		
_u setSkill ["spotDistance",_s5];
_u setSkill ["spotTime",_s6];
_u setSkill ["courage",_s7];
_u setSkill ["reloadspeed",_s8];	
_u setSkill ["general",_s9];
if (_u == leader group _u) then {
	_u setSkill ["commanding",_s10];
} else {
	_u setSkill ["commanding",_s11];
};

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_unitSetSkill - Skill set '%1' set for unit: %2", _s, _u]] call ADF_fnc_log};

// Return the unit object with extensive job training added
_u