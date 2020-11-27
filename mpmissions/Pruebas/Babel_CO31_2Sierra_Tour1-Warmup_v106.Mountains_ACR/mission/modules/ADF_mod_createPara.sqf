/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Module: Create Para drop
Author: Whiztler
Module version: 1.11

File: ADF_mod_createPara.sqf
**********************************************************************************
This module creates a transport helicopter and an infantry fire team or infantry
squad. The AI units are loaded into the helicopter and then flown to the drop off
point where they will para drop.
You can pass 2 functions to the script:

Function1 will run (call) on individual units once the infantry group has been
created (e.g. a loadout script). Params passed to the function: _this select 0: unit 

Function2 will run (spawn) on the group itself. Can be used to give the group
directives once they have landed (e.g. assault waypoints). Params passed to the
function: _this select 0: group.

After dropping off the para group, the helicopter returns to the spawn position
where the helicopter and its crew are deleted.

INSTRUCTIONS:
Execute the module on the SERVER or HC only!

Copy the module (this file) to your scripts folder: "scripts\ADF_mod_createPara.sqf";

Fill out the required and optional details below.

Execute in your mission script: if (ADF_HC_execute) then {execVM "ADF_mod_createPara.sqf"};
Or Execute via a trigger: if (ADF_HC_execute) then {0 = [] execVM "scripts\ADF_mod_createPara.sqf"};
Or copy below script into your mission script (execute on server or HC).
*********************************************************************************/

///// DO NOT EDIT BELOW
diag_log "ADF RPT: Init - executing: ADF_mod_createPara.sqf";
[
///// DO NOT EDIT ABOVE

/*
    Step 1. Create a marker on the map where the helicopter and the pparagroup will spawn
            The paradrop location can be a marker, object, group or trigger.
    Step 2. Copy the module to your scripts folder and fill out below parameters
    Step 3. Execute the moodule in your script: execVM "scripts\ADF_mod_createPara.sqf"
*/

"spawnMarker",          //  Location where both the helicopter and the para group are created. This can be:                 
                        //  * Marker. E.g. "mySpawnMarker"
                        //  * Object. E.g. myFlagPole
                        //  * Trigger E.g. myTrigger
                        //  * Array. Position array [X,Y,Z]

"paraDropMarker",       //  Para drop location. Please note that the group will start jumping out of the aircraft 350 meters from the para drop location:                   
                        //  * Marker. E.g. "myParaDropMarker"
                        //  * Object. E.g. myCar
                        //  * Trigger E.g. myTrigger
                        //  * Array. Position array [X,Y,Z]

east,                   //  Side of the helicopter and the paragroup. Can be west, east or independent. Default: east

2,                      //  Size of the para infantry group:
                        //  1: Fire team
                        //  2: Squad (default)

"",                     //  Code to execute on each unit of the paragroup (e.g. a function)  (default = "") 
                        //  code is CALLED. each unit is passed (_this select 0) to the code/fnc.

""                      //  Code to execute on the paragroup (e.g. a function)  (default = "")
                        //  code is CALLED. each unit is passed (_this select 0) to the code/fnc.

///// DO NOT EDIT BELOW
] spawn ADF_fnc_createPara;
