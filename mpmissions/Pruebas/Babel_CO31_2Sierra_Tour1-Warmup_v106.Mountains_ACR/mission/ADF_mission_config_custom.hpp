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

File: ADF_mission_config.hpp
**********************************************************************************
Mission config entries. Below mission specific classes are automatically loaded
into the description.ext during mission init/
*********************************************************************************/

// Two  Sierra specific!
class CfgVehicleTemplates {
	class ADF_opforOffroad {
		displayName = "ADF_pashtunOffroad"; 
		author = "Whiztler";
		textures[] = {
			"mission\images\cusTex_offroad.jpg"
		};
		animationList[] = {
			"HideDoor1", 1,
			"HideDoor2", 1,
			"HideGlass2", 1,
			"HideDoor3", 1,
			"HideBackpacks", 0,
			"HideBumper2", 0,
			"HideConstruction", 0,
			"Proxy", 0,
			"Destruct", 0
		};
	};
	
	class ADF_aegisOffroad {
		displayName = "ADF_aegisOffroad"; 
		author = "Whiztler";
		textures[] = {
			"mission\images\cusTex_offroad_Aegis.jpg"
		};
		animationList[] = {
			"HideDoor1", 0,
			"HideDoor2", 0,
			"HideGlass2", 1,
			"HideDoor3", 0,
			"HideBackpacks", 0,
			"HideBumper2", 0,
			"HideConstruction", 0,
			"Proxy", 0,
			"Destruct", 0
		};
	};
	
	class ADF_rebelOffroad {
		displayName = "ADF_soborianOffroad"; 
		author = "Whiztler";
		textures[] = {
			"mission\images\cusTex_offroad_Rebels.jpg"
		};
		animationList[] = {
			"HideDoor1", 1,
			"HideDoor2", 1,
			"HideGlass2", 1,
			"HideDoor3", 1,
			"HideBackpacks", 0,
			"HideBumper2", 0,
			"HideConstruction", 0,
			"Proxy", 0,
			"Destruct", 0
		};
	};
	
	class ADF_russianOffroad {
		displayName = "ADF_russianOffroad"; 
		author = "Whiztler";
		textures[] = {
			"mission\images\cusTex_offroad_Russians.jpg"
		};
		animationList[] = {
			"HideDoor1", 1,
			"HideDoor2", 1,
			"HideGlass2", 1,
			"HideDoor3", 1,
			"HideBackpacks", 0,
			"HideBumper2", 0,
			"HideConstruction", 0,
			"Proxy", 0,
			"Destruct", 0
		};
	};		
		
	
	class ADF_opforTruck {
		displayName = "ADF_opforTruck"; 
		author = "Whiztler";
		texturesList[] = {
			"guerilla_06", 1
		};
	};
};

class CfgMarkers {
	class Sign_NRF {
		name = "NRF Logo";
		icon = "mission\images\Icon_NRF.paa";
		color[] = {0, 0, 1, 1};
		shadow = true;
		scope = 1;
	};
};
