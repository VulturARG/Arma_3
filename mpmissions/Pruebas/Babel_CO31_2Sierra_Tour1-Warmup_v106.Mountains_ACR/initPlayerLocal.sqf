/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Local Player init
Author: Whiztler
Script version: 1.53

File: initPlayerLocal.sqf
**********************************************************************************
DO NOT edit this file. To set-up and configure your mission, edit the files in
the  '\mission\'  folder.
*********************************************************************************/

// Reporting
diag_log "ADF RPT: Init - executing: initPlayerLocal.sqf";

// Mission settings
#include "ADF\ADF_init_params.sqf"
#include "mission\ADF_mission_settings.sqf"

// Init player client
if (isNull player) then {waitUntil {!(isNull player)}; waitUntil {player == player}};

// Check if a headless client is wanted. If not and a HC joins then the HC exits and becomes an idle client
if (isMultiplayer && !ADF_headless && !hasInterface) exitwith {diag_log "ADF RPT: Init - HC: Terminating initPlayerLocal.sqf. ADF_headless is set to: false"};

// Briefing
if (hasInterface) then {private  _n = format ["mission\%1", _ADF_briefingName]; execVM _n};

// Pre-init
#include "ADF\ADF_init_pre.sqf"
#include "ADF\ADF_init_addons.sqf"

// Client Config
player setVariable ["BIS_enableRandomization", false];

// HC init
if (!hasInterface) then {private  _h = execVM "ADF\ADF_init_HC.sqf"; waitUntil {scriptDone _h}}; 

// Mission intro
if (!ADF_debug && !ADF_missionInit && hasInterface) then {
	if (_ADF_MissionIntroImage == "") then {_ADF_MissionIntroImage = ADF_clanLogo};
	private _m = getText (missionConfigFile >> "onLoadMission");  	
	[_ADF_mission_init_time, _ADF_MissionIntroImage, _m] spawn {
		params ["_t", "_i", "_d"];
		private _l = ["tLayer"] call BIS_fnc_rscLayer; 
		_l cutText ["", "BLACK IN", (_t + 10)];
		waitUntil {time > (_t - 10)};
		["<img size= '9' shadow='false' image='" + _i + "'/><br/><br/><t size='.7' color='#FFFFFF'>" + _d + "</t>", 0, 0, 3, 12] spawn BIS_fnc_dynamicText;
	};
};

// Init Players
if (!ADF_isHC) then {
	ADF_getLoadOut = [_ADF_noLoadout, _ADF_customLoadout_MOD, _ADF_uniform_inf, _ADF_uniform_sor, _ADF_add_NVGoggles, _ADF_add_GPS, _ADF_INF_assault_weapon, _ADF_INF_LMG_weapon, _ADF_INF_hand_weapon, _ADF_INF_scopes, _ADF_SOR_assault_weapon, _ADF_SOR_hand_weapon, _ADF_CAV_assault_weapon, _ADF_TFAR_PersonalRadio, _ADF_TFAR_SWRadio, _ADF_TFAR_LRRadio, _ADF_TFAR_LRRadioSOR, _ADF_ACE3_microDAGR_all, _ADF_ACE3_microDAGR_leaders, _ADF_cTAB_microDAGR_all, _ADF_cTAB_microDAGR_leaders] execVM "ADF\ADF_init_loadout.sqf";
	if (_ADF_mhq_enable) then {[_ADF_mhq_enable, _ADF_mhq_respawn_time, _ADF_mhq_respawn_nr, _ADF_mhq_respawn_class, _ADF_mhq_deploy_time, _ADF_mhq_packup_time, _ADF_wTixNr] execVM "ADF\ADF_init_mhq.sqf"};
	execVM "ADF\ADF_init_gm.sqf";
	if (_ADF_altitude) then {execVM "ADF\ADF_init_abf.sqf"};
	if (ADF_mod_ACE3 && ADF_sameGearRespawn) then {ACE_Respawn_SavePreDeathGear = true};
	if (ADF_debug) then {execVM "ADF\ADF_init_debug.sqf";};
	
	// Client EH's
	ADF_fnc_clientKilled = player addEventHandler ["killed", {_this execVM "ADF\evt\ADF_onPlayerKilled.sqf"}];	
};

// Post-init
if (!ADF_isHC) then {
	[_ADF_preset,_ADF_ACRE_fullDuplex,_ADF_ACRE_interference,_ADF_ACRE_AIcanHear,_ADF_TFAR_microDAGR] execVM "ADF\ADF_init_comm.sqf";
	[_ADF_mission_init_time, ADF_tpl_version, ADF_mission_version, _ADF_devBuild, _ADF_devBuildNr] execVM "ADF\ADF_init_post.sqf";
	if (ADF_disable3PC || ADF_disable3PV) then {player spawn ADF_fnc_disable3P};
};
enableEnvironment [ADF_AmbientEnv, ADF_AmbientSnd];

// Custom mission init
execVM "scripts\init.sqf";



