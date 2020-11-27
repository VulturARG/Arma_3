/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_roadDir
Author: Whiztler
Script version: 1.01

File: fn_roadDir.sqf
**********************************************************************************
ABOUT
Returns the direction of the closest road from a position on or close to a road.

INSTRUCTIONS:
Call from script on the server

REQUIRED PARAMETERS:
0. Array:		Position on road, array [x,y,z]

EXAMPLES USAGE IN SCRIPT:
_rdDir = [getPos _veh] call ADF_fnc_roadDir;

EXAMPLES USAGE IN EDEN:
vehicleDirection = [position this] call ADF_fnc_roadDir;

DEFAULT/MINIMUM OPTIONS
_d = [_p] call ADF_fnc_roadDir;	

RETURNS:
integer (0-360 degrees)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_roadDir"};

// Init
params [
	["_p", [], [[]], [3]]
];

private _r = _p nearRoads 10;
private _d = random 360;
private _e = _d;

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_roadDir - position: %1 - road: %2", _p, _r]] call ADF_fnc_log};

if (count _r > 0) then {	
	private _r = _r select 0;
	private _c = roadsConnectedTo _r;
	private _s = _c select 0;
	_d = [_r, _s] call BIS_fnc_dirTo;	

	// Debug reporting
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_roadDir - road direction", _d]};	
};

if (ADF_debug && _e == _d) then {["ADF_fnc_roadDir - ERROR! No valid direction. No Road position."] call ADF_fnc_log};

_d
