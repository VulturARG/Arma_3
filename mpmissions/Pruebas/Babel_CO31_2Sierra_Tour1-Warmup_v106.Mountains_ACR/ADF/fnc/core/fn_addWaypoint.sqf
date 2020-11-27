/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_addWaypoint
Author: Whiztler
Script version: 1.08

File: fn_addWaypoint.sqf
**********************************************************************************
ABOUT
This function is used by various scripts and functions to create random waypoints.
It can also be used to add manual waypoints

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Group:       Existing group that gets the waypoints assigned
1. Array:       Position [X,Y,Z]

OPTIONAL PARAMETERS:
2. Number:      Waypoint radius in meters. Default: 500 
3. String:      Waypoint type. Default: "MOVE"
                Info: https:community.bistudio.com/wiki/Waypoint_types
4. String:      Waypoint behaviour. Default: "SAFE"
                Info: https:community.bistudio.com/wiki/setWaypointBehaviour                
5. String:      Waypoint combat mode. Default: "WHITE"
                Info: https:community.bistudio.com/wiki/setWaypointCombatMode
6. String:      Waypoint speed. Default: "LIMITED"
                Info: https:community.bistudio.com/wiki/waypointSpeed
7. String:      Waypoint formation. Default: "FILE"
                Info: https:community.bistudio.com/wiki/waypointFormation
8. Number:      Waypoint completion radius in meters. Default: 5
                Info: https:community.bistudio.com/wiki/setWaypointCompletionRadius
9. String:      The type of group/vehicle to create the waypoint(s) for:
                - "foot" (default)
                - "road"
                - "air"
                - "sea"
10. Bool        Search buildings: 
                - true: Search buildings within a 50 meter radius upon waypoint
                  completion.
                - false: Do not search buildings (default)

EXAMPLES USAGE IN SCRIPT:
[_aiGroup, _pos, 500, "MOVE", "COMBAT", "WHITE", "LIMITED", "COLUMN", 15, "foot", false] call ADF_fnc_addWaypoint;

EXAMPLES USAGE IN EDEN:
[group this, position this, 750, "MOVE", "COMBAT", "BLUE", "LIMITED", "FILE", 15, "road", true] call ADF_fnc_addWaypoint;

DEFAULT/MINIMUM OPTIONS
[_g, _p] call ADF_fnc_addWaypoint;

RETURNS:
Array (Waypoint format)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_addWaypoint"};

// init	
params [
	["_g", grpNull, [grpNull]],
	["_p", [0,0,0], [[]], [3]],
	["_r", 500, [0]],
	["_t", "MOVE", [""]],
	["_b", "SAFE", [""]],
	["_m", "WHITE", [""]],
	["_s", "LIMITED", [""]],
	["_f", "NO CHANGE", [""]],
	["_cr", 5, [0]], 
	["_w", "foot", [""]],
	["_sb", false, [true]],
	["_ix", 0, [0]]
];
private _d = random 360;

// Debug reporting
if (ADF_debug || ADF_extRpt) then {[format ["ADF_fnc_addWaypoint - #%1 - WP radius: %2",_ix, _r]] call ADF_fnc_log};

