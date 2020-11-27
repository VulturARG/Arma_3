/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_vehicleCrewAI
Author: Whiztler
Script version: 1.01

File: fn_vehicleCrewAI.sqf
**********************************************************************************
ABOUT:
ARMA 3 vanilla settings make crew abandon their vehicle when it has been damaged
slightly. This function  adds a more realistic scenario that make crews stay
inside their vehicle and continue fighting. The crew abandons he vehicle once the
vehicle damage has gone critical (> 0.75). This only applies to vehicles with
combat facilities.

ADF_fnc_vehicleCrewAI is automatically applied from within the 
ADF_fnc_createCrewedVehicle function.

INSTRUCTIONS
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Object:      The vehicle that occupies a vehicle crew.

OPTIONAL PARAMETERS:
1. String:      Skill set of the vehicle crew. Default: "novice"   
                "untrained" - unskilled, slow to react 
                "recruit"   - semi skilled
                "novice"    - Skilled, trained. Vanilla+ setting
                "veteran"   - Very skilled, Well trained
                "expert"    - Special forces quality

EXAMPLES USAGE IN SCRIPT:
[_veh, "veteran"] call ADF_fnc_vehicleCrewAI;

EXAMPLES USAGE IN EDEN:
[this, "recruit"] call ADF_fnc_vehicleCrewAI;

DEFAULT/MINIMUM OPTIONS
[myTank] call ADF_fnc_vehicleCrewAI;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_vehicleCrewAI"};

// Init
params [
	["_v", objNull, [objNull]],
	["_s", "NOVICE", [""]]
];

// Check valid vars
if !(_v isKindOf "AllVehicles") exitWith {[format ["ADF_fnc_vehicleCrewAI - Incorrect vehicle passed: '%1'. Exiting", _v], true] call ADF_fnc_log; false};
if (	(_s != "untrained") && (_s != "recruit") && (_s != "novice") && (_s != "veteran") && (_s != "expert")) then {	_s = "novice"; if (ADF_debug) then {[format ["ADF_fnc_createSAD - incorrect skill (%1) passed for group: %2. Defaulted to 'novice'.",_s, _g]] call ADF_fnc_log;}};

// Apply crew courage to crewed combat vehicles.
if (canFire _v && (count (crew _v) > 0)) then {
	_v allowCrewInImmobile true;
	[group ((crew _v) select 0), _s] call ADF_fnc_groupSetSkill;
	_v addEventHandler [ "HIT", {
		// Init
		params["_v"];
		// Check if the vehicle is still able to perform combat duties. If not, order the crew to abandon the vehicle.
		if !((canFire _v) || (damage _v) < 0.75) then {
			_v allowCrewInImmobile false;
			{_x action ["EJECT", _v]} forEach crew _v;
			_v removeEventHandler ["HIT", 0];
		};
	}];	

	// Alter the AGM cook off settings randomly. 
	if (ADF_mod_ACE3 && (random 1 > 0.75)) then {_v setVariable ["ace_cookoff_enable", false]};
	
	true
} else {
	false
};