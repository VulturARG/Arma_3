/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Mission Settings
Author: Whiztler
Script version: 2.16

Game type: n/a
File: ADF_mission_settings.sqf
*********************************************************************************
Use this script to configure framework and mission settings.
*********************************************************************************/

if (time < 180) then {diag_log "ADF RPT: Init - executing: ADF_mission_settings.sqf"};

/********** GENERAL **********/
ADF_mission_version = "1.06"; // Mission version
_ADF_mission_init_time = 45; // Mission Init time counter. Min 30 secs. Add 1 sec per 2 players. 10 players = 35 secs.
ADF_playerSide = west; // Which side are playable units on [west / east / GUER / CIV]
ADF_clanName = "Two Sierra"; // What is the name of your community/clan. Used in Hints, intro's etc.
ADF_clanTAG = "2 SIERRA"; // What is the tag of your community/clan. Used in Hints, intro's etc.
ADF_clanLogo = "mission\images\logo_clan_TwoSierra.paa"; // Full path to the clan logo. 
ADF_clanFlag = ""; // Full path to the clan flag (dimensions 512 x 256, pref PAA format).
_ADF_MissionIntroImage = "mission\images\intro_TwoSierra.paa"; // Full path to the mission intro image (dimensions: 2038 x 1024, PAA format only). 
ADF_Clan_uniformInsignia = true; // Apply custom clan insignia on uniform. Define in the description.ext [true/false]. 
_ADF_preset = "2SIERRA"; // pre-defined call sign/radio freq presets. [DEFAULT / SHAPE / NOPRYL / CUSTOM]. Configure the presets in 'ADF\modules\ADF_fnc_presets.sqf'
_ADF_briefingName = "ADF_briefing.sqf"; // Name of the briefing file (in '\mission\')
ADF_missionBalance = false; // Enable or diable the mission balancer

/********** GEAR & LOADOUT **********/
_ADF_customLoadout_MOD = true; // Are you using ADF loadout/gear or BIS Vanilla gear. Set to true for preset ADF gear (+ ACE, CTAB, Radios)? [true/false]
_ADF_noLoadout = false; // Set to true if you use your own loadout script or loadout mod. [true/false]
_ADF_uniform_inf = "U_B_SpecopsUniform_sgg"; // Infantry. Use uniform class name. Crew, pilots etc keep their Vanilla uniform.
_ADF_uniform_sor = "U_B_SpecopsUniform_sgg"; // Recon. Use uniform class name.
_ADF_add_NVGoggles = true; // add NV Goggles as default loadout [true/false].
_ADF_add_GPS = false; // Enable GPS for all unit (true) or only specialist/leadership roles (false).

// Weapons
_ADF_INF_assault_weapon = 1; // Infantry assault rifle: 1 = MX series  #  2 = TRG series.
_ADF_INF_LMG_weapon = 1; // Infantry light MG: 1 = MX SW  #  2 = MK200.
_ADF_INF_hand_weapon = 1; // Infantry Hand weapon: 1 = P07  #  2 = 4-five .45.
_ADF_INF_scopes = false; // add MRCO scopes to all infantry units [true/false].
_ADF_SOR_assault_weapon = 1; // SpecOp/Recon assault rifle: 1 = MX black series  #  2 = TRG series  #  3 = MX Compact series.
_ADF_SOR_hand_weapon = 1; // SpecOp/Recon Hand weapon: 1 = 4-five .45.  #  2 = P07
_ADF_CAV_assault_weapon = 1; // Cavalry crew weapon: 1 = MX Compact series  #  2 = Vermin SMG.
// ACE
_ADF_ACE3_microDAGR_all = false; // enable the ACE3 MicroDAGR for all players [true/false]
_ADF_ACE3_microDAGR_leaders = true; // enable the ACE3 MicroDAGR for leadership only [true/false]. Note that when both are set to false ACE BFT will be disabled.
// cTAB
_ADF_cTAB_side = ADF_playerSide; // Gets the information from ADF_playerside. Only change (east, west) if needed to.
_ADF_cTAB_microDAGR_all = false; // enable the ACE3 MicroDAGR for all players [true/false]
_ADF_cTAB_microDAGR_leaders = false; // enable the ACE3 MicroDAGR for leadership only [true/false]
// TFAR
_ADF_TFAR_personalRadio = "tf_rf7800str"; // TaskForce Radio. Personal (rifleman) radio [classname].
_ADF_TFAR_SWRadio = "tf_anprc152"; // TaskForce Radio. ShortWave radio [classname].
_ADF_TFAR_LRRadio = "tf_rt1523g_big"; // TaskForce Radio. Long Range radio [classname].
_ADF_TFAR_LRRadioSOR = "tf_rt1523g_black"; // TaskForce Radio. Long Range radio Special Operations Squadron [classname].
_ADF_TFAR_microDAGR = false; // enable/add the TFAR MicroDAGR [true/false]
ADF_TFAR_preset = true; // Preset TFAR freq's per group? Define in 'ADF\library\ADF_TFAR-freq.sqf'. [true/false].
// ACRE
_ADF_ACRE_personalRadio = "ACRE_PRC343"; // ACRE2. Personal (rifleman) radio [classname].
_ADF_ACRE_SWRadio = "ACRE_PRC148"; // ACRE2. ShortWave radio [classname]. Eg "ACRE_PRC148" or "ACRE_PRC152"
_ADF_ACRE_LRRadio = "ACRE_PRC117F"; // ACRE2. Long Range radio [classname].
_ADF_ACRE_fullDuplex = true; // Sets the duplex of radio transmissions. If set to true, it means that you will receive transmissions even while talking and multiple people can speak at the same time. [true/false].
_ADF_ACRE_interference = true; // Sets whether transmissions will interfere with each other. This, by default, causes signal loss when multiple people are transmitting on the same frequency. [true/false].
_ADF_ACRE_AIcanHear = true; // Sets whether AI can detect players speaking. [true/false].
ADF_ACRE_preset = false; // Preset ACRE freq's per group? Define in 'ADF\library\ADF_ACRE-freq.sqf'. [true/false].
// Crates / Vehicle supplies
_ADF_suppliesInit = true; // load crate/vehicle supplies for ADF template crates/vehicles

