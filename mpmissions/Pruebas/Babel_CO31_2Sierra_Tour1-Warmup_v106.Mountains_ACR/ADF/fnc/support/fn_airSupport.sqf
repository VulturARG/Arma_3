/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: air support script
Author: Whiztler
Script version: 1.13

File: ADF_fnc_airSupport.sqf
**********************************************************************************
ABOUT
Air support function that activates the BIS cas run.

INSTRUCTIONS:
Execute (call) from the server

REQUIRED PARAMETERS:
0. Side:        west, east, independent. Side of the CAS support plane
1. Position:    CAS position. Marker, object, trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
2. Number       Approach vector in degrees. Default: -1 (direction of the marker)
3. Number       CAS weapons type:
                0 - Machine gun (Blufor/west only)
                1 - Missiles (default)
                2 - Machine gun and missiles 

EXAMPLES USAGE IN SCRIPT:
[west, "support", -1, 0] call ADF_fnc_airSupport;

EXAMPLES USAGE IN EDEN:
[independent, CSAThmg, 95, 1] call ADF_fnc_airSupport; // CSAThmg is a named enemy vehicle

DEFAULT/MINIMUM OPTIONS
[west, "myCAS"] call ADF_fnc_airSupport;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_airSupport"};
	
// init
private _dt = diag_tickTime;
params [
	["_s", west, [east]],
	["_p", "", ["", [], objNull, grpNull]],
	["_d", -1, [0]],
	["_w", 1, [0]]
];
private _v 	= 0;
private _a 	= false;
private _o 	= objNull;
private _vc	= "";

// Check valid vars
if !(_s in [west, east, independent]) exitWith {[format ["ADF_fnc_airSupport - %1  side passed. Exiting", _s], true] call ADF_fnc_log; grpNull};
if (_w > 2) then {_w = 1};

// Check approach vector type
if (_d == -1) then {
	if (typeName _p == "STRING") then {_v = markerDir _p};
	if (typeName _p == "OBJECT") then {_v = getDir _p; _a = true; _o = _p};
} else {
	_v = _d;
};

// Check the location position
_p = [_p] call ADF_fnc_checkPosition;

// Determine aircraft based on side
switch _s do {
	case west 		: {_vc = "B_Plane_CAS_01_F"};
	case east 		: {_vc = "O_Plane_CAS_02_F"; _w = 1};
	case independent	: {_vc = "I_Plane_Fighter_03_CAS_F";  _w = 1};	
};

// Create simulation object for CAS target purpose
private _t = "Land_PenBlack_F" createVehicle [0,0,0];
_t setPos _p;
if (_a) then {_t attachTo [_o]} else {_t enableSimulationGlobal false};	
_t hideObjectGlobal true;
_t setVariable ["type", _w];
_t setVariable ["vehicle", _vc];	
_t setDir _v;
// Delete the simulation object after 30 seconds
[_t] spawn {params ["_t"]; sleep 30; deleteVehicle _t};

//  Call the BIS CAS module
[_t, nil, true] call BIS_fnc_moduleCAS;

// Debug reporting
if (ADF_debug) then {
	[format ["ADF_fnc_airSupport - CAS (%1) created. Expedite to position: %2", _vc, _p]] call ADF_fnc_log;
	[format ["ADF_fnc_airSupport - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log;
};

// return bool
true	