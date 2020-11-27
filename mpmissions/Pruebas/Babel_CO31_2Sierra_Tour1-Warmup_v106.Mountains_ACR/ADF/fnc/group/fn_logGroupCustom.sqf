/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_logGroupCustom
Author: Whiztler
Script version: 1.01

File: fn_logGroupCustom.sqf
**********************************************************************************
ABOUT
Function to log a side's groups into an array of your choice.

INSTRUCTIONS:
You'll need to initialize an array that you want the groups to be stored in. Do
this at the start of your script so it only initializes once. E.g.:
myOpforGroupsList = [];

Call the function after each created group. This function does not track civilian
groups

REQUIRED PARAMETERS:
0. Group:       name or variable of the group       
1. String:      Name of the array. E.g. "myOpforGroupsList"

OPTIONAL PARAMETERS:
2. Side:            west, east or independent (default: east)

EXAMPLES USAGE IN SCRIPT:
_mylist = [_grp, "myOpforGroupsList"] call ADF_fnc_logGroupCustom;

EXAMPLES USAGE IN EDEN:
[group this, "myOpforGroupsList", east] call ADF_fnc_logGroupCustom;

DEFAULT/MINIMUM OPTIONS
[_grp, "westArray"] call ADF_fnc_logGroupCustom;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_logGroupCustom"};

// Init
params [
	["_g", grpNull, [grpNull]],
	["_a", "", [""]],
	["_s", east, [west]]
];
private _c = false;
private _n = [];

// Check the check of the group and continue or terminate
if !(side _g == _s) exitWith {if (ADF_debug) then {diag_log format["ADF Debug: ADF_fnc_logGroupCustom - Side of Group: %1 is %2. Logging side is: %3",_g,side _g,_s]}; false};

// Reporting
if (ADF_debug) then {[format["ADF_fnc_logGroupCustom - Processing: Group: %1 - Custom Array: %2",_g,_a]] call ADF_fnc_log};

// Check is the variable is valid
if (typeName _a != "STRING") exitWith {
	if (ADF_debug) then {["ADF_fnc_logGroupCustom - ERROR, no valid input provided. Should be a string. Exiting.", true] call ADF_fnc_log};
	false
};
// Check if the array is empty
if (count _a == 0) then {_c = true};

_n = missionNamespace getVariable [_a,[]];
if (ADF_debug) then {[format ["ADF_fnc_logGroupCustom - Custom Array: %1 - Stored: %2",_a,_n]] call ADF_fnc_log};

// First run initialization
if (_c) exitWith {		
	
	if (ADF_debug || ADF_extRpt) then {["ADF_fnc_logGroupCustom - First run."] call ADF_fnc_log};
	// Loop through all groups every 5 seconds to check for empty groups
	[_n,_g,_a] spawn {
		params ["_n","_g","_a"];
		
		_n pushBackUnique _g;
		missionNamespace setVariable [_a,_n];
				
		waitUntil {
		
			{
				if (_x in _n) then {
					if (count (units _x) == 0 || _x == grpNull) then {_n = _n - [_x]};
				};
			} forEach allGroups;
			
			missionNamespace setVariable [_a,_n];
			sleep 5;
			
			false
		};
	};
	
	true
};

// Add the group to the custom array
_n pushBackUnique _g;
missionNamespace setVariable [_a,_n];
if (ADF_debug) then {[format ["ADF Debug: ADF_fnc_logGroupCustom - Added group to %1 - Stored: %2",_a,_n]] call ADF_fnc_log};

// Add the group to the regular logGroup as well:
[_g] call ADF_fnc_logGroup;

true