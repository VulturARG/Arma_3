/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_defendArea
Author: Whiztler
Script version: 1.23

File: fn_defendArea.sqf
**********************************************************************************
ABOUT
This is a defend/garrison/militarize script based on CBA_fnc_taskDefend by Rommel.
The script garrisons units in empty buildings, static weapons and vehicle turrets.
Units that have not been garrisoned will go on patrol in the assigned area.

INSTRUCTIONS:
Execute (spawn) from the server or HC
If you do not wish to populate static turrets and vehicle turrent then make sure
to lock them in the editor or via script: lock 2

REQUIRED PARAMETERS:
0: Group:       An existing group to populate building positions and turrets
1. Position:    Marker / Trigger / Object / Array position [X,Y,Z]

OPTIONAL PARAMETERS:
2. Number:      Radius in meters to search for buildings/turrets to populate
                with units (default is 50 meters).
3. Number:      Max number of positions within a building to be occupied.
                Default: -1 (all positions, no maximum)
4. Bool:        Ungarrisoned units will go on patrol. Do they need to search
                buildings?
                - true: search buildings
                - false: do not search buildings (default)
5. Bool:        Roof top and top floor positions get prioritized for garrison?
                - true (default)
                - false

EXAMPLES USAGE IN SCRIPT:
[_grp, "GarrisonMarker", 500, 5, true] call ADF_fnc_defendArea;

EXAMPLES USAGE IN EDEN:
[group this,    position this, 100] call ADF_fnc_defendArea;

DEFAULT/MINIMUM OPTIONS
[_grp, MyObject] call ADF_fnc_defendArea;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_defendArea"};

// init
private _dt = diag_tickTime;
params [
	["_g", grpNull, [grpNull]],
	["_p", "", ["", [], objNull, grpNull]],
	["_r", 50, [0]],
	["_n", -1, [0]],
	["_sb", false, [true]],
	["_z", true, [false]]
];
private _a = [];
private _u = units _g;
private _c = count _u;
private _i = 0;
private _l = 0;	

// Check valid vars
if (_g == grpNull) exitWith {[format ["ADF_fnc_defendArea - Empty group passed: %1. Exiting", _g]] call ADF_fnc_log; grpNull};
if (_r < 5) then {_r = 5;};
if (_r > 1000) then {_r = 1000;};
if (_n == 0) then {_n = 1;};

// Check the position (marker, array, etc.)
_p = [_p] call ADF_fnc_checkPosition;

// Populate an array with suitable garrison buildings
private _bs	= [_p, _r, _n] call ADF_fnc_buildingPositions;

// Populate an array with turret positions (statics and empty vehicles)
private _t	= [_p, _r] call ADF_fnc_getTurrets;

if (ADF_debug) then {
	[format ["ADF_fnc_defendArea - Group: %1 | # units: %2", _g, _c]] call ADF_fnc_log;
	[format ["ADF_fnc_defendArea - Building positions found: %1", (count _bs)]] call ADF_fnc_log;
	[format ["ADF_fnc_defendArea - Turrets found: %1", (count _t)]] call ADF_fnc_log;
};

_g enableAttack false;

// Modified CBA_fnc_taskDefend by Rommel et all	
{		
	// INIT	
	// Turret count - deduct 1 on each cycle
	private _ct	= (count _t) - 1;
	// Cycle counter
	_l = _l + 1;
	// Set the garrison var to FALSE
	_x setVariable ["ADF_garrSet",false];
	
	// Populate static weapons and vehicles with turrets first
	if ((_ct > -1) && (_x != leader _g)) then {
		// Movve unit into the turret and remove the turret from the array
		_x assignAsGunner (_t select _ct);
		_x moveInGunner (_t select _ct);
		[_x] call ADF_fnc_setTurretGunner;
		_t resize _ct;
		
		// Set the the garrison var to TRUE
		_x setVariable ["ADF_garrSet",true];
		// Increase the success counter
		_i = _i + 1;
		
	// All turrets populated, populate building positions
	} else {
		if (count _bs > 0) then {
			// Init building position array
			private _bp = [];
			
			// Select a random building from the building array
			private _b = selectRandom _bs;
			private _p = _b getVariable ["ADF_garrPos",[]];
			
			// Create a spread when the nr of buildings > number of units
			if ((count _bs) >= _c) then {_bs = _bs - [_b]};
			
			if ((count _p) > 0) then {
			
				// In case there are multiple building positions within the building, check for high altitude positions for rooftop placement
				if ((count _p) > 1) then {
					// 60 percent chance for rooftops / toop floor else select a random free position
					if ((random 1) > 0.4 && _z) then {
						private _ap = [_p, ADF_fnc_altitudeDescending] call ADF_fnc_positionArraySort;
						_bp	= _ap select 0;							
					} else {
						_bp = selectRandom _p;
					};
				} else {
					_bp = _p select 0;
				};

				// Remove the populated position from the array
				_p	= _p - [_bp];
				
				// Check if there are positions left within the building else remove the building from the buildings array. Set the building varaibles accordingly.
				if ((count _p) == 0) then {
					_bs = _bs - [_b];
					_b setVariable ["ADF_garrPos",[]];
					_b setVariable ["ADF_garrPosAvail",false];
				} else {
					_b setVariable ["ADF_garrPos",_p];
				};
				
				// Unit now has a random position within a random building. Pass it the the setGarrison function so thsat the unit will move into the selected position.
				[_x, _bp, _b] spawn ADF_fnc_setGarrison;
				
				// Set the ADF_garrSet for the unit and add his position to an array that is used for headless client management.
				_x setVariable ["ADF_garrSet",true];
				_a append [[_x, _bp]];
				// Debug reporting
				if (ADF_debug) then {[format ["ADF_fnc_defendArea - Unit garrisson array: %1",_a]] call ADF_fnc_log};
				// Increase the success counter
				_i = _i + 1;
			
			} else {if (ADF_debug) then {[format ["ADF_fnc_defendArea - No positions found for unit %1 (nr. %2)",_x,_l]] call ADF_fnc_log}};
			
			
		};
	};
} forEach _u;

// Clean up the building variables
[_bs] spawn {
	sleep 30; // wait 1/2 min before removing the stored building positions as other groups might occupy the same building.
	params ["_bs"];
	{_x setVariable ["ADF_garrPos",nil]} forEach _bs;
};

// Set HC loadbalancing variables if a HC is active
if (ADF_HC_connected) then {
	_g setVariable ["ADF_hc_garrison_ADF",true];
	_g setVariable ["ADF_hc_garrisonArr",_a];

	// Debug reporting
	if (ADF_debug || ADF_extRpt) then {[format ["ADF_fnc_defendArea - ADF_hc_garrisonArr set for group: %1 -- array: %2",_g,_a]] call ADF_fnc_log};
};

// Non garrisoned units patrol the area	
waitUntil {_c == _l};
if (_i < _c) then {[_i, _g, _p, _r, _sb] spawn ADF_fnc_defendAreaPatrol};

// Debug Diag reporting
if (ADF_debug) then {[format ["ADF_fnc_defendArea - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log};

true