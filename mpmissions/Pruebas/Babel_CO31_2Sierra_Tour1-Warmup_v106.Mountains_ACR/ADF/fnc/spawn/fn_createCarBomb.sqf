/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Create Car Bomb
Author: Whiztler
Script version: 1.14

File: fn_createCarBomb.sqf
**********************************************************************************
ABOUT
This module creates a vehicle (default is Fuel Track) in a predefined radus or at
a marker/trigger. The vehicle acts as a car bomb. The module aligns the vehicle
with the road and creates a trigger that will set off the bomb. 

INSTRUCTIONS:
Execute from the server.

REQUIRED PARAMETERS:
0. Position:    Marker or Trigger name (eclipse/rectangle marker). The vehicle
                will be placed in the marker/trigger area on /next to a random
                road. If the marker is an icon (size 1 x 1  or smaller) then then
                vehicle will be created on that exact position.
                You may also pass a position array [X,Y,Z] for precise spawning.

OPTIONAL PARAMETERS:
1. Side:        Side that activates the trigger: west, east or independent
                Default: west
2. Number:      Trigger area (radius) in meters. Default: 50
3. String:      Vehicle class. Default: "C_Van_01_fuel_F"

EXAMPLES USAGE IN SCRIPT:
["carBombMarker", west, 10, "C_Offroad_luxe_F"] call ADF_fnc_createCarBomb;

EXAMPLES USAGE IN EDEN:
[bombTrigger, west, 15] call ADF_fnc_createCarBomb; // Default vehicle is used.

DEFAULT/MINIMUM OPTIONS
["carBombMarker"] call ADF_fnc_createCarBomb;

RETURNS:
Object (vehicle)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createCarBomb"};

// Init
params [
	["_p", "", ["", [], objNull, grpNull]],
	["_s", west, [east]],
	["_r", 50, [0]],
	["_vc", "C_Van_01_fuel_F", [""]]
];
private _d = 0;

if (_p isEqualType "") then {
	if ((getMarkerSize _p select 0) > 1) then {
		private _sr = (((getMarkerSize _p) select 0) + ((getMarkerSize _p) select 1)) / 2;
		
		// select a random position within the marker area
		_p	= [getMarkerPos _p, _sr, random 360] call ADF_fnc_randomPos;
		
		// Find a road position within the search results
		private _ps	= [_p, 100, 150] call ADF_fnc_randomPos_IED;
		_p	= _ps select 0;
		_d	= _ps select 1;
		
		// create offset position
		private _px = (_p select 0) + (4.5 * sin (_d + 90));
		private _py = (_p select 1) + (4.5 * cos (_d + 90));
		_p = [_px, _py, 0];
	} else {
		_d	= markerDir _p;
		_p = [_p] call ADF_fnc_checkPosition;
	};		
} else {
	if (_p isEqualType objNull) then {
		_d = getDir _p;			
	} else {
		_d = random 360
	};
	_p = [_p] call ADF_fnc_checkPosition;
};

// Create the vehicle
private _v = createVehicle [_vc, _p, [], 0, "NONE"];
_v setDir _d;
_v lock 2;

// Create the trigger
private _t = createTrigger ["EmptyDetector", _p, false];
_t setTriggerActivation [str _s,"PRESENT", false];
_t setTriggerArea [_r, _r, 0, false];
_t setTriggerTimeout [0, 0, 0, false];
_t setTriggerStatements [
	"{vehicle _x in thisList && isPlayer _x && ((getPosATL _x) select 2) < 5} count allUnits > 0;",
	"[thisTrigger] call ADF_fnc_carBombDetonate; deleteVehicle thisTrigger;",
	""
];

// Debug
if (ADF_debug) then {
	private _m = createMarker [["mCB%1",round (random 9999)], _p];
	_m setMarkerSize [_r, _r];
	_m setMarkerShape "ELLIPSE";
	_m setMarkerColor "ColorRED";
	_m setMarkerType "empty";
};

// return the vehicle
_v