/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Module: Create Car Bomb
Author: Whiztler
Module version: 1.11

File: ADF_mod_createCarBomb.sqf
**********************************************************************************
This module creates a vehicle (default is a Fuel Track) in a predefined radus or at
a marker/trigger. The vehicle acts as a car bomb. The module aligns the vehicle
with the road and creates a trigger that will set off the bomb. 

INSTRUCTIONS:
Execute the module on the SERVER or HC only!

Copy the module (this file) to your scripts folder: "scripts\ADF_mod_createCarBomb.sqf";

Fill out the required and optional details below.

Execute in your mission script: if (ADF_HC_execute) then {execVM "ADF_mod_createCarBomb.sqf"};
Or Execute via a trigger: if (ADF_HC_execute) then {0 = [] execVM "scripts\ADF_mod_createCarBomb.sqf"};
Or copy below script into your mission script (execute on server or HC).
*********************************************************************************/

/****  vv  COPY FROM HERE  vv  *****/
///// DO NOT EDIT BELOW
diag_log "ADF RPT: Init - executing: ADF_mod_createCarBomb.sqf";
[
///// DO NOT EDIT ABOVE

/*
    Step 1. Place a marker on the map. This will be the location where the car bomb vehicle will be created. See below comment for more info.
    Step 2. Fill out below parameters
    Step 3. Execute the moodule in your script: execVM "scripts\modules\ADF_mod_createAO.sqf"
*/

"carBombMarker",    //  The (approx) position where thecarBomb vehicle should be created. This can be:
                    //  * Marker name (string) of a eclispe/retangle marker. The vehicle will be placed in the marker area randomly.
                    //  * Marker icon for direct placed. The vehicle spawns at the marker and the direction of the vehicle will be the marker azimuth.
                    //  * Object. The vehicle spawns at or next to an existing object.
                    //  * Array. Position array [X,Y,Z]
                    
west,               //  Side that triggers the carBomb explosion. Usually the player side. Can be west, east, independent. Default: west

10,                 //  The carBomb trigger area. This is the radius in meters around the vehicle that activates the car bomb. Default: 10

"C_Offroad_luxe_F"  //  The classname of the vehicle that acts as the car bomb vehicle. Default: "C_Van_01_fuel_F"  (civilian fuel truck)

///// DO NOT EDIT BELOW
] call ADF_fnc_createCarBomb;
/****  ^^  COPY TILL HERE  ^^  *****/
