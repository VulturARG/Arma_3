/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_hangarLights
Author: Whiztler
Script version: 1.06

File: fn_hangarLights.sqf
**********************************************************************************
ABOUT
This function creates 3 lights inside a ARMA3 tented aircraft Hangar.

INSTRUCTIONS:
Place a Tent Hangar ("Land_TentHangar_V1_F") on the map and put the following in
the init:
[this] call ADF_fnc_hangarLights;

The function runs on every connected client and creates the objects locally.

REQUIRED PARAMETERS:
0. Object:      The tented airfraft hangar that needs lighting up

EXAMPLES USAGE IN SCRIPT:
[_hangar1] call ADF_fnc_hangarLights;

EXAMPLES USAGE IN EDEN:
[this] call ADF_fnc_hangarLights;

DEFAULT/MINIMUM OPTIONS
[_hangar1] call ADF_fnc_hangarLights;

OPTIONAL PARAMETERS:
n/a

RETURNS:
Bool
*********************************************************************************/

if (!hasInterface) exitWith {};

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_hangarLights"};

// Init
params [
	["_o", objNull, [objNull]]
];
private "_i";
private _z = 0;

// Check valid vars
if (!(typeOf _o == "Land_Hangar_F") && !(typeOf _o == "Land_TentHangar_V1_F")) exitWith {[format ["ADF_fnc_hangarLights - Incorrect hangar object passed: '%1'. Position: %2. Exiting", typeOf _o, getPosASL _o], true] call ADF_fnc_log; false};

// Create a lightpoint at three locations of the tent hangar ceiling
for "_i" from 1 to 3 do {
	switch _i do {
		case 1: {_z = 0};
		case 2: {_z = 5};
		case 3: {_z = -5};
	};
	
	// Create physical light object and attach it to the hangar
	private _f = "Land_floodLight_F" createVehicleLocal [0,0,0];
	_f setPos (getPosASL _o);
	_f attachTo [_o, [0, _z, 4.4]];
	_f setVectorDirAndUp [[-1,0,0],[0,1,0]];
	private _y = getPosASL _f;
	
	// Create simulated light source and attach it to the light object
	private _s = "#lightpoint" createVehicleLocal [0,0,0];	
	_s setPos _y;
	_s setLightBrightness 0.9;
	_s setLightAmbient [1.0, 1.0, 0.5];
	_s setLightColor [1.0, 1.0, 1.0];
	_s setLightUseFlare true;;
	_s setPosASL [_y select 0, _y select 1, (_y select 2) - 0.3];
};

true