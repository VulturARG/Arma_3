/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_setTurretGunner
Author: Whiztler
Script version: 1.01

File: fn_setTurretGunner.sqf
**********************************************************************************
Increases skill set for turret units to make them more responsive to threads.
If you have vehicles on the map you DO NOT want to be populated by AI's,
then 'LOCK' the vehicle (not player lock!)

INSTRUCTIONS:
Execute (call) from the server or HC

REQUIRED PARAMETERS:
0. Object:      The AI unit that is assigned to a turret

OPTIONAL PARAMETERS:
n/a

EXAMPLES USAGE IN SCRIPT:
[_myGunner] call ADF_fnc_setTurretGunner;

EXAMPLES USAGE IN EDEN:
[this] call ADF_fnc_setTurretGunner;

DEFAULT/MINIMUM OPTIONS
[_unit] call ADF_fnc_setTurretGunner;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_setTurretGunner"};

// init
params [
	["_u", objNull, [objNull]]
];

// Increase gunner skill so they are more responsive to approaching enemies
_u setSkill ["spotDistance",.7 + (random .3)];
_u setSkill ["spotTime",.7 + (random .3)];
_u setSkill ["aimingAccuracy",.4 + (random .3)];
_u setSkill ["aimingSpeed",.4 + (random .3)];
_u setCombatMode "YELLOW";

true