/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Module: Ambient Civilian Traffic
Author: Whiztler
Module version: 1.00

File: ADF_mod_ACT.sqf
**********************************************************************************
This module creates civilian man and civilian crew vehicles around the players. 
Man have waypoints leading to houses and enter houses to look around.
Cars have waypoints close to the players location en then drive off to a far
waypoint.

INSTRUCTIONS:
Execute the module on the server. The module does not run on HC's or player clients

Copy the module (this file) to your scripts folder: "scripts\ADF_mod_ACT.sqf";

Fill out the required and optional details below.

Execute in your mission script: if (isServer) then {execVM "scripts\ADF_mod_ACT.sqf"};
Or Execute via a trigger: 0 = [] execVM "scripts\ADF_mod_ACT.sqf";
Or copy below script into your mission script (execute on server or HC).

The ACT mod can be stopped by envoking 'ADF_ACT_vTerminate = true;' in a script
or the console (execute on server).
********************************************************************************/

///// DO NOT EDIT BELOW
diag_log "ADF RPT: Init - executing: ADF_mod_ACT.sqf";
///// DO NOT EDIT ABOVE

/*
Step 1. 	To prepare the map, you'll need to place two markers
		1. marker where the aircraft will spawn. 
		2. marker for the approach vector (North, east, South or west) of the AO.
		You define the marker names below.
Step 1.	Fill out below configuration
Step 2.	Add the following line to your script to execute the ACT module:
		if (isServer) then {execVM "scripts\modules\ADF_mod_ACT.sqf"};
*/

// Maximum number of civilian vehicles that spawn around the players. 0 to disable.
ADF_ACT_vehiclesMax 			= 3;

// Distance (meters) from players that vehicles will spawn. Note there is no visibility check. Default: 1250
ADF_ACT_vehiclesRadiusSpawn 	= 1250;

// Distance (meters) from players that vehicles will be deleted. Default: 1500
ADF_ACT_vehiclesRadiusTerm 	= 1500;

// Maximum number of civilian man (foot mobiles) that spawn around the players. 0 to disable.
ADF_ACT_manMax 				= 2;

// Distance (meters) from players that man will be deleted. Default: 500
ADF_ACT_manRadiusTerm 			= 500;

// ACT Debug mode. True for on. False for off. Default: false
ACT_debug 					= false;


///// DO NOT EDIT BELOW
execVM "ADF\fnc\ambient\ADF_fnc_ACT.sqf";
