/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: mission config entries
Author: Whiztler
Script version: 1.51

File: ADF_mission_config_insignia.hpp
**********************************************************************************
Here you can define a custom arm patch/insignia.

More information: https://community.bistudio.com/wiki/Description.ext#CfgUnitInsignia
*********************************************************************************/

class CfgUnitInsignia {
	
	// CLAN insignia	
	class CLANPATCH {
		displayName		= "NRF VJTF Two Sierra"; // Name displayed in Arsenal
		author			= "ADF / Whiztler";
		texture			= "mission\images\patch_TwoSierra.paa";
		textureVehicles	= ""; // Does nothing currently, reserved for future use
	};
	class CAF_patch {
		displayName 		= "CAF"; // Name displayed in Arsenal
		author 			= "ADF / Whiztler";
		texture 			= "mission\images\patch_CAF.paa";
		textureVehicle 	= ""; // Does nothing currently, reserved for future use
	};
	class AFRF_patch {
		displayName 		= "AFRF"; // Name displayed in Arsenal
		author 			= "ADF / Whiztler";
		texture 			= "mission\images\patch_AFRF.paa";
		textureVehicle 	= ""; // Does nothing currently, reserved for future use
	};
	class Aegis_patch {
		displayName 		= "Aegis"; // Name displayed in Arsenal
		author 			= "ADF / Whiztler";
		texture			= "mission\images\patch_Aegis.paa";
		textureVehicle 	= ""; // Does nothing currently, reserved for future use
	};
	class CSAT3_patch {
		displayName 		= "CSAT Special Forces"; // Name displayed in Arsenal
		author 			= "ADF / Whiztler";
		texture 			= "mission\images\patch_CSAT3.paa";
		textureVehicle 	= ""; // Does nothing currently, reserved for future use
	};		
};
