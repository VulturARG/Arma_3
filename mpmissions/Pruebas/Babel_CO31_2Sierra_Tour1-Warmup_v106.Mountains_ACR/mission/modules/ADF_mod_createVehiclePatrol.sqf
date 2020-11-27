/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Module: Create Vehicle Patrol
Author: Whiztler
Module version: 1.07

File: ADF_mod_createVehiclePatrol.sqf
**********************************************************************************
This module creates created a vehicle and vehicle crew and sends the vehicle out
on patrol.The module creates waypoints on roads in a given radius. You can define
which type of vehicle.

INSTRUCTIONS:
Make sure the spawn position is close to roads (or on a road) and roads are within
the radius. Keep the radius below 1500 else the script might take a long time to
search for suitable locations. Execute the module on the SERVER or HC only!

Copy the module (this file) to your scripts folder: "scripts\ADF_mod_createVehiclePatrol.sqf";

Fill out the required and optional details below.

Execute in your mission script: if (ADF_HC_execute) then {execVM "ADF_mod_createVehiclePatrol.sqf"};
Or Execute via a trigger: if (ADF_HC_execute) then {0 = [] execVM "scripts\ADF_mod_createVehiclePatrol.sqf"};
Or copy below script into your mission script (execute on server or HC).
*********************************************************************************/

diag_log "ADF RPT: Init - executing: ADF_mod_createVehiclePatrol.sqf";
[
///// DO NOT EDIT ABOVE

/*
    Step 1. Determine a location where the vehicle will spawn. This can be a marker, an editor placed object, trigger, etc.
            The script searches for waypoints on roads. So make sure there's at least a road nearby the spawn location.
    Step 2. Execute the moodule in your script: execVM "scripts\ADF_mod_createVehiclePatrol.sqf"
    Note:   Don't worry about the many comments as the ARMA engine ignores comments.
*/

"myMarker",         // Spawn location. This is the location on the map where the crewed vehicle will be created. The location can be a marker, trigger, object, etc:
                    // - "myMarker" use the name of the marker to span a vehicle on the marker location. Markers are always a string ("")
                    // - myTrigger use the name of the trigger to spawn a vehicle the center location of a trigger. 
                    // - myObject use the name of an editor placed object to spawn the vehicle.
                    
"PatrolMarker",     // Patrol start location. Can be the same as the spawn location. If you want a different location than the spawn location than use:
                    // - "PatrolMarker" use the name of the marker where the vehicle will move to after it has spawned. Markers are always a string ("")
                    // - myTrigger use the name of the trigger where the vehicl3 will move to after it has spawned. (center). 
                    // - myObject use the name of an editor placed object where the vehicle will move to after it has spawned.
                    
east,               // Side of the vehicle and its crew. Can be east, west or independent

2,                  // Number that represents the type of vheicle. Options are
                    // 1: Random Transport truck (default)
                    // 2: Random Unarmed MRAP/Car
                    // 3: Random Armed MRAP/Car
                    // 4: Random APC
                    // 5: Random heavy armored

true,                // Crew the vessel with gunners?
                    // True - driver + gunner(s)/crew (default)
                    // false - driver only                  
                    
1500,               // Number that represents the patrol Radius in meters from the patrol start position.  (default: 750)

6,                  // Number that represents the number of random patrol waypoints that should be created. (default: 4)

"MOVE",             // Waypoint type. (default: "MOVE"). More info: https://community.bistudio.com/wiki/Waypoint_types

"SAFE",             // Waypoint behavior. (default: "SAFE"). More info: https://community.bistudio.com/wiki/setWaypointBehaviour

"RED",              // Combat mode. (default: "YELLOW"). More info: https://community.bistudio.com/wiki/setWaypointCombatMode

"LIMITED",          // Patrol speed. (default: "LIMITED"). More info: https://community.bistudio.com/wiki/waypointSpeed

"FILE",             // Patrol formation. (default: "COLUMN"). More info: https://community.bistudio.com/wiki/waypointFormation

50,                 // Waypoint completion radius. (default: 15). More info: https://community.bistudio.com/wiki/setWaypointCompletionRadius

"",                 // String that represents a (custom) function (or code) that will be excuted for EACH UNIT of the crew.
                    // E.g.: "my_fnc_redressTheCrew"  -or-  "ADF_fnc_objectBoatCrew"
                    // default: ""
                    
""                  // String that represents a (custom) function (or code) that will be excuted on the crew as a group.
                    // E.g.: "my_fnc_setGroupID"  -or-  "ADF_fnc_groupSetSkill."
                    // default: ""

///// DO NOT EDIT BELOW
] call ADF_fnc_createVehiclePatrol;