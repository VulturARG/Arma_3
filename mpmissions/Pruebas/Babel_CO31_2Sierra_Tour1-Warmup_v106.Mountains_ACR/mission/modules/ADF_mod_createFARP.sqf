/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Module: ADF_mod_createFARP
Author: Whiztler
Module version: 1.01

File: ADF_MOD_createFARP.sqf
**********************************************************************************
The createFARP module creates Repair/Refuel/Rearm site (F.A.R.P.). There are
three FARP types you can create: car, helicopter, jet plane.
The FARPS are fully dressed up with FARP objects. AlMost all objects have
simulation disabled making it performance efficient.

INSTRUCTIONS:
Execute the module on the SERVER only!

Copy the module (this file) to your scripts folder: "scripts\ADF_MOD_createFARP.sqf";

Fill out the required and optional details below.

Execute in your mission script: if (ADF_HC_execute) then {execVM "ADF_MOD_createFARP.sqf"};
Or Execute via a trigger: if (ADF_HC_execute) then {0 = [] execVM "scripts\ADF_MOD_createFARP.sqf"};
Or copy below script into your mission script (execute on server or HC).
*********************************************************************************/

///// DO NOT EDIT BELOW
diag_log "ADF RPT: Init - executing: ADF_MOD_createFARP.sqf";
if (isNil "ADF_fnc_createFARP") then {call compile preprocessFileLineNumbers "ADF\fnc\spawn\ADF_fnc_createFARP.sqf"};
[
///// DO NOT EDIT ABOVE

/*
    Step 1. Create an icon (type none or mil icon) marker on the map.
    Step 2. Give the marker a unique name. E.g. vehicleFARP1
    Step 3. The marker is th center position of the FARP. The marker orientation (azimuth) will determine the FARM orientation (direction).
    Step 4. Use the instructions below to pass the information to the server.
*/

"vehicleFARP1", // Change "vehicleFARP1" with the name of the marker where you want te FARP created. Make sure to wrap the name in "".
"car"           // Which kind of FARP:
                // - "car" for a vehicle FARP (all road vehicles, incl tracked vehicles)
                // - "heli" for helicopters. Cannot be used by jet/prop aircraft.
                // - "jet" for jet/prop aircraft. Cannot be used by helicopters.

// Step 5. Execute the module in your script. E.g.: if (ADF_HC_execute) then {execVM "scripts\ADF_mod_createFARP.sqf"};             
                
///// DO NOT EDIT BELOW
] call ADF_fnc_createFARP;