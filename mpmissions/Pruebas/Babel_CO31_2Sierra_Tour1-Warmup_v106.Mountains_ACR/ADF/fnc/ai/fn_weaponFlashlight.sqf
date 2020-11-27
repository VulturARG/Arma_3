/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_weaponFlashlight
Author: Whiztler
Script version: 1.01

File: fn_weaponFlashlight.sqf
**********************************************************************************
ABOUT:
Checks if the group units have a flashlight as weapon attachment and assigns one if
this is not the case. Removes NV's and forces the unit to use the flashlight.

INSTRUCTIONS
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Group:       All units of the group will get flashlights assigned.

OPTIONAL PARAMETERS:
N/A

EXAMPLES USAGE IN SCRIPT:
[myGroup] call ADF_fnc_weaponFlashlight;

EXAMPLES USAGE IN EDEN:
[group this] call ADF_fnc_weaponFlashlight;

DEFAULT/MINIMUM OPTIONS
[myGroup] call ADF_fnc_weaponFlashlight;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_weaponFlashlight"};

// Init
params [
	["_g", grpNull, [grpNull]]
];

// Check valid vars
if (_g == grpNull) exitWith {[format ["ADF_fnc_weaponFlashlight - Empty group passed: %1. Exiting", _g], true] call ADF_fnc_log; false};	

// Lite them up
{
	// Check if the unit already has a weapon flashlight
    if ("acc_flashlight" in primaryWeaponItems _x) then {
        // Check if the have NV assigned
		if !(hmd _x == "") then {_x unlinkItem (hmd _x)}; 
    } else {
        // No flashlight. Remove laser and NV
        if ("acc_pointer_IR" in primaryWeaponItems _x) then {_x removePrimaryWeaponItem "acc_pointer_IR"};
		if !(hmd _x == "") then {_x unlinkItem (hmd _x)}; 

        // Add weapon flashlight
        _x addPrimaryWeaponItem "acc_flashlight";    	
	};

    _x enableGunLights "forceOn";

} count units _g;

// Debug reporting
if (ADF_debug || ADF_extRpt) then {[format ["ADF_fnc_weaponFlashlight - group equipped with weapons flashlight: %1", _g]] call ADF_fnc_log};

true