/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_sensor
Author: Whiztler
Script version: 1.04

File: fn_sensor.sqf
**********************************************************************************
ABOUT
This is an alternative for triggers for conditions that do NOT need to be checked
every frame or every 0.5 seconds.

INSTRUCTIONS:
The function checks distance players to an object/marker/vehicle.  You'll need to
define the array of units/players/vehicles it needs to check against.
Execute (call) from the server

REQUIRED PARAMETERS:
0: Array:       Array to check against. E.g. allPlayers
1: Position:    Marker, object, trigger or position array [x,y,z] to check distance
                to the units/vehicles provided in the 0: Array.
            
OPTIONAL PARAMETERS:
2. Number:      Sensor radius in meters. Default: 500
3. Number:      Check interval in seconds. Default: 10
4. Bool:        Persistent:
                - true: is persistent (Default)
                - false: not persistent (run once)
5. String:      Code to execute (spawn) when the conditions are met (true).
                E.g. "hint 'The sensor is active';"
                Default = "". 
6. String:      Code to execute (spawn) when the conditions are not met (false).
                E.g. "hint 'The sensor is deactivated';"
                Default = "". 

EXAMPLES USAGE IN SCRIPT:
[{alive _x} count AllUnits, myObject, 500, 5] call ADF_fnc_sensor;

EXAMPLES USAGE IN EDEN:
[allUnits, "AOmarker", 1000, 5] call ADF_fnc_sensor;

DEFAULT/MINIMUM OPTIONS
[allUnits, "AOmarker"] call ADF_fnc_sensor;

RETURNS:
Nothing
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_sensor"};

if (!isServer) exitWith {};

// Init
params [
	["_a", [], [[]]],
	["_p", "", ["", [], objNull, grpNull]],
	["_r", 500, [0]],
	["_s", 10, [0]],
	["_z", true, [false]],
	["_cIN", "", [""]],
	["_cOUT", "", [""]]
];

// Check distance loop
waitUntil {
	private _c = [_a, _p, _r] call ADF_fnc_checkClosest;
	private _e = false;	
	
	if (_c < _r) then {		
		if (_cIN != "") then {[] spawn (call compile format ["%1", _cIN])};			
		if !(_z) then {
			_e = true;
			_s = 0;
		} else {
			waitUntil {
				sleep _s;
				_c = [_a, _p, _r] call ADF_fnc_checkClosest;
				_c > _r
			};
			if (_cOUT != "") then {[] spawn (call compile format ["%1", _cOUT])};
		};			
	};		
	
	sleep _s;
	_e
};

// Debug reporting
if (ADF_debug || ADF_extRpt)  then {[format ["ADF_fnc_sensor: sensor %1 deactivated", _p]] call ADF_fnc_log};