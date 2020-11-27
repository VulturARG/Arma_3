/*
 * Purpose: Init script to be ran on every client & server
 *          at mission start.  This detects if the headless
 *          client is present, and spawns units accordingly
 * 
 * Mission: Arma3 Headless Client Tutorial
 *  Author: Monsoon
 *   Email: rweezera@hotmail.com
 *
 */

//define function to spawn units
_spawnUnits = {
	//regular spawn method
	[] execVM "spawn_viaScript.sqf";
	[] execVM "spawn_EditorPlaced.sqf";

	//DAC spawning
	[] execVM "DAC\DAC_Config_Creator.sqf";
	[] execVM "spawn_viaDAC.sqf";
	True
};

//check if HC1 is present
HC1Present = if(isNil "HC1") then{False} else{True};

//spawn units on HC1 if present
if(HC1Present && isMultiplayer) then{
	if(!isServer && !hasInterface) then{
		diag_log "HC: Spawning AI on the HC";
		[] call _spawnUnits;
	};
}

//spawn units on server
else{
	if(isServer) then{
		diag_log "HC: Spawning AI the SERVER";
		[] call _spawnUnits;
	};
};