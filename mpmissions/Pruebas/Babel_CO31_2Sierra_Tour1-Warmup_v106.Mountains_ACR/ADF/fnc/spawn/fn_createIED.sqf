/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Create IED('s)
Author: Whiztler
Script version: 1.18

File: fn_createIED.sqf
**********************************************************************************
ABOUT:
This function creates IED's. There are three way's of creating IED's:

1.  Create a single IED at a marker position (icon marker, no radius)
2.  Create multiple IED's from an array with markers. E.g.:
    ["IED_1", "IED_2", "IED_3", "IED_4", "IED_5", "IED_6", "IED_7"]
3.  Create random IED's in a rectangular or eclipse sized maker.

INSTRUCTIONS:
Place marker(s) on the map (editor or scripted).
Execute from the server.

REQUIRED PARAMETERS:
0. Position:    This can be:
                - Marker icon for direct placed. The IED is created within the
                  given radius position
                - Array of markers.
                - Marker name (string) of a eclipse/rectangle marker. The IED will
                  be created in the marker area randomly.

OPTIONAL PARAMETERS:
1. Side:        Side that activates the IED trigger: west, east or independent
                Default: west
2. Number:      Number of IED's. Only change when using in combination with a
                eclipse/rectangle marker. Default: 1
3. Number:      Random position placement radius in meters. Default: 100
4. Number:      Radius to search for suitable road position. Default: 250
5. Number:      Road offset in meters. The is the width of the road. Default: 4.5

EXAMPLES:

EXAMPLES USAGE IN SCRIPT:
* Icon marker on the map, 1 IED on marker position:
["IEDposition"] call ADF_fnc_createIED;

* Array of marker positions, triggered by independent:
[["IED_1", "IED_2", "IED_3", "IED_4", "IED_5", "IED_6", "IED_7"], independent] call ADF_fnc_createIED;

EXAMPLES USAGE IN EDEN:
* Icon marker on the map, 1 IED on marker position:
["IEDposition"] call ADF_fnc_createIED;

* Array of marker positions, triggered by independent:
[["IED_1", "IED_2", "IED_3", "IED_4", "IED_5", "IED_6", "IED_7"], independent] call ADF_fnc_createIED;

* Eclipse marker on the map, 10 IED's randomly within the marker area:
["IEDposition", west, 10] call ADF_fnc_createIED;

* Icon marker on the map, 1 IED on marker position triggered by East
["IEDposition", east] call ADF_fnc_createIED;

DEFAULT/MINIMUM OPTIONS
["IedPos"] call ADF_fnc_createIED;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createIED"};

private _dt = diag_tickTime;

private _createIED = {
	// init
	params ["_p","_s","_n","_r","_d","_dx"];
	private "_i";
	
	// Check the location position
	_p = [_p] call ADF_fnc_checkPosition;
	
	private _o	= selectRandom ["Land_Wreck_Car3_F", "Land_GarbagePallet_F", "Land_CanisterPlastic_F", "Land_Sack_F", "Land_JunkPile_F", "Land_BarrelTrash_F", "Land_GarbageBarrel_01_F"];
	//_o	= selectRandom ["IEDLandBig_F", "IEDUrbanBig_F", "IEDLandSmall_F", "IEDUrbanSmall_F"];
	private _a	= [];
	private _ap	= [];
	private _ad	= 0;

	// Search for IED locations within the search radius. Try 3 times
	for "_i" from 1 to 3 do { 
		_a = [_p, _r, _d] call ADF_fnc_randomPos_IED;
		_ap = _a select 0;
		_ad = _a select 1;
		// Exit when a suitable position has been found
		if (isOnRoad _ap) exitWith {
			if (ADF_debug) then {[format ["ADF_fnc_createIED - position on road: %1",_ap]] call ADF_fnc_log};
			true
		};
	};
	
	// Debug position found
	if (ADF_debug) then {private _v = createVehicle ["Sign_Arrow_Direction_Green_F", _ap, [], 0, "NONE"]; _v setDir _ad;};
	
	// Create offset position
	private	_ax = _ad + 90;
	private _apx = (_ap select 0) + (_dx * sin (_ad + 90));
	private _apy = (_ap select 1) + (_dx * cos (_ad + 90));	
		
	// Create the IED (random object)
	private _v = createVehicle [_o, [_apx, _apy, 0], [], 0, "NONE"];
	
	// Debug information
	if (ADF_debug || ADF_debug_IED) then {
		[format ["ADF_fnc_createIED - IED object created: %1", _v]] call ADF_fnc_log;

		private _v = createVehicle ["Sign_Arrow_Cyan_F", [_apx, _apy, 1], [], 0, "CAN_COLLIDE"];
		_v enableSimulationGlobal false;

		private _m = createMarker [format ["IEDclass_%1",round (random 9999)], [_apx, _apy, 0]];
		_m setMarkerSize [0, 0];
		_m setMarkerShape "ICON";
		_m setMarkerType "mil_dot";
		_m setMarkerColor "ColorBlack";
		_m setMarkerText format ["%1", _o];
	};
	
	// Disguise the IED
	_v enableSimulationGlobal false;
	_v setDir (random 360);	
	
	switch _o do {
		case "Land_Wreck_Car3_F" : {_v setVectorUp [0.1, 0, 0]; _v setPosATL [getPosATL _v select 0, getPosATL _v select 1, -.30];};
		case	 "Land_CanisterPlastic_F" : {_v setVectorUp [0.08, 0, 0]; _v setPosATL [getPosATL _v select 0, getPosATL _v select 1, -.05];};
		case "Land_Sack_F" : {_v setVectorUp [0, 0.1, 0.01]; _v setPosATL [getPosATL _v select 0, getPosATL _v select 1, -.05];};
		case "Land_JunkPile_F";
		case "Land_GarbagePallet_F" : { _v setPosATL [getPosATL _v select 0, getPosATL _v select 1, -.20];};
		case "Land_GarbageBarrel_01_F" : {_v setVectorUp [0.1, 0, 0]; _v setPosATL [getPosATL _v select 0, getPosATL _v select 1, -.10];};
		case "Land_BarrelTrash_F" : {_v setVectorUp [0.1, 0, 0]; _v setPosATL [getPosATL _v select 0, getPosATL _v select 1, -.08];};
	};
	
	// Create the trigger
	private _t = createTrigger ["EmptyDetector", _ap];
	_t setTriggerActivation [_s, "PRESENT", false];
	_t setTriggerArea [4, 3, _ax, true];
	_t setTriggerTimeout [0, 0, 0, false];
	_t setTriggerStatements [
		"{vehicle _x in thisList && isPlayer _x && ((getPosATL _x) select 2) < 5} count allUnits > 0;",
		"[format ['ADF_fnc_createIED - IED ACTIVATED by: %2 (Trigger: %1)',thisTrigger,name vehicle _x]] call ADF_fnc_log; [thisTrigger] call ADF_fnc_iedDetonate; deleteVehicle thisTrigger;",
		""
	];	
	
	// Create a debug marker if debug is enabled
	if (ADF_debug || ADF_debug_IED) then {		
		[format ["ADF_fnc_createIED - Trigger created: %1 (Activated by: %2)",_t,_s]] call ADF_fnc_log;
		private _m = createMarker [format ["trig%1",round (random 9999)], _ap];
		_m setMarkerSize [4, 3];
		_m setMarkerShape "RECTANGLE";
		_m setMarkerColor "ColorRED";
		_m setMarkerDir _ax;
		_m setMarkerType "empty";
		_m setMarkerText format ["trig:%1", _t];
	};	
	
	// return the IED object
	_v	
};

// Init
params [
	["_p", "", ["", []]],
	["_s", west, [east]],
	["_n", 1, [0]],
	["_r", 100, [0]],
	["_d", 260, [0]],
	["_dx", 4.5, [0]]
];

// Check if the passed location is a position array or marker
if (_p isEqualType []) then {
	{
		[_x, str _s, _n, _r, _d, _dx] call _createIED;
	} forEach _p;
} else {
	if ((getMarkerSize _p select 0) > 0 && _n > 1) then {
		private "_i";
		private _sr = (((getMarkerSize _p) select 0) + ((getMarkerSize _p) select 1)) / 1.25;
		
		for "_i" from 1 to _n do {		
			private _px = [getMarkerPos _p, _sr, random 360] call ADF_fnc_randomPos;
			[_px, str _s, _n, _r, _d, _dx] call _createIED;
		};
	} else {
		[_p, str _s, _n, _r, _d, _dx] call _createIED;
	};	
};

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_createIED - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};

// Return bool
true