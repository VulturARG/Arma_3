/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_stripVehicle
Author: Whiztler
Script version: 1.02

File: fn_stripVehicle.sqf
**********************************************************************************
ABOUT
Clears the cargo contents of a vehicle.

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Object:      vehicle, aircraft, etc.

OPTIONAL PARAMETERS:
N/A      

EXAMPLES USAGE IN SCRIPT:
[myCar] call  ADF_fnc_stripVehicle;

EXAMPLES USAGE IN EDEN:
[myCar] call  ADF_fnc_stripVehicle;

DEFAULT/MINIMUM OPTIONS
[myCar] call  ADF_fnc_stripVehicle;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if ((ADF_debug || ADF_extRpt) && ADF_vStrip) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_stripVehicle"};

//Init
params [
	["_v", objNull, [objNull]]
];

//if !(_v isKindOf "AllVehicles") exitWith {[format ["ADF_fnc_stripVehicle - Incorrect vehicle passed: '%1' (%2) at position: %3. Exiting", _v, typeOf _v, getPosATL _v], true] call ADF_fnc_log; false};

// Only run on local machines
//if !(local _v) exitWith {};

ADF_vStrip = false;
if (typeName _v == "STRING") then {_v = call compile _v;};

// check if the vehicle is owned by the server and the script is executed on the server. Execute locally.
if (isServer) then {
	clearWeaponCargo _v;
	clearBackpackCargo _v;	
	clearMagazineCargo _v;
	clearItemCargo _v;
// Not executed by the server (HC?). Execute globally.
} else {
	clearWeaponCargoGlobal _v;
	clearBackpackCargoGlobal _v;	
	clearMagazineCargoGlobal _v;
	clearItemCargoGlobal _v;
};

true