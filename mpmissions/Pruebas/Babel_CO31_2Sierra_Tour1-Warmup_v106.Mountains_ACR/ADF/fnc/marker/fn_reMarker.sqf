/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_reMarker
Author: Whiztler
Script version: 1.13

File: fn_reMarker.sqf
**********************************************************************************
ABOUT
Re-applies existing markers. To be used after ADF_fnc_obJectMarker(array). The
ADF_fnc_obJectMarker functions creates markers on top of existing markers.
Effectively hiding editor placed markers. Use this function to quickly recreate
editor placed markers or scripted markers.

INSTRUCTIONS:
Call from script on the server.

REQUIRED PARAMETERS:
0. String:      Name of the marker to be re-applied. 

OPTIONAL PARAMETERS:
n/a

EXAMPLES USAGE IN SCRIPT:
["myMarker"] call ADF_fnc_reMarker;
or in case of multiple markers:
{_x call ADF_fnc_reMarker} forEach ["marker1", "marker2", "marker3"];

EXAMPLES USAGE IN EDEN:
n/a

DEFAULT/MINIMUM OPTIONS
["myMarker"] call ADF_fnc_reMarker;

RETURNS:
Marker
*********************************************************************************/

if (!isServer) exitWith {};

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_reMarker"};

// Init
params [
	["_a", "", [""]]
];

// Check marker
if !(_a in allMapMarkers) exitWith {
	private _m = format ["Marker: '%1' is not a valid marker or does not exist",_a];
	["ADF_fnc_reMarker",_m] call ADF_fnc_terminateScript;
};

// Store marker data
private _mn = _a;
private _mp = getMarkerPos _a;
private _mt = getMarkerType _a;
private _mc = getMarkerColor _a;
private _my = markerShape _a;
private _md = markerDir _a;
private _ms = getMarkerSize _a;
private _mx = markerText _a;	
private _ma = markerAlpha _a;
private _mb = markerBrush _a;

// Delete the marker
deleteMarker _a;

// re-create the marker on top of the object markers
private _m = createMarker [_mn, _mp];
_m setMarkerType _mt;
_m setMarkerColor _mc;
_m setMarkerShape _my;
_m setMarkerDir _md;
_m setMarkerSize _ms;
_m setMarkerText _mx;
_m setMarkerAlpha _ma;
_m setMarkerBrush _mb;

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_reMarker marker (%1) re-created", _mn]] call ADF_fnc_log};

// Return the new marker
_m