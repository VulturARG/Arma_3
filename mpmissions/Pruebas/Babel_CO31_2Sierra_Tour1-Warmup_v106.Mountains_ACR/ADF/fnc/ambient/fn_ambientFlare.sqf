/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_ambientFlare
Author: Whiztler
Script version: 1.02

File: fn_ambientFlare.sqf
**********************************************************************************
ABOUT:
Fires x number of flares within a given radius at a specified location. 

INSTRUCTIONS
Execute (spawn) from the server or HC

REQUIRED PARAMETERS:
0. Position     Marker, object, trigger or position array [x,y,z]

OPTIONAL PARAMETERS:
1. Number       Radius in meters from center position. Will spawn a flare at a
                random location within the specified radius. Default: 150
2. String       Color of the flare:
                "white" (default)
                "green"
                "red"
                "yellow"
3. Number       Number of flares to create

EXAMPLES USAGE IN SCRIPT:
["BaseMarker", 200, "Green", 5] spawn ADF_fnc_ambientFlare;

EXAMPLES USAGE IN EDEN:
[position this, 50, "red", 2] spawn ADF_fnc_ambientFlare;

DEFAULT/MINIMUM OPTIONS
[thisTrigger] spawn ADF_fnc_ambientFlare;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_ambientFlare"};

// Init
params [
	["_p", "", ["", [], objNull, grpNull]],
	["_r", 150, [0]],
	["_c", "white", [""]],
	["_n", 3, [0]]
];

// Check valid vars
if (_r > 1000) then {_r = 1000;};
if (_n > 10) then {_n = 10;};
if (	(_c != "white") && (_c != "green") && (_c != "red") && (_c != "yellow")) then {_c = "white"; if (ADF_debug) then {[format ["ADF_fnc_ambientFlare - incorrect color (%1) passed. Defaulted to 'white'.", _c]] call ADF_fnc_log;}};

// Check the location position
_p = [_p] call ADF_fnc_checkPosition;

private _f = switch (toUpper _c) do {	
	case "WHITE"		: {"F_40mm_White"};
	case "GREEN"		: {"F_40mm_Green"};
	case "RED"		: {"F_40mm_red"};
	case "YELLOW"	: {"F_40mm_Yellow"};
	default			  {"F_40mm_White"};
};

for "_i" from 1 to _n do {
	_p set [2, 165 + (random 45)];	
	private _v = createVehicle [_f, _p, [], _r, "NONE"];
	playSound3d [format ["a3\missions_f_beta\data\sounds\Showcase_Night\%1",(selectRandom ["flaregun_1.wss","flaregun_2.wss","flaregun_3.wss","flaregun_4.wss"])], _v];
	_v setVelocity [0,0,-0.175];
	sleep 1.5;
};

true