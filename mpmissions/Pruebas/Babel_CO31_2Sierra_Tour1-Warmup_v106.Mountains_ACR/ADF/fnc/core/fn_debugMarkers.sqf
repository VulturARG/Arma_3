/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_debugMarkers
Author: Whiztler
Script version: 1.00

File: fn_debugMarkers.sqf
**********************************************************************************
ABOUT
Creates debug marker of objects. The function does NOT keep track of new created
groups. The function tracks foot mobiles, road vehicles, ships and aircraft.

INSTRUCTIONS:
Execute from the server after spawning an AO.

REQUIRED PARAMETERS:
N/A

OPTIONAL PARAMETERS:
0. Bool:		Enable/disable the debug markers
			- true: enable the tracker.
			- false: Disable the tracker (Default).
1. Side:	west, east, independent, civilian (default: east) 

EXAMPLES USAGE IN SCRIPT:
[true, west] call ADF_fnc_debugMarkers;

EXAMPLES USAGE IN EDEN:
[true, west] call ADF_fnc_debugMarkers;

DEFAULT/MINIMUM OPTIONS
[] call ADF_fnc_debugMarkers;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_debugMarkers"};

// Init
params [
	["_d", true, [false]],
	["_s", east, [west]]
];
private _a = [];
private _c = "";

// Check if debug markers should be displayed
if !(_d) exitWith {};

// Cancel debug markers using the action menu.
ADF_debug_cancel_markers = false;

// Populate side units array
if (_s countSide allUnits == 0) exitWith {[format ["ADF_fnc_debugMarkers - units side %1: 0. Terminating tracker!", _s]] call ADF_fnc_log};
{if (alive _x && side _x == _s) then {_a pushBackUnique _x}} forEach allUnits;	
[format ["ADF_fnc_debugMarkers - Tracker activiated for side %1: (%2 units)",_s, count _a]] call ADF_fnc_log;	

// Set the marker color
switch _s do {
	case west: 		{_c = "colorBLUFOR";};		
	case independent: {_c = "colorIndependent";};
	case civilian: 	{_c = "colorCivilian";};
	case east;
	default			{_c = "colorOPFOR";};	
};

// spawn a thread for each unit tracking it movement
{
	[_x, _c] spawn {
		
		// Init
		params ["_u", "_c"];
		private _s = .5;
		private _t = "mil_triangle_noShadow";
		private _a = 1;

		// Check if the unit is in a vehhicle. Larger marker for drivers to represent vehicle
		if !(isNull objectParent _u) then {
			
			// if the unit is the driver the set the marker
			if (_u == driver (vehicle _u)) then {
				if ((vehicle _u) isKindOf "Helicopter") then {
					_s = 1;	
				} else {
					_t = "mil_arrow2_noShadow";	
				};

			// If the unit is a gunner or is in cargo the make the marker transparent
			} else {
				_a = 0;
			};
		};
		
		// Create the initial marker
		private _m = createMarker [format ["m_%1", _u], getPos _u];
		_m setMarkerShape "ICON";
		_m setMarkerType _t;
		_m setMarkerSize [_s, _s];
		_m setMarkerDir (getDir _u);
		_m setMarkerColor _c;
		_m setMarkerAlpha _a;
		
		// Start marker update loop per unit
		waitUntil {
			_m setMarkerPos [getPos _u select 0, getPos _u select 1];
			_m setMarkerDir (getDir _u);
			sleep .5;
			(ADF_debug_cancel_markers || !alive _u)
		};
		
		// Unit is no longer alive. Change the marker color to black
		_m setMarkerColor "ColorBlack";
		_m setMarkerType "mil_destroy";
		_m setMarkerAlpha 1;

	};
} forEach _a;

true