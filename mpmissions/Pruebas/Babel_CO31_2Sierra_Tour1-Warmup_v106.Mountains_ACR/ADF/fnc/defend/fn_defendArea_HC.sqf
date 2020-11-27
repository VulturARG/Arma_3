/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_defendArea_HC
Author: Whiztler
Script version: 1.16

File: fn_defendArea_HC.sqf
**********************************************************************************
ABOUT
Executed automatically by a Headless Client once the ownership of a garrisoned
group changes from Server to HC (HC load balancer). The HC reapplies garrison
directives such as garrison position, stance, altitude.
The function is exclusively used by ADF_fnc_DefendArea

INSTRUCTIONS:
Call from script on the server

REQUIRED PARAMETERS:
0: Group        Garrisoned group
1: Array        Array of garrison data for each unit of the group (set by
                ADF_fnc_DefendArea)

OPTIONAL PARAMETERS:
N/a

EXAMPLE
[_g, _arr] call ADF_fnc_defendArea_HC;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_defendArea_HC"};

// init
private _dt = diag_tickTime;
params [
	["_g", grpNull, [grpNull]],
	["_a", [], [[]]]
];
private "_i";
private _c = count _a;

if (_c == 0) exitWith {if (ADF_debug) then {[format ["ADF_fnc_defendArea_HC - Passed array: %1 seems to be empty (%2)",_a,_c]] call ADF_fnc_log}};
_g enableAttack false;	

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_defendArea_HC - group: %1 -- array count: %2 -- array: %3",_g,_c,_a]] call ADF_fnc_log};

// reapply garrison position for each unit
for "_i" from 0 to (_c - 1) do {
	private _u	= (_a select _i) select 0;
	private _up	= (_a select _i) select 1;
	
	_u allowDamage false;
	_u setPosATL [_up select 0, _up select 1, ( _up select 2) + .15]; // Direct placement without movement.
	if (ADF_debug) then {[format ["ADF_fnc_defendArea_HC - SetPosATL for unit: %1 -- position: %2",_u,_up]] call ADF_fnc_log};
	_u disableAI "move";
	if ((_up select 2) > 4) then {_u setUnitPos "MIDDLE"} else {_u setUnitPos "_UP"};
	_u setDir (_u getVariable ["ADF_garrSetDir",(random 360)]);		
	doStop _u;
	_u allowDamage true;
	
	[_u] spawn {
		params ["_u"];
		waitUntil {sleep 1 + (random 1); !(unitReady _u)};
		_u enableAI "move";
	};
};

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_defendArea_HC - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};

true
