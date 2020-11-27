/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_delete
Author: Whiztler. Based on the delete function of CBA by Rommel.
Script version: 1.04

File: fn_delete.sqf
**********************************************************************************
ABOUT
Deletes vehicles, AI units, objects, groups, triggers, arrays of objects, markers,
etc.

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Anything:		Group, array, marker, object. Anything else returns false

OPTIONAL PARAMETERS:
N/A

EXAMPLES USAGE IN SCRIPT:
[[veh1, veh2, veh3]] call ADF_fnc_delete;
[[group1, veh1, trigger]] call ADF_fnc_delete;

EXAMPLES USAGE IN EDEN:
[["marker1", vehicle1]] call ADF_fnc_delete;

DEFAULT/MINIMUM OPTIONS
[myObject] call ADF_fnc_delete;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_delete"};

// Init
params [
	["_a", objNull, ["", objNull, grpNull, locationNull, [], true, {}, 0]]
];

switch (typeName _a) do {

	case "STRING" :		{
	
		if (_a in allMapMarkers) then {
			deleteMarker _a;
			true
		} else {
			[format ["ADF_fnc_delete - ERROR! Passed %1 (string) is not a valid marker.", _p],true] call ADF_fnc_log;
			false
		};		
	};
	
	case "OBJECT" :		{
		if (vehicle _a != _a) then {
			unassignVehicle _a;			
		} else {
			if ({_x != _a} count (crew _a) > 0) then {
				(group _a) call ADF_fnc_delete;
			};
		};
		deleteVehicle _a;
		true
	};
	
	case "GROUP" :		{
		if (count (units _a) > 0 ) exitWith {
			(units _a) call ADF_fnc_delete;
			_a call ADF_fnc_delete;
			true
		};		
		{deleteWaypoint _x} forEach (wayPoints _a);
		deleteGroup _a;
		true
	};
	
	case "LOCATION" :	{
		deleteLocation _a;
		true
	};
	
	case "ARRAY" :		{
		{_x call ADF_fnc_delete} forEach _a;
		true
	};
	
	case "SCALAR"; 
	case "BOOL"; 
	case "CODE"; 	
	default {false};
};