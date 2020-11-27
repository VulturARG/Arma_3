/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_randomPosMax
Author: Whiztler
Script version: 1.02

File: fn_randomPosMax.sqf
**********************************************************************************
ABOUT
Returns a random position on the far end of the radius.

INSTRUCTIONS:
Call from script on the server

REQUIRED PARAMETERS:
0. Position:    Center position: Marker, object, trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
1. Number:      Radius in meters. Default: 500
2. Number:      Direction (0-360). Default is random 360

EXAMPLES USAGE IN SCRIPT:
_maxPos = ["myMarker", 500, random 360] call ADF_fnc_randomPosMax;

EXAMPLES USAGE IN EDEN:
this setpos (getPos (["myMarker", 500, random 360] call ADF_fnc_randomPosMax);

DEFAULT/MINIMUM OPTIONS
_pos = ["myMarker"] call ADF_fnc_randomPosMax;

RETURNS:
Array:          0.  position X
                1.  position y
                2.  position Z
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_randomPosMax"};

// Init
params [
	["_p", "", ["", [], objNull, grpNull]],
	["_r", 500, [0]],
	["_a", -1, [0]]
];

// Check the location position
_p = [_p] call ADF_fnc_checkPosition;

// Set direction
private _d = if (_a == -1) then {random 360} else {_a};

// Create random position from center & radius
private _pX = (_p select 0) + (_r * sin _d);
private _pY = (_p select 1) + (_r * cos _d);

// Create debug marker if debug is enabled.
if (ADF_debug) then {
	[format ["ADF_fnc_randomPos - Position: [%1,%2, 0]", _pX, _pY]] call ADF_fnc_log;
	private _m = createMarker [format ["m_%1%2", round _pX, round _pY], [_pX, _pY, 0]];
	_m setMarkerSize [.5, .5];
	_m setMarkerShape "ICON";
	_m setMarkerType "hd_flag";
	_m setMarkerColor "ColorKhaki";
	_m setMarkerText "rndPosMax";
};

// Return position
[_pX, _pY, 0]