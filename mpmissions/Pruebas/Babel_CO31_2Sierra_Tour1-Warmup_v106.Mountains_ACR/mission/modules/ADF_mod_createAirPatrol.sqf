/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Module: Create Air Patrol
Author: Whiztler
Module version: 1.12

File: ADF_mod_createAirPatrol.sqf
**********************************************************************************
This module creates a crewed aircaft that patrols a given position/radius. The 
module creates waypoints in a given radius. You can define the type of aircaft.

INSTRUCTIONS:
Execute the module on the SERVER or HC only!

Copy the module (this file) to your scripts folder: "scripts\ADF_mod_createAirPatrol.sqf";

Fill out the required and optional details below.

Execute in your mission script: if (ADF_HC_execute) then {execVM "ADF_mod_createAirPatrol.sqf"};
Or Execute via a trigger: if (ADF_HC_execute) then {0 = [] execVM "scripts\ADF_mod_createAirPatrol.sqf"};
Or copy below script into your mission script (execute on server or HC).
*********************************************************************************/

/****  vv  COPY FROM HERE  vv  *****/
///// DO NOT EDIT BELOW
diag_log "ADF RPT: Init - executing: ADF_mod_createAirPatrol.sqf";
[
///// DO NOT EDIT ABOVE

/*
    Step 1. Determine a location where the aircraft will spawn. This can be a marker, an editor placed object, trigger, etc.
            Note that the aircraft will spawn airborn, fully crewed with pilot/gunner(s)
    Step 2a.    If you only need 1 aircraft patrol then fill out below items and execute the moodule in your script: execVM "scripts\ADF_mod_createAirPatrol.sqf"
    step 2b.    If you need mutliple patrols then copy from (COPY FROM HERE) till (COPY TILL HERE) into your script for each instance.
    Note:   Don't worry about the many comments as the ARMA engine ignores comments.
*/

"myMarker",         // Spawn location. This is the location on the map where the patrol units will be created. The location can be a marker, trigger, object, etc:
                    // - "myMarker" use the name of the marker to span an airborne aircraft on the marker location. Markers are always a string ("")
                    // - myTrigger use the name of the trigger to spawn an airborn aircraft at the trigger location (center). 
                    // - myObject use the name of an editor placed object to spawn the aircraft (airborne)
                    
"PatrolMarker",     // Patrol start location. Can be the same as the spawn location. If you want a different location than the spawn location than use:
                    // - "PatrolMarker" use the name of the marker where units will move to after they have spawned. Markers are always a string ("")
                    // - myTrigger use the name of the trigger here units will move to after they have spawned. (center). 
                    // - myObject use the name of an editor placed object where units will move to after they have spawned.
                    
east,               // Side of the units. Can be east, west or independent

2,                  // Number that represents the type of aircraft. Options are 