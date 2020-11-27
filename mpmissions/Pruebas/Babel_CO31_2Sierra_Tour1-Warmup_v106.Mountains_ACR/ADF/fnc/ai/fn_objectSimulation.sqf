/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_objectSimulation
Author: Whiztler
Script version: 1.01

File: fn_objectSimulation.sqf
**********************************************************************************
ABOUT
Disables/enables AI units/objects. Besides simulation it enables/disables:

- FSM (AI intelligence)
- Fire suppression
- Spotting and targeting
- Target orders
- Movement 

You can switch it off and on by script.

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Object:      AI Unit, vehicle, object.
1. Bool:        Switch objectSSimulation on or off?
                - false - switch off (default)
                - true - switch on

OPTIONAL PARAMETERS:
N/A

EXAMPLES USAGE IN SCRIPT:
[_dumb_ai, true] call ADF_fnc_objectSimulation;

EXAMPLES USAGE IN EDEN:
[this, true] call ADF_fnc_objectSimulation;

DEFAULT/MINIMUM OPTIONS
[_dumb_ai] call ADF_fnc_objectSimulation;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_objectSimulation"};

// Init
params [
	["_u", objNull, [objNull]],
	["_s", false, [true]]
];

// Switch off simulation
if !(_s) then {
	_u enableSimulation false; 
	
	_u disableAI "FSM";
	_u disableAI "SUPPRESSION"; 
	_u disableAI "TARGET";
	_u disableAI "AUTOTARGET";
	_u disableAI "MOVE"; 

	// Debug reporting
	if (ADF_debug || ADF_extRpt) then {[format ["ADF_fnc_objectSimulation - Simulation aspects disabled for: %1", _u]] call ADF_fnc_log};

// Switch on simulation	
} else {
	_u enableAI "FSM";
	_u enableAI "SUPPRESSION"; 
	_u enableAI "TARGET";
	_u enableAI "AUTOTARGET";
	_u enableAI "MOVE"; 
	
	_u enableSimulation true;
	
	// Debug reporting
	if (ADF_debug || ADF_extRpt) then {[format ["ADF_fnc_objectSimulation - Simulation aspects enabled for: %1", _u]] call ADF_fnc_log};
};

true