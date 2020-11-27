/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_roadPos
Author: Whiztler
Script version: 1.03

File: fn_roadPos.sqf
**********************************************************************************
ABOUT
Searches for road positions with in a given radius. Returns a position on a road
if successful.

INSTRUCTIONS:
Call from script on the server

REQUIRED PARAMETERS:
0. Position:		Center position: Marker, object, trigger or
				position array [x,y,z]

OPTIONAL PARAMETERS:
1. Number:		Radius in meters. Default: 150

EXAMPLES USAGE IN SCRIPT:
_road = ["myMarker", 500] call ADF_fnc_roadPos;

EXAMPLES USAGE IN EDEN:
this setPos (getPos (["myMarker", 500] call ADF_fnc_roadPos;));

DEFAULT/MINIMUM OPTIONS
_pos = ["myMarker"] call ADF_fnc_roadPos;	

RETURNS:
Array:          0.  position X
                1.  position y
                2.  position Z
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_roadPos"};

// Init
params [
	["_p", "", ["", [], objNull, grpNull]],
	["_r", 150, [0]]
];

// Check the location position
_p = [_p] call ADF_fnc_checkPosition;

// Check nearby raods from passed position
private _rd	= _p nearRoads _r;
private _c	= count _rd;
private _z	= [];

// if road position found, use it else use original position
if (_c > 0) then {_z = getPos (selectRandom _rd)} else {_z = _p};

// Create debug marker if debug is enabled
if (ADF_debug) then {
	diag_log format ["ADF Debug: ADF_fnc_roadPos - Position: %1", _z];
	private _m = createMarker [format ["m_%1%2", round (_z select 0), round (_z select 1)], _z];
	_m setMarkerSize [.7, .7];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_triangle";
	_m setMarkerColor "ColorRed";
	_m setMarkerText "rdPos";		
};

// return the position
_z