// Check valid vars
if (_g == grpNull) exitWith {[format ["ADF_fnc_addWaypoint - Empty group passed: %1. Exiting", _g]] call ADF_fnc_log; grpNull};
if (_cr > 500) then {_cr = 500;};
if !((toLower _w) in ["foot", "road", "air", "sea"]) then {_w = "foot"; if (ADF_debug) then {[format ["ADF_fnc_addWaypoint - incorrect vehicle type (%1) passed for group: %2. Defaulted to 'foot'.", _w, _g]] call ADF_fnc_log;}};
if !((toUpper _t) in ["MOVE", "DESTROY", "GETIN", "SAD", "JOIN", "LEADER", "GETOUT", "CYCLE", "LOAD", "UNLOAD", "TR UNLOAD", "HOLD", "SENTRY", "GUARD", "TALK", "SCRIPTED", "SUPPORT", "GETIN NEAREST", "DISMISS", "AND", "OR"]) then {_t = "MOVE"; if (ADF_debug) then {[format ["ADF_fnc_addWaypoint - incorrect waypoint type (%1) passed for group: %2. Defaulted to 'MOVE'.", _t, _g]] call ADF_fnc_log;}};
if !((toUpper _b) in ["UNCHANGED", "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"]) then {_b = "SAFE"; if (ADF_debug) then {[format ["ADF_fnc_addWaypoint - incorrect behaviour type (%1) passed for group: %2. Defaulted to 'SAFE'.", _b, _g]] call ADF_fnc_log;}};
if !((toUpper _m) in ["NO CHANGE" ,"BLUE", "GREEN" ,"WHITE", "YELLOW", "RED"]) then {_m = "WHITE"; if (ADF_debug) then {[format ["ADF_fnc_addWaypoint - incorrect combat mode (%1) passed for group: %2. Defaulted to 'WHITE'.", _m, _g]] call ADF_fnc_log;}};
if !((toUpper _s) in ["UNCHANGED", "LIMITED", "NORMAL", "FULL"]) then {_s = "LIMITED"; if (ADF_debug) then {[format ["ADF_fnc_addWaypoint - incorrect speed mode (%1) passed for group: %2. Defaulted to 'LIMITED'.", _s, _g]] call ADF_fnc_log;}};
if !((toUpper _f) in ["NO CHANGE", "COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "LINE", "FILE", "DIAMOND"]) then {_f = "FILE"; if (ADF_debug) then {[format ["ADF_fnc_addWaypoint - incorrect formation mode (%1) passed for group: %2. Defaulted to 'FILE'.", _f, _g]] call ADF_fnc_log;}};

// Check if the location is at [0,0,0] lower left side of the map (0,0)
if (_p isEqualTo [0,0,0]) exitWith {
	private _m = format ["Incorrect position passed for group: %1 (%2)", _g, _w];
	["ADF_fnc_addWaypoint",_m] call ADF_fnc_terminateScript;
	false
};

// Find a suitable waypoint location based on the type of object/vehicle that will be using the waypoint
switch _w do {
	case "foot"	: {
		private "_i";
		for "_i" from 1 to 3 do {
			private _f = selectRandom [ADF_fnc_randomPosMax, ADF_fnc_randomPos];
			private _k = [_p, _r, _d] call _f;				
			if !(surfaceIsWater _k) exitWith {_p = _k};
			_r = _r + 25;
		};
		if (ADF_debug) then {[_p, true, _g, "foot", _ix] call ADF_fnc_positionDebug};
	};
	case "road"	: {
		private _rd = [];
		// Debug reporting
		if (ADF_debug) then {[format ["ADF_fnc_addRoadWaypoint - WP radius: %1", _r]] call ADF_fnc_log};

		// Find road position within the parameters (near to the random position)
		for "_i" from 1 to 4 do {
			private _f = selectRandom [ADF_fnc_randomPosMax, ADF_fnc_randomPos];
			private _k = [_p, _r, random 360] call _f;
			_rd = [_k, _r] call ADF_fnc_roadPos;		
			if (isOnRoad _rd) exitWith {_p = _rd};
			_r = _r + 150;
			if (_i == 4) then {_p = [_p, _r, (random 180) + (random 180)] call ADF_fnc_randomPosMax;};
		};
		if (ADF_debug) then {[_p, true, _g, "road", _ix] call ADF_fnc_positionDebug};
	};
	case "air"	: {
		private _f = selectRandom [ADF_fnc_randomPosMax, ADF_fnc_randomPos];
		_p =[_p, _r, (random 180) + (random 180)] call _f;
		if (ADF_debug) then {[_p, true, _g, "air", _ix] call ADF_fnc_positionDebug};
	};
	case "sea"	: {
		// Find a location with a depth of at least 10 meters		
		private _v = "Sign_Sphere10cm_F" createVehicle [0,0,0];
		
		for "_i" from 1 to 25 do {
			private _f = selectRandom [ADF_fnc_randomPosMax, ADF_fnc_randomPos];
			private _k = [_p, _r, random 360] call _f;
			_v setPosASL _k;
			private _d = abs (getTerrainHeightASL (getPos _v));				
			if (	(surfaceIsWater _k) && (_d > 10)) exitWith {_p = _k};
			_r = _r + 50;
		};
		
		deleteVehicle _v;
		if (ADF_debug) then {[_p, true, _g, "sea", _ix] call ADF_fnc_positionDebug};
	};
};

// Create the waypoint
private _wp = _g addWaypoint [_p, 0];
_wp setWaypointType _t;
_wp setWaypointBehaviour _b;
_wp setWaypointCombatMode _m;
_wp setWaypointSpeed _s;
_wp setWaypointFormation _f;
_wp setWaypointCompletionRadius _cr;
if (_sb) then {_wp setWaypointStatements ["TRUE", "this spawn ADF_fnc_searchBuilding"]};

// return the waypoint
_wp