/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_positionDebug
Author: Whiztler
Script version: 1.00

File: fn_positionDebug.sqf
**********************************************************************************
ABOUT
Creates a debug marker for a passed on position. In case of a patrol waypoint it
adds the group name and waypoint number as text. In case of a generic position it
add 'pos_x' where x is the index number.

INSTRUCTIONS:
Call from script on the server

REQUIRED PARAMETERS:
0. Position:		Position array [x,y,z]

OPTIONAL PARAMETERS:
1. Bool:			Patrol Waypoint debug or (road) position debug?
                   - true for patrol waypoint (default)
                   - false for general position.
2. Group:		Group in case of patrol waypoint. Default: GrpNull
3. String:		Type of waypoint. Default: "foot"
4. Number:		Index (_i). Default: 0

EXAMPLES USAGE IN SCRIPT:
[_pos, false, grpNull, "", _i] call ADF_fnc_positionDebug;

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
[_pos] call ADF_fnc_positionDebug;	

RETURNS:
Marker
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_positionDebug"};

// Init
params [
	["_p", [], [[], true]],
	["_b", true, [false]],	
	["_g", grpNull, [grpNull]],
	["_s", "foot", [""]],
	["_i", 0, [0]]
];	
private _a = "DM";
private _c = "";
private _t = "";

if (typeName _p isEqualTo "BOOL") exitWith {if (ADF_debug) then {["ADF_fnc_positionDebug - passed true/false as position. Exiting."] call ADF_fnc_log;}; false}; 

// patrol waypoint marker
if (_b) then {
	// Check position type
	switch _s do {
		case "foot":	{_a = "FP"; _c = "ColorOrange"};
		case "road":	{_a = "VP"; _c = "colorIndependent"};
		case "air":	{_a = "AP"; _c = "ColorPink"};
		case "sea":	{_a = "SP"; _c = "ColorBlue"};
	};	
	// Create marker text
	_t = format ["%1-%2-%3",_g,_a,_i];

// Generic position marker
} else {
	// Create marker text
	_t = format ["POS_",_i];
	_c = "ColorWhite"	
};

// Create the debug marker 
private _m = createMarker [format ["m%1%2%3", _a, round (_p select 0), round (_p select 1)], _p];
_m setMarkerSize [.7, .7];
_m setMarkerShape "ICON";
_m setMarkerType "hd_dot";
_m setMarkerColor _c;
_m setMarkerText _t;

// Return the marker
_m
