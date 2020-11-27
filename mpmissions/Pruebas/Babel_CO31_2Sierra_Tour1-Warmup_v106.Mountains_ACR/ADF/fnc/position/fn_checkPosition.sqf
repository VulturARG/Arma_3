/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_checkPosition
Author: Whiztler
Script version: 1.10

File: fn_checkPosition.sqf
**********************************************************************************
ABOUT
This function is used by scripts and other functions to determine the type of 
position. Locations such as a marker, an object, a vehicle, a group, a unit or
player or simply a position array [X,Y,Z] can be passed
The function returns the position as an array [X, Y, Z].

INSTRUCTIONS:
n/a

REQUIRED PARAMETERS:
0. Position     Marker, object, trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
n/a

EXAMPLE
_position = [group player] call ADF_fnc_checkPosition;

RETURNS:
Array:          0.  position X
                1.  position y
                2.  position Z
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_checkPosition"};

// init
params [
	 ["_p", [0,0,0], ["", objNull, grpNull, locationNull, [], true, {}, 0]] // [] and 0 to handle position
];
private _z = [];

// Debug reporting
if (ADF_debug) then {[format ["ADF_fnc_checkPosition - pre-check position: %1",_p]] call ADF_fnc_log};

// Check the location type and produce a position array
switch (typeName _p) do {
	
	case "STRING":	{
		if (_p in allMapMarkers) then {
			_z = getMarkerPos _p;
		} else {
			[format ["ADF_fnc_checkPosition - ERROR! Position %1 (string) is not a valid marker.",_p],true] call ADF_fnc_log};
		};
	
	case "OBJECT":	{_z = getPosATL _p};
	
	case "ARRAY":	{
		if (_p isEqualTypeAll 0) then {
			switch (count _p) do {
				case 2: {_z = [(_p select 0),(_p select 1),0]};
				case 3: {_z =+ _p};
				default {[format ["ADF_fnc_checkPosition - ERROR! Position %1 (array) is not a valid position array.",_p], true] call ADF_fnc_log};
			};
		} else {
			_z = [0,0,0];
			[format ["ADF_fnc_checkPosition - ERROR! Position %1 (array) is not a valid position array.",_p], true] call ADF_fnc_log;
		};
	};
	
	case "GROUP":	{_z = getPosATL (leader _p)};
	
	case "LOCATION":	{_z = position _p};
	
	case "SCALAR";
	case "BOOL";
	case "CODE";
	default			{
		_z = [0,0,0];
		[format ["ADF_fnc_checkPosition - ERROR! Incorrect position passed (%1) Defaulting to [0,0,0] (lower edge of the map).", _p]] call ADF_fnc_log;
	};
};

// Return the checked position: array [X, Y, Z]
_z