/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Module: Create Garrison
Author: Whiztler
Module version: 1.00

File: ADF_mod_createGarrison.sqf
**********************************************************************************
This module creates a group (2, 4 or 8 pax) that will garrison/militarize a given
area. The units will first populate all available empty turrets (static weapons
and vehicle turrets).If you do not want a turret to be populated than lock the
turret in the editor (lock, NOT lock player).

Units will look for buildings that have pre-defined (ARMA 3 engine) garisson
positions. There is a 75% chance they will populate the highest (incl roof)
positions first. 
Once all the garisson positions have been populated, the units that could not
get a garrison position will patrol the area (same radius). You can order the
patrol units to search nearby houses (default is false).
You can execute (optional) two functions. One for the group and one for each unit
of the group.

INSTRUCTIONS:
Execute the module on the SERVER or HC only!

Copy the module (this file) to your scripts folder: "scripts\ADF_mod_createGarrison.sqf";

Fill out the required and optional details below.

Execute in your mission script: if (ADF_HC_execute) then {execVM "ADF_mod_createGarrison.sqf"};
Or Execute via a trigger: if (ADF_HC_execute) then {0 = [] execVM "scripts\ADF_mod_createGarrison.sqf"};
Or copy below script into your mission script (execute on server or HC).
*********************************************************************************/

///// DO NOT EDIT BELOW
diag_log "ADF RPT: Init - executing: ADF_mod_createGarrison.sqf";
[
///// DO NOT EDIT ABOVE

/*
    Step 1. Determine a location where the garrison group will spawn. This can be a marker, an editor placed object, trigger, etc.
            The garrison location is the same as the spawn location. So choose a spawn location near buildings.
    Step 2. Copy the module to your scripts folder, fill out below parameters and execute the moodule in your script: execVM "scripts\ADF_mod_createGarrison.sqf"
    Note:   Don't worry about the many comments as the ARMA engine ignores comments.
*/

"myMarker",  // Spawn location. This is the location on the map where the garrison units will be created. The location can be a marker, trigger, object, etc:
             // - "myMarker" use the name of the marker to span the group on the marker location. Markers are always a string ("")
             // - myTrigger use the name of the trigger to spawn the group at the center of the trigger location. Do not use ("")
             // - myObject use the name of an editor placed object to spawn the aircraft (airborne). Do not use ("")

east,         // Side of the units. Can be east, west or independent

4,           // Size of the group, number of AI units in the group. Can be 1-8. Default: 4

false,        // In case of a squad (8) units, should it be a weapons squad or rifle squad. Default: false
             // - true for weapons squad
             // - false for rifle squad

100,         // Garrison radius in meter. The distance from the spawn position where AI units will look for buildings/static weapons to populate. Default: 50

false,        // Search nearby building? Should patrol units that have not been garrisoned search buildings on their patrol route?
             // - true. Search nearest building
             // - false. Do not search the nearest building (default)

"",          // String that represents a (custom) function (or code) that will be excuted for EACH UNIT of the garrison group.
             // E.g.: "my_fnc_redressInfantry"
             // default: ""
                    
""           // String that represents a (custom) function (or code) that will be excuted on the group as a whole.
             // E.g.: "my_fnc_setGroupID"  -or-  "ADF_fnc_groupSetSkill."
             // default: ""

///// DO NOT EDIT BELOW
] call ADF_fnc_createGarrison;