/********** UNIT/VEHICLE CACHING **********/
_ADF_Caching = true; // // Enable/disable caching of units and vehicles. Auto Disabled when HC is active. [true/false].
_ADF_Caching_unitDistance = 1000; // AI Unit caching distance default = 1000 meters.
_ADF_Caching_vehicleDistance_land = 250; // Cars caching distance default = 250 meters.
_ADF_Caching_vehicleDistance_air = 1500; // aircraft caching distance default = 250 meters.
_ADF_Caching_vehicleDistance_sea = 2000; // boats caching distance default = 250 meters.
_ADF_Caching_debugInfo = false; // Show caching debug info in ADF_debug mode

/********** VIEW DISTANCE **********/
setViewDistance 1500; // Default view distance.
ADF_VD_foot = 2000; // Maximum view distance on foot.
ADF_VD_vehicle = 3000; // Maximum view distance in a vehicle.
ADF_VD_air = 7500; // Maximum view distance when airborne.
ADF_VD_allowNoGrass = true; // Set 'false' if you want to disable "Low" option for terrain [true/false].

/********** F.A.R.P. REPAIR/REFUEL/REARM **********/
ADF_FARP_repairTime = 180; // Maximum time in seconds it takes to repair a vehicle at the FARP.
ADF_FARP_reloadTime = 10; // Maximum time in seconds it takes to re-arm per turret magazine at the FARP.
ADF_FARP_refuelTime = 90; // Maximum time in seconds it takes to refuel a vehicle at the FARP.

/********** RESPAWN / MOBILE HQ (MOBILE RESPAWN FOB) **********/
ADF_Tickets = false; // enable respawn tickets [true/false]. Make sure to configure in description.ext as well!!
_ADF_wTixNr = 10; // Respawn Tickets. Number available respawns for west Blufor.
_ADF_eTixNr = 15; // Respawn Tickets. Number available respawns for east Opfor.

_ADF_mhq_enable = false; // enable the MHQ function [true/false].
_ADF_mhq_respawn_nr = 3; // Number of MHQ vehicle respawn available.
_ADF_mhq_respawn_time = 15; // MHQ vehicle respawn time in minutes.
_ADF_mhq_respawn_class = "B_APC_Tracked_01_CRV_F"; // MHQ vehicle classname (default is the 'Bobcat').
_ADF_mhq_deploy_time = 120; // MHQ deployment time in seconds.
_ADF_mhq_packup_time = 180; // MHQ packup time in seconds.

/********** VEHICLE RESTRICTION (CREW CHECK) **********/
_ADF_crewCheck_Pilots = true; // enable the crew check function for Jet/Heli (co-)pilots and heli pilot/crew. [true/false]. Vehicles can be configured here: 'ADF\modules\ADF_fnc_crewCheckClasses.sqf'
_ADF_crewCheck_Armoured = true; // enable the crew check function for armored vehicle crew [true/false]. Vehicles can be configured here: 'ADF\modules\ADF_fnc_crewCheckClasses.sqf'

/********** THIRD PARTY MODS/SCRIPTS **********/
// Garbage collector
_ADF_CleanUp = true; // enable cleaning up of dead bodies (friendly, enemy, vehicles, etc.) [true/false].
_ADF_CleanUp_viewDist = 500; // min distance in meter from a player unit to allow delete, if you dont care if player sees the delete, set it to 0.
_ADF_CleanUp_manTimer = 300; // x seconds until delete of dead man units.
_ADF_CleanUp_vehTimer = 600; // x seconds until delete of dead vehicles, for destroyed and heavy damaged vehicles.
_ADF_CleanUp_abaTimer = 6000; // x seconds a vehicle must be unmanned to be deleted, for _abandoned option.

/********** MISC SETTINGS **********/
_ADF_altitude = false; // Enable altitude based fatigue (altitude mountain sickness)? True increases fatigue when > 1500 meter altitude [true/false].

enableSaving [false, false]; // Disables saving progress.
enableEngineArtillery false; // Disables BIS arty (map click).
enableTeamSwitch false; // Disables team switch.

/********** ADF DEV BUILD SETTINGS **********/
ADF_tpl_version = "2.06"; // ADF version DO NOT EDIT
_ADF_devBuild = "Production"; // [Alpha/Beta/Production] DO NOT EDIT
_ADF_devBuildNr = "03"; // Build number. DO NOT EDIT