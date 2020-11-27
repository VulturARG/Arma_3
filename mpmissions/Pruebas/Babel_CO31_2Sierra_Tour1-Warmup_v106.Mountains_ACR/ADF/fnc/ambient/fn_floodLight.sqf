/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_floodLight
Author: Whiztler
Script version: 1.06

File: fn_floodLight.sqf
**********************************************************************************
ABOUT
Creates a floodlight attached to a position or an object. Adds additional light
source to the floodlight for ambient effect.

Templates:
[Tower, 0.2, 2.25, 0, 0] call ADF_fnc_floodLight; // cargo Tower first floor
[Tower, 0.2, 4.8, 0, 0] call ADF_fnc_floodLight; // cargo Tower Second floor
[Tower, 0.2, 7.4, 0, 0] call ADF_fnc_floodLight; // cargo Tower Third floor

[hq, 0.2, -1, 0, 1] call ADF_fnc_floodLight; // cargo HQ 
[hq, 0.2, -1, 3, -3] call ADF_fnc_floodLight; // cargo HQ  

INSTRUCTIONS:
Place an object or game logic on the map and put the following in the init:
[this, 0.2, 1] call ADF_fnc_floodLight;
The function runs on every connected client and creates the objects locally.

REQUIRED PARAMETERS:
0. Object:      The object that the floodlight is attached to.

OPTIONAL PARAMETERS:
1. Number:      Light brightness. 0.2 for dim light and 1.0 for very bright
				light. Default: 0.3 
2. Number:      Altitude light position offset from the object. In meters.
				Default: 1
3. Number:      X-axe offset (meters) from the center position of the object
				Default: 0
4. Number:      Y-axe offset (meters) from the center position of the object
				Default: 0
				
EXAMPLES USAGE IN SCRIPT:
[this, 0.1, 2.2, -1, 1.5] call ADF_fnc_floodLight; // CargoHouse

EXAMPLES USAGE IN EDEN:
[this, 0.7, 1] call ADF_fnc_floodLight;

DEFAULT/MINIMUM OPTIONS
[_tower] call ADF_fnc_floodLight;

RETURNS:
Object (floodlight object)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_floodLight"};

if (!hasInterface) exitWith {};

// Init
params [
	["_o", objNull, [objNull]],
	["_h", 0.2, [0]],
	["_a", 1, [0]],
	["_px", 0, [0]],
	["_py", 0, [0]]
];
private _z = [_px, _py, _a];

// Check valid vars
if (_h > 1) then {_h = 1;};
if (_a > 1) then {_a = 1;};

// Create the physical light source
private _f = "Land_floodLight_F" createVehicleLocal [0,0,0];
_f setPos (getPosASL _o);
_f attachTo [_o, [_px, _py, _a]];
_f setVectorDirAndUp [[1, 0, 0],[0, -0.9, 0]];

if (ADF_debug) then {
	private _t = "Sign_Sphere100cm_F" createVehicleLocal (getPosASL _f);
	private _m = createMarker [format ["L_%1%2", _f, random 999], getPos _f];
	_m setMarkerSize [1, 1];
	_m setMarkerShape "ICON";
	_m setMarkerType "hd_dot";
	_m setMarkerColor "ColorWhite";
	_m setMarkerText "L";
};	

// Create the simulated light source
private _l = "#lightpoint" createVehicleLocal [0,0,0];
_l setPos (getPosASL _f);
_l setLightBrightness _h;
_l setLightAmbient [1.0, 1.0, 0.5];
_l setLightColor [1.0, 1.0, 1.0];
_l lightAttachObject [_f, [0,0,-.1]];

// Return the light object
_f