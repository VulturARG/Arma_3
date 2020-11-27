/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_randomPos
Author: Whiztler
Script version: 1.03

File: fn_randomPos.sqf
**********************************************************************************
ABOUT
Returns a random position within a given radius (marker, trigger, etc)

INSTRUCTIONS:
Call from script on the server

REQUIRED PARAMETERS:
0. Position:    Center position of the search radius. Marker, object, trigger or
                position array [x,y,z]
                
OPTIONAL PARAMETERS:
1. Number:      Radius in meters. Default: 500

EXAMPLES USAGE IN SCRIPT:
_pos = ["myMarker", 500] call ADF_fnc_randomPos;

EXAMPLES USAGE IN EDEN:
myPosition = ["myMarker", 500] call ADF_fnc_randomPos;

DEFAULT/MINIMUM OPTIONS
_pos = ["myMarker"] call ADF_fnc_randomPos;

RETURNS:
Array:          0.  position X
                1.  position y
                2.  position Z
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_randomPos"};

// Init
params [
	["_p", "", ["", [], objNull, grpNull]],
	["_r", 500, [0]]
];

// Check the location position
_p = [_p] call ADF_fnc_checkPosition;

// Create random position from center & radius
private _pX = (_p select 0) + (_r - (random (1.5 *_r)));
private _pY = (_p select 1) + (_r - (random (1.5 *_r)));

// Create debug markers if debug is enabled
if (ADF_debug) then {
	[format ["ADF_fnc_randomPos - Position: [%1,%2, 0]", _pX, _pY]] call ADF_fnc_log;
	private _m = createMarker [format ["m_%1%2", round _pX, round _pY], [_pX, _pY, 0]];
	_m setMarkerSize [.7, .7];
	_m setMarkerShape "ICON";
	_m setMarkerType "hd_dot";
	_m setMarkerColor "ColorYellow";
};

// Return position
[_pX, _pY, 0]