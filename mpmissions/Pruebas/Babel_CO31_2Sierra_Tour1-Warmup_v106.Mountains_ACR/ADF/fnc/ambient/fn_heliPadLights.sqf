/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_heliPadLights
Author: Whiztler
Script version: 1.02

File: fn_heliPadLights.sqf
**********************************************************************************
ABOUT
Creates (runway) lights around a circular helipad.

INSTRUCTIONS:
Place a circular helipad on the map. in the init put:
[this] call ADF_fnc_heliPadLights;

REQUIRED PARAMETERS:
0. Object:      The helipad object

OPTIONAL PARAMETERS:
1. String:      Helipad light color options:
                - "blue"
                - "red"
                - "yellow"
                - "white"
                - "green" (default)

EXAMPLES USAGE IN SCRIPT:
[_hPad, "white"] call ADF_fnc_heliPadLights;

EXAMPLES USAGE IN EDEN:
[this] call ADF_fnc_heliPadLights;

DEFAULT/MINIMUM OPTIONS
[_obj] call ADF_fnc_heliPadLights;

RETURNS:
Bool
*********************************************************************************/

if (!isServer) exitWith {};

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_heliPadLights"};

// init
params [
	["_o", objNull, [objNull]],
	["_k", "green", [""]]
];
private "_i";
private _p = getPosATL _o;
private _r = 5.75;
private _c = "";

// Check vars
if (!(typeOf _o == "Land_helipadCircle_F") && !(typeOf _o == "Land_helipadCivil_F") && !(typeOf _o == "Land_helipadEmpty_F")) exitWith {[format ["ADF_fnc_heliPadLights - Incorrect helipad object passed: '%1'. Position: %2. Exiting", typeOf _o, getPosASL _o], true] call ADF_fnc_log; false};
if (	(_k != "blue") && (_k != "red") && (_k != "yellow") && (_k != "white") && (_k != "green")) then {	_k = "green"; if (ADF_debug) then {[format ["ADF_fnc_heliPadLights - incorrect color (%1) passed for helipad: %2. Defaulted to 'green'.",_k, _o]] call ADF_fnc_log;}};

switch _k do {
	case "blue"		: {_c = "Land_runway_edgelight_blue_f"};
	case "red"		: {_c = "Land_Flush_Light_red_F"};
	case "yellow"	: {_c = "Land_Flush_Light_yellow_F"};
	case "white"		: {_c = "Land_runway_edgelight"};
	case "green";
	default			  {_c = "Land_Flush_Light_green_F"};
};

for "_i" from 1 to 360 step (360 / 8) do {
	private _px = (_p select 0) + (sin (_i) * _r);
	private _py = (_p select 1) + (cos (_i) * _r);
	private _pv = [_px, _py, _p select 2];
	private _v = createVehicle [_c, [0,0,0], [], 0, "CAN_COLLIDE"];
	_v setPos _pv;
	_v modelToWorld _pv;
};

true