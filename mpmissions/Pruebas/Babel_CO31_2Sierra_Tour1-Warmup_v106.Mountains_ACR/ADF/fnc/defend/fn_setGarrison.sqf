/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_setGarrison
Author: Whiztler
Script version: 1.14

File: fn_setGarrison.sqf
**********************************************************************************
ABOUT
The setGarrison function is executed by the defendArea function for units that
have been assigned a position within a building. It makes the unit move (walk/run)
to the position. Once at the position the unit remain stationary untill a thread
has been detected. Used by ADF_fnc_defendArea.

INSTRUCTIONS:
Execute (spawn) from the server or HC

REQUIRED PARAMETERS:
0. Object:      The AI unit that needs to garrison.
1. Array:       Position within a building (buildingposition)
2. Object:      The building in question

OPTIONAL PARAMETERS:
N/a

EXAMPLES USAGE IN SCRIPT:
[_myAiUnit, [1234,1234,3], [building:mapobject]] spawn ADF_fnc_setGarrison;

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
N/A

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_setGarrison"};

// init
private _dt = diag_tickTime;
params [
	["_u", objNull, [objNull]],
	["_p", [0, 0, 0], [[]], [3]],
	["_b", objNull, [objNull]]
];

// Move the unit inside the predefined building position. Give the unit 60 secs to reach its position.	
private _t = time;
private _s = "UP";
_u doMove _p;
_u forceSpeed 6;
sleep 5;
waitUntil {unitReady _u || (time == _t + 60)};

// Set unit just in case the building or building position is bugged
_u allowDamage false;
_u setPosATL [_p select 0, _p select 1, ( _p select 2) + .15];
_u doMove _p;
sleep 1;
_u allowDamage true;

// Attempt to make the unit face outside 
private _d = (_u getRelDir _b) - 180;
private _e = _u getRelPos [1000, _d];
_u doWatch _e;
_u setDir _d;	

// Store the units direction
_u setVariable ["ADF_garrSetDir",_d];

if !([_u] call ADF_fnc_outsidePosUnit) then {
	if (random 1 < 0.25) then {
		_u setUnitPos "MIDDLE";
		_s = "MIDDLE";
	} else {
		_u setUnitPos "UP";
	};
};

// Add the EH that starts the takeCover function
_u addEventHandler ["FiredNear", {[_this select 0, _s, _w] call ADF_fnc_takeCover}];

_u disableAI "move";
doStop _u;
commandStop _u;

//_u setVariable ["ADF_garrSetBuilding", [true, _p]];

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_setGarrison - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};

waitUntil {sleep 1 + (random 1); !(unitReady _u)};
_u enableAI "move";