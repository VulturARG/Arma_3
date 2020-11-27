/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Module: Create IED('s)
Author: Whiztler
Module version: 1.17

File: ADF_mod_createIED.sqf
**********************************************************************************
This module creates IED's. There are three way's of creating IED's:

1.  Create a single IED at a marker position (icon marker, no radius)
2.  Create multiple IED's from an array with markers. E.g.:
    ["IED_1", "IED_2", "IED_3", "IED_4", "IED_5", "IED_6", "IED_7"]
3.  Create IED's in a retangular or eclipse sized maker.

INSTRUCTIONS:
Execute the module on the SERVER only!

Copy the module (this file) to your scripts folder: "scripts\ADF_mod_createIED.sqf";

Fill out the required and optional details below.

Execute in your mission script: if (isServer) then {execVM "ADF_mod_createIED.sqf"};
Or Execute via a trigger: if (isServer) then {0 = [] execVM "scripts\ADF_mod_createIED.sqf"};
Or copy below script into your mission script (execute on server or HC).
*********************************************************************************/

///// DO NOT EDIT BELOW
diag_log "ADF RPT: Init - executing: ADF_mod_createIED.sqf";
[
///// DO NOT EDIT ABOVE

/*
    Step 1. Determine how you want the IED's to be created. Options are:
            1.  Create a single IED at a marker position (icon marker, no radius)
            2.  Create multiple IED's from an array with markers. E.g.:
                ["IED_1", "IED_2", "IED_3", "IED_4", "IED_5", "IED_6", "IED_7"]
            3.  Create multiple IED's in a retangular or eclipse sized maker.   
    Step 2. Copy the module to your scripts folder, fill out below parameters and execute the moodule in your script: execVM "scripts\ADF_mod_createIED.sqf"
    Note:   Don't worry about the many comments as the ARMA engine ignores comments.
*/


"IEDposition",  // The position(s) where the IED('s) will be created. Depending on marker/array input. E.g.:
                //  * Marker icon (string) for direct placed. The IED is created within the given radius position
                //  * Array of markers. E.g. ["IED_1", "IED_2", "IED_3", "IED_4", "IED_5", "IED_6", "IED_7"]
                //  * Marker name (string) of a eclispe/retangle marker. The IED's will be created in the marker area randomly.

west,           // Side that activates the IED trigger. Usually the player side. Can be west, east or independent. Default: west

10,             // The number of IED's created within a marker area. Only change when using in combination with an eclipse/retangle marker. Default: 1

100,            // Random position placement radius in meters. Default: 100

250             // Radius to search for suitable road position with the random position placement. Default: 250

4.5             // Road offset in meters. The is the width of the road. Large road is approx 6. Smaller road is 4.5. Default: 4.5

///// DO NOT EDIT BELOW
] call ADF_fnc_createIED;

