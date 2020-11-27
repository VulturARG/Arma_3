/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: mission config entries
Author: Whiztler
Script version: 1.56

File: ADF_mission_config.hpp
**********************************************************************************
Mission config entries. Do not EDIT unless you know what you are doing!
*********************************************************************************/

#include "ADF_mission_config_custom.hpp"

class CfgRespawnTemplates { 

	class ADF_Spectator {
		onPlayerRespawn = "ADF_fnc_spectator";
	};

	class Spectator {
		onPlayerRespawn = "BIS_fnc_respawnSpectator";
	};
};

class cfgNotifications { 
	// Preconfigured messages
	
	class ADF_noticeMsg {
		title		= "NOTICE";
		description	= "%1";
		iconPicture	= "\A3\ui_f\data\map\markers\military\warning_ca.paa";
		iconText 	= "";
		color[] 		= {1, 1, 0, 1};		
		duration 	= 4;
		priority		= 7;
	};
};

class CfgSounds {

	sounds[] = {};
	
	// Transmit sound used by ADF function
	class radioTransmit {
		name = "Radio_Transmit_Sound";
		sound[] = {"ADF\bin\sound\in2c.ogg", 1, 1}; // filename, volume, pitch
		titles[] = {};
	};
	////////////////// MISSION SPECIFIC:
	#include "ADF_mission_config_sounds.hpp"
};

class CfgEnvSounds {
	sounds[] = {};
	
	#include "ADF_mission_config_envSounds.hpp"
};

class Params {
	class infoBlank_0 {title = ""; values[] = {-999}; default = -999; texts[] = {""};};	

	////////////////// DEBUG & REPORTING

    class infoBlank_1 {		
		title = "---------- DEBUG & REPORTING ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"; values[] = {-999}; default = -999; texts[] = {""};};
	
	class infoBlank_2 {title = ""; values[] = {-999}; default = -999; texts[] = {""};};	
	
	class ADF_debug_enable { // ADF Framework param - DO NOT REMOVE!
		title = "Mission Debug";
		values[] = {0,1};
		texts[] = {"Disabled","Enabled"};
		default = 0;
	};

	class ADF_extRpt_enable { // ADF Framework param - DO NOT REMOVE!
		title = "Extensive Server Reporting";
		values[] = {0,1};
		texts[] = {"Disabled","Enabled"};
		default = 0;
	};
  
	////////////////// HEADLESS CLIENT
	
	class infoBlank_3 {title = ""; values[] = {-999}; default = -999; texts[] = {""};};
	
	class infoBlank_4 {title = "---------- HEADLESS CLIENT ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"; values[] = {-999}; default = -999; texts[] = {""};};
	
	class infoBlank_5 {title = ""; values[] = {-999}; default = -999; texts[] = {""};};
  
	class ADF_HC_enable { // ADF Framework param - DO NOT REMOVE!
		title = "Headless Client(s)";
		values[] = {0,1};
		texts[] = {"Disabled","Enabled"};
		default = 1;
	};
	
	class ADF_HCLB_enable { // ADF Framework param - DO NOT REMOVE!
		title = "Headless Clients Load Balancing for multiple HC's";
		values[] = {0,1};
		texts[] = {"Disabled","Enabled"};
		default = 0;
	};
	
	 ////////////////// EQUIPMENT
	 
	class infoBlank_6 {title = ""; values[] = {-999}; default = -999; texts[] = {""};};
	
	class infoBlank_7 {		
		title = "---------- PLAYER EQUIPMENT -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"; values[] = {-999}; default = -999; texts[] = {""};};
	
	class infoBlank_8 {title = ""; values[] = {-999}; default = -999; texts[] = {""};};	 
	
	class ADF_tie_disable { // ADF Framework param - DO NOT REMOVE!
		title = "Thermal Imaging Equipment (vehicles)";
		values[] = {0,1};
		texts[] = {"Disabled in Vehicles","Enabled"};
		default = 0;
	};	
	
	class ADF_nvg_disable { // ADF Framework param - DO NOT REMOVE!
		title = "Night Vision Equipment (vehicles)";
		values[] = {0,1};
		texts[] = {"Disabled in Vehicles","Enabled"};
		default = 1;
	};
	
	class ADF_sameGear_enable { // ADF Framework param - DO NOT REMOVE!
		title = "Respawn with the same gear (ACE/ADF)";
		values[] = {0,1};
		texts[] = {"Disabled","Enabled"};
		default = 1;
	};

	class ADF_disable3PC_enable { // ADF Framework param - DO NOT REMOVE!
		title = "Force first person (excecpt in vehicles)";
		values[] = {0,1};
		texts[] = {"Diabled","Enabled"};
		default = 1;
	};
	
	class ADF_disable3PV_enable { // ADF Framework param - DO NOT REMOVE!
		title = "Force first person (also in vehicles)";
		values[] = {0,1};
		texts[] = {"Disabled","Enabled"};
		default = 0;
	};
		
	////////////////// PERFORMANCE
	
	class infoBlank_9 {title = ""; values[] = {-999}; default = -999; texts[] = {""};};
	
	class infoBlank_10 {
		title = "---------- PLAYER PERFORMANCE ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"; values[] = {-999}; default = -999; texts[] = {""};};
	
	class infoBlank_11 {title = ""; values[] = {-999}; default = -999; texts[] = {""};};	 	

	class ADF_AmbientEnv_enable { // ADF Framework param - DO NOT REMOVE!
		title = "Ambient Environment (rabbits, snakes, etc)";
		values[] = {0,1};
		texts[] = {"Disabled","Enabled"};
		default = 0;
	};

	class ADF_AmbientSnd_enable { // ADF Framework param - DO NOT REMOVE!
		title = "Ambient Sound (wind etc)";
		values[] = {0,1};
		texts[] = {"Disabled","Enabled"};
		default = 1;
	};
	
	////////////////// MISSION SPECIFIC:
	#include "ADF_mission_config_params.hpp"
	
};

// MISC

// TAW View Distance
#include "..\ADF\ext\taw_vd\GUI.h"