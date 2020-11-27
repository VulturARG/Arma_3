/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_randomPosInArea
Author: Whiztler
Script version: 1.02

File: fn_randomPosInArea.sqf
**********************************************************************************
ABOUT
Searches for a position in a predefined area (e.g. marker, trigger). The function 
is precise with circular triggers/markers. With uneven shapes, units/objects might
spawn outside of the given radius.

INSTRUCTIONS:
Call from script on the server

REQUIRED PARAMETERS:
0. Position:    marker or trigger

OPTIONAL PARAMETERS:
n/a

EXAMPLES USAGE IN SCRIPT:
_pos = ["myMarker"] call ADF_fnc_randomPosInArea;   

EXAMPLES USAGE IN EDEN:
pos1 = [myTrigger] call ADF_fnc_randomPosInArea;    

DEFAULT/MINIMUM OPTIONS
_pos = ["myMarker"] call ADF_fnc_randomPosInArea;   

RETURNS:
Array:          0.  position X
                1.  position y
                2.  position Z
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_randomPosInArea"};

// Init
params [
	["_t", "", ["", objNull]]
];
private _p = _t;

// Check if marker or trigger
private _m = if (typeName _t == "STRING") then {true} else {false};
private _s = if (_m) then {getMarkerSize _t} else {triggerArea _t};

_s params ["_sx", "_sy"];
private _r = if ((_sx + _sy) > 0) then {if (_sx == _sy) then {_sx / 2} else {(_sx + _sy) / 2}} else {0};
private _d = random 360;
	
private _z = if (_r > 0) then {[_p, _r, _d] call ADF_fnc_randomPos} else {if (_m) then {getMarkerPos _t} else {getPosASL _t}};

// Create debug marker if debug is enabled
if (ADF_debug) then {
	[format ["ADF_fnc_randomPos - Position: %1", _z]] call ADF_fnc_log;
	private _m = createMarker [format ["m_%1%2", round _z select 0, round _z select 1], _z];
	_m setMarkerSize [.7, .7];
	_m setMarkerShape "ICON";
	_m setMarkerType "hd_dot";
	_m setMarkerColor "ColorYellow";
};	

_z