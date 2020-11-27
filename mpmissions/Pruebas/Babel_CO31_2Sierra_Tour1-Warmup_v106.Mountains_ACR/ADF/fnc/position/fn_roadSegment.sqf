/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_roadSegment
Author: Whiztler
Script version: 1.01

File: fn_roadSegment.sqf
**********************************************************************************
ABOUT
Searches for roads with in a given radius. Returns a road segment on a road
if successful.

INSTRUCTIONS:
Call from script on the server

REQUIRED PARAMETERS:
0. Position:		Center position: Marker, object, trigger or
				position array [x,y,z]

OPTIONAL PARAMETERS:
1. Number:		Radius in meters. Default: 150

EXAMPLES USAGE IN SCRIPT:
_road = ["myMarker", 500] call ADF_fnc_roadSegment;

EXAMPLES USAGE IN EDEN:
this setPos (getPos (["myMarker", 500] call ADF_fnc_roadSegment;));

DEFAULT/MINIMUM OPTIONS
_pos = ["myMarker"] call ADF_fnc_roadSegment;	

RETURNS:
road segment
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_roadSegment"};

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
private _mp	= [];

// if road segment found, use it else use original position
if (_c > 0) then {_z = _rd; _mp = getPos (_rd select 0)} else {_z = _p; _mp = _p};

[format ["getPos (_rd select _0):  %1", getPos (_rd select 0)]] call ADF_fnc_log;

// Create debug markers if debug is enabled
if (ADF_debug) then {	
	[format ["ADF_fnc_roadSegment - Array: %1", _z]] call ADF_fnc_log;
	for "_i" from 0 to _c do {
		private _m = createMarker [format ["m_%1%2", _rd select _i, random 999], getPos (_rd select _i)];
		_m setMarkerSize [.5, .5];
		_m setMarkerShape "ICON";
		_m setMarkerType "mil_triangle";
		_m setMarkerColor "ColorOpfor";
		_m setMarkerText "rd";
	};
};

// return road segments
_z