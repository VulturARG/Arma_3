/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_calcTravelTime
Author: Whiztler
Script version: 1.03

File: fn_calcTravelTime.sqf
**********************************************************************************
ABOUT
Calculates travel time between two positions. Travel time calculation is based
on Km/hour.

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Position:    Start position. Marker, object, trigger or position array [x,y,z]
1. Position:    End position. Marker, object, trigger or position array [x,y,z]
2. Number:      Estimated travel speed in Km/hr

OPTIONAL PARAMETERS:
n/a

EXAMPLES USAGE IN SCRIPT:
[_veh, "destinationMarker", 275] call ADF_fnc_calcTravelTime;

EXAMPLES USAGE IN EDEN:
[myHelicopter, this, 60] call ADF_fnc_calcTravelTime;

DEFAULT/MINIMUM OPTIONS
[myHelicopter, this, 60] call ADF_fnc_calcTravelTime;

RETURNS:
Array:          0. hours
                1. minutes
                2. seconds
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_calcTravelTime"};

params [
	["_p1", "", ["", [], objNull, grpNull, locationNull]],
	["_p2", "", ["", [], objNull, grpNull, locationNull]],
	["_v", 50, [0]]
];

if (typeName _p1 != "ARRAY") then {_p1 = [_p1] call ADF_fnc_checkPosition};
if (typeName _p2 != "ARRAY") then {_p2 = [_p2] call ADF_fnc_checkPosition};

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_calcTravelTime: Distance = %1 Meters", round (_p1 distance2D _p2)]] call ADF_fnc_log};

// Distance calculate in meters per seconds. Based on meters and Km/hr.
private _s = (_p1 distance2D _p2) / (_v * 0.277777);

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_calcTravelTime: Seconds per meter: %1", _s]] call ADF_fnc_log};

// Convert seconds into 24-hour time format.
private _h	= floor (_s / 3600);
_s	= _s mod 3600;
private _m	= floor (_s / 60);
_s	= _s mod 60;
_s	= floor _s;

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_calcTravelTime: Hour(s): %1 -- Minute(s): %2 -- Second(s): %3", _h, _m, _s]] call ADF_fnc_log};

// Return travel time
[_h, _m, _s]