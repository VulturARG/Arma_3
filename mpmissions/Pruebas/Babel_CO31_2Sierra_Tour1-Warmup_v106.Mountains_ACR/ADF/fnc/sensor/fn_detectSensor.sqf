/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Detection Sensor
Author: Whiztler
Script version: 1.07

File: fn_DetectSensor.sqf
*********************************************************************************
ABOUT
Sensor to 'activate' OpFor to make them more aware and respond better and quicker
to enemy presence.

INSTRUCTIONS::

Place a trigger:

Name:           Give the trigger a unique name
Axis A,B:       Whatever size you want. The is the catchment area'
Activation:     Blufor, once, detected by Opfor
MIN/MID/MAX:    5/7/10
Condition:      this
On Activation:  [thisTrigger, east, 500] call ADF_fnc_detectSensor;

REQUIRED PARAMETERS:
0: Position:    Center position. Marker, object, trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
1. Side:        east, west, independent, civilian. Default: east
2. Number       Radius to activate/make aware enemy units. Default: 500
3. String       OpFor skill set:
                "untrained" - unskilled, slow to react 
                "recruit"   - semi skilled
                "novice"    - Skilled, trained. Vanilla+ setting (Default)
                "veteran"   - Very skilled, Well trained 
                "expert"    - Special forces skill set

EXAMPLES USAGE IN SCRIPT:
["myMarker", east, 500, "expert"] call ADF_fnc_detectSensor;

EXAMPLES USAGE IN EDEN:
[thisTrigger, independent, 500] call ADF_fnc_detectSensor;

DEFAULT/MINIMUM OPTIONS
[thisTrigger] call ADF_fnc_detectSensor;

RETURNS:
Bool (success flag)
********************************************************************************/

if (!isServer) exitWith {};

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_detectSensor"};

// Init
params [
	["_p", objNull, ["", [], objNull, grpNull]],
    ["_s", east, [west]],
    ["_r", 500, [0]],
	["_k", "novice", [""]]
];

// Check the position location
_p = [_p] call ADF_fnc_checkPosition;

// Create a list of all units within the sensor radius
private _l = _p nearEntities ["Man", _r];

// "Activate" the units
{
    if ((side _x == _s) && (_x in _l)) then {
        _x setBehaviour "COMBAT"; 
        _x setCombatMode "RED";
        [_x, _k] call ADF_fnc_unitSetSkill;
    };
} forEach allUnits;

true