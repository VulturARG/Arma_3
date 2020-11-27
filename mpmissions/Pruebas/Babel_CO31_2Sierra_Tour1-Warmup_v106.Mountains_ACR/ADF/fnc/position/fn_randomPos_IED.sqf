/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_randomPos_IED
Author: Whiztler
Script version: 1.04

File: fn_randomPos_IED.sqf
**********************************************************************************
ABOUT
Returns a random (IED) position on (next to) a road within a given radius. The
function is used by the createIED module.

INSTRUCTIONS:
Call from script on the server. 

REQUIRED PARAMETERS:
0. Position:    Array position [X,Y,Z]

OPTIONAL PARAMETERS:
1. Number:      Search radius in meters around the position. Default: 250
2. Number:      Road search radius in meters within the search radius results (1)
                Default: 25

EXAMPLES USAGE IN SCRIPT:
private _pos = ["ied_ao", 500, 100] call ADF_fnc_randomPos_IED;

EXAMPLES USAGE IN EDEN:
myIED_AO = ["centerMarker", 500, 100] call ADF_fnc_randomPos_IED;

DEFAULT/MINIMUM OPTIONS
_pos = ["ied_ao"] call ADF_fnc_randomPos_IED;

RETURNS:
Array:          0.  position X
                1.  position y
                2.  position Z
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_randomPos_IED"};

// Init
params [
	["_p", [], [[]], [3]],
	["_r", 250, [0]],
	["_rr", 25, [0]]
];

// Create random position from center & radius
private _px = (_p select 0) + (_r * sin (random 360));
private _py = (_p select 1) + (_r * cos (random 360));	

// new position
_p = [_px, _py, 0];

// Create debug marker if debug is enabled
if (ADF_debug) then {
	[format ["ADF_fnc_randomPos_IED -new position: %1", _p]] call ADF_fnc_log;
	private _m = createMarker [format ["obj_%1",round (random 9999)], _p];
	_m setMarkerSize [.7, .7];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_dot";
	_m setMarkerColor "ColorBLACK";
	_m setMarkerText "search pos";
};

// Check nearby raods from new position
private _rda	= _p nearRoads _rr;
private _rdp	= [];
private _rdd	= 0; // road direction
if (count _rda == 0 && ADF_debug) then {["ADF_fnc_randomPos_IED - no road positions found"] call ADF_fnc_log};


// if road position found, use it else use original position
if (count _rda > 0) then {		
	private _rd	= _rda select 0;
	_rdp	= getPos _rd;		
	_rdx	= roadsConnectedTo _rd;
	if (count _rdx > 0) then {
		_rdX	= _rdx select 0;
		// Debug reporting
		if (ADF_debug) then {[format ["ADF_fnc_randomPos_IED - road positions found: %1 -- connected to: %2",_rdp,_rdx]] call ADF_fnc_log};
		_rdd	= [_rd, _rdX] call BIS_fnc_DirTo;
		// Debug reporting
		if (ADF_debug) then {[format ["ADF_fnc_randomPos_IED - road positions direction: %1",_rdd]] call ADF_fnc_log};		
	} else {
		// Debug reporting
		if (ADF_debug) then {[format ["ADF_fnc_randomPos_IED - No connecting road found: %1",_rdx]] call ADF_fnc_log};		
	};
} else {
	_rdp = _p;
	_rdd = 0;
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_randomPos_IED - NO road positions found. Using org position: %1 with direction: %2",_rdp,_rdd]] call ADF_fnc_log};	
};

// Create debug marker if debug is enabled
if (ADF_debug) then {
	private _m = createMarker [format ["obj_%1",round (random 9999)], _rdp];
	_m setMarkerSize [.7, .7];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_dot";
	_m setMarkerColor "ColorGREEN";
	_m setMarkerText format ["road pos - %1",round _rdd];
};

// return the position + direction
[_rdp, _rdd]