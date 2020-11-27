/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_objectMarkerArray
Author: Whiztler
Script version: 1.13

File: fn_objectMarkerArray.sqf
**********************************************************************************
ABOUT
Creates gray bounding box box markers for editor placed or scripted objects. They
then appear as map objects.

INSTRUCTIONS:
The function changes the marker layer. If you have custom marker (e.g.) text
markers, you can re-apply them with the reMarker function (ADF_fnc_reMarker)
Call from script on the server.

REQUIRED PARAMETERS:
0. Array:       Array of classnames that need a bounding box marker on the map.
1. Position:    Center position, object, marker or trigger

OPTIONAL PARAMETERS:
2. Number:      Radius in meters to scan for objects to mark. Default: 100
                Maximum is 1500.
3. Bool:        Does the object need to be converted to a 'simple object':
                - true - the object needs to be converted to a simple object.
                - false - No need for simple object conversion. (Default).

EXAMPLES USAGE IN SCRIPT:
_array = ["ClassName", "ClassName", "ClassName"]; // Array of classnames of objects to mark on the map
[_array, "MyMarker", 150, true] call ADF_fnc_objectMarkerArray;

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
[_array, "MyMarker"] call ADF_fnc_objectMarkerArray;

RETURNS:
Bool
*********************************************************************************/

if (!isServer) exitWith {};

// Reporting
if (ADF_debug || ADF_extRpt || time < 10) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_objectMarkerArray"};


// init
private _dt = diag_tickTime;
params [
	["_a", [], [[]]],
	["_p", "", ["", [], objNull, grpNull, locationNull]],
	["_r", 100, [0]],
	["_s", false, [true]]
];

// Check valid vars
if (_r > 1500) then {_r = 1500};

_p = [_p] call ADF_fnc_checkPosition;

// populate objects array
private _q = nearestObjects [_p, _a, _r, true];
if (ADF_debug) then {
	[format ["ADF_fnc_objectMarkerArray - Classnames to mark: %1", _a]] call ADF_fnc_log;
	[format ["ADF_fnc_objectMarkerArray - Array of nearest objects found: %1", _q]] call ADF_fnc_log
};

// create the bounding box markers
{
	private _p = getPosATL _x;
	private _b = (boundingBoxReal _x) select 1;
	_b resize 2;
	private _m = createMarker [format ["oma%1%2", floor(random 9999), floor(_p select 0)], _p];
	_m setMarkerShape "RECTANGLE";
	_m setMarkerSize _b;
	_m setMarkerBrush "SolidFull";
	_m setMarkerColor "ColorGrey";
	_m setMarkerDir (getDir _x);
	// Convert to simple object?
	if (_s) then {
		[_x] call BIS_fnc_replaceWithSimpleObject;
		if (ADF_debug) then {[format ["ADF_fnc_objectMarkerArray - Applying marker for object: %1 and converting to a simple object.", _x]] call ADF_fnc_log};
	} else {
		if (ADF_debug) then {[format ["ADF_fnc_objectMarkerArray - Applying marker for object: %1", _x]] call ADF_fnc_log};
	};
} forEach _q;

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_objectMarkerArray - Diag time to execute function: %1", diag_tickTime - _dt]] call ADF_fnc_log};

true