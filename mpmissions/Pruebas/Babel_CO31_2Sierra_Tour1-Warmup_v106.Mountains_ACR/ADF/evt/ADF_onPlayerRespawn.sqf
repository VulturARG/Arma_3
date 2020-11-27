/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Respawn init 
Author: Whiztler
Script version: 1.12

File: ADF_onPlayerRespawn.sqf
**********************************************************************************
DO NOT edit this file. To set-up and configure your mission, edit the files in
the  '\mission\'  folder.
*********************************************************************************/

if (ADF_debug || time < 180) then {diag_log "ADF RPT: Init - executing: ADF_onPlayerRespawn.sqf"}

// Init
params ["_o","_k","_r","_t"];
private _u 	= player;

// No respawn (0) or Bird respawn (1) > 140B05
if ((getNumber (missionConfigFile >> "respawn")) < 2 || isNull _k) exitWith {
	if (ADF_mod_TFAR) then {[player, true] call TFAR_fnc_forceSpectator};
	if (ADF_mod_ACRE) then {[true] call acre_api_fnc_setSpectator};
}; 

// Disable Spectator
["Terminate"] call BIS_fnc_EGSpectator;

///// Apply stored Loadout
// Use the ACE3 function rather than the ADF function
if (ADF_mod_ACE3 && ADF_sameGearRespawn) exitWith {if (ADF_Clan_uniformInsignia) then {[_u,"CLANPATCH"] call BIS_fnc_setUnitInsignia};}; 

// Load the player loadout when ACE3 SameGearRespawn is NOT enabled
if (ADF_sameGearRespawn && !ADF_mod_ACE3) then {[_u, "LOAD"] call ADF_fnc_storeLoadout};
if (ADF_Clan_uniformInsignia) then {[_u,"CLANPATCH"] call BIS_fnc_setUnitInsignia};

// Altitude Based Fatigue
if (ADF_ABF) then {execVM "ADF\ADF_init_abf.sqf"};