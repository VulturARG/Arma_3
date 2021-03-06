/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Add-on init
Author: Whiztler
Script version: 1.03

File: ADF_init_addons.sqf
**********************************************************************************
DO NOT edit this file. To set-up and configure your mission, edit the files in
the  '\mission\'  folder.
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt || time < 180) then {diag_log "ADF RPT: Init - executing: ADF_init_addons.sqf"};

/*
///// UNITS
// Preference: 1. RHS - 2. CUP - 3. Vanilla
ADF_aio_uMod	= if (ADF_mod_RHS) then {"RHS"} else {if (ADF_mod_CUP_U) then {"CUP"} else {"BIS"}};

///// VEHICLES
// Preference: 1. RHS - 2. CUP - 3. Vanilla
ADF_aio_vMod	= if (ADF_mod_RHS) then {"RHS"} else {if (ADF_mod_CUP_V) then {"CUP"} else {"BIS"}};

///// WEAPONS
// Preference: 1. HLC Weapons - 2. RHS - 3. CUP - 4. Vanilla
ADF_aio_wMod	= if (ADF_mod_HLCW) then {"HLC"} else {if (ADF_mod_RHS) then {"RHS"} else {if (ADF_mod_CUP_W) then {"CUP"} else {"BIS"}}};

/*
switch ADF_aio_wMod do {
	case "HLC" :	{ADF_aio_weapons = };
	case "RHS" :	{};
	case "CUP" :	{};
	default		{}
};
*/


// Map specific settings. Classes of Ambient Civilian Traffic
if (isServer) then {
	private _vDefault = [
		"C_Offroad_01_red_F", "C_Offroad_luxe_F", "C_Offroad_01_sand_F", "C_Offroad_stripped_F", "C_Offroad_01_white_F", "C_Offroad_01_blue_F", "C_Offroad_01_darkred_F", "C_Offroad_01_bluecustom_F",
		"C_Hatchback_01_grey_F", "C_Hatchback_01_green_F", "C_Hatchback_01_blue_F", "C_Hatchback_01_bluecustom_F", "C_Hatchback_01_beigecustom_F", "C_Hatchback_01_yellow_F", "C_Hatchback_01_white_F", "C_Hatchback_01_black_F", "C_Hatchback_01_dark_F",
		"C_Hatchback_01_sport_red_F", "C_Hatchback_01_sport_blue_F", "C_Hatchback_01_sport_orange_F", "C_Hatchback_01_sport_white_F", "C_Hatchback_01_sport_grey_F", "C_Hatchback_01_sport_green_F",
		"SUV_01_base_red_F", "SUV_01_base_black_F", "SUV_01_base_grey_F", "SUV_01_base_orange_F",
		"C_Van_01_transport_white_F", "C_Van_01_transport_red_F",
		"C_Van_01_box_white_F", "C_Van_01_box_red_F",
		"C_Van_01_fuel_white_F", "C_Van_01_fuel_red_F", "C_Van_01_fuel_white_v2_F", "C_Van_01_fuel_red_v2_F",
		"C_Truck_02_transport_F", "C_Truck_02_covered_F", "C_Truck_02_fuel_F", "C_Truck_02_box_F",
		"C_Offroad_01_repair_F"
	];
	
	private _mDefault = [
		"C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F",
		"C_man_shorts_1_F", "C_man_shorts_2_F", "C_man_shorts_3_F", "C_man_shorts_4_F",
		"C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F",
		"C_man_p_beggar_F",
		"C_man_p_fugitive_F",
		"C_man_p_shorts_1_F",
		"C_man_hunter_1_F",
		"C_journalist_F",
		"C_Nikos_aged"
	];
	private _uDefault = [
		"U_C_man_sport_1_F", "U_C_man_sport_2_F", "U_C_man_sport_3_F",
		"U_C_Man_casual_1_F", "U_C_Man_casual_2_F", "U_C_Man_casual_3_F", "U_C_Man_casual_4_F", "U_C_Man_casual_5_F", "U_C_Man_casual_6_F",
		"U_C_HunterBody_grn", "U_C_HunterBody_brn",
		"U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy",	"U_C_Poloshirt_redwhite", "U_C_Poloshirt_salmon", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour",
		"U_C_Poor_1", "U_C_Poor_2",
		"U_BG_Guerilla2_1", "U_IG_Guerilla2_2", "U_IG_Guerilla2_3",
		"U_IG_Guerilla3_1", "U_IG_Guerilla3_2",
		"U_Competitor",
		"U_C_WorkerCoveralls",	
		"U_C_Journalist",
		"U_C_Scientist",
		"U_Marshal",
		"U_Rangemaster"
	];
	switch worldName do {
		case "Chernarus" :	{
			if (ADF_mod_CUP_U) then {
				ADF_civilian_man = [
					"CUP_C_C_Citizen_01", "CUP_C_C_Citizen_02", "CUP_C_C_Citizen_03", "CUP_C_C_Citizen_04", 
					"CUP_C_C_Worker_01", "CUP_C_C_Worker_02", "CUP_C_C_Worker_03", "CUP_C_C_Worker_04", "CUP_C_C_Worker_05",
					"CUP_C_C_Profiteer_01", "CUP_C_C_Profiteer_02", "CUP_C_C_Profiteer_03", "CUP_C_C_Profiteer_04", 
					"CUP_C_C_Woodlander_01", "CUP_C_C_Woodlander_02", "CUP_C_C_Woodlander_03", "CUP_C_C_Woodlander_04", 
					"CUP_C_C_Villager_01", "CUP_C_C_Villager_02", "CUP_C_C_Villager_03", "CUP_C_C_Villager_04", 
					"CUP_C_C_Rocker_01", "CUP_C_C_Rocker_02", "CUP_C_C_Rocker_03",
					"CUP_C_C_Mechanic_01", "CUP_C_C_Mechanic_02", "CUP_C_C_Mechanic_03",
					"CUP_C_C_Priest_01",
					"CUP_C_C_Doctor_01",
					"CUP_C_C_Rescuer_01",
					"CUP_C_C_Policeman_01", "CUP_C_C_Policeman_02",
					"CUP_C_C_Fireman_01",
					"CUP_C_C_Schoolteacher_01",
					"CUP_C_C_Assistant_01"
				];
			} else {
				ADF_civilian_man = _mDefault;
				ADF_civilian_uniforms = _uDefault;
			};
			
			if (ADF_mod_CUP_V) then {
				ADF_civilian_wheeled_vehicles = [
					"C_Offroad_01_red_F", "C_Offroad_luxe_F", "C_Offroad_01_sand_F", "C_Offroad_stripped_F", "C_Offroad_01_white_F", "C_Offroad_01_blue_F", "C_Offroad_01_darkred_F", "C_Offroad_01_bluecustom_F",
					"C_Hatchback_01_grey_F", "C_Hatchback_01_green_F", "C_Hatchback_01_blue_F", "C_Hatchback_01_bluecustom_F", "C_Hatchback_01_beigecustom_F", "C_Hatchback_01_yellow_F", "C_Hatchback_01_white_F", "C_Hatchback_01_black_F", "C_Hatchback_01_dark_F",
					"C_Hatchback_01_sport_red_F", "C_Hatchback_01_sport_blue_F", "C_Hatchback_01_sport_orange_F", "C_Hatchback_01_sport_white_F", "C_Hatchback_01_sport_grey_F", "C_Hatchback_01_sport_green_F",
					"SUV_01_base_red_F", "SUV_01_base_black_F", "SUV_01_base_grey_F", "SUV_01_base_orange_F",
					"C_Van_01_transport_white_F", "C_Van_01_transport_red_F",
					"C_Van_01_box_white_F", "C_Van_01_box_red_F",
					"C_Van_01_fuel_white_F", "C_Van_01_fuel_red_F", "C_Van_01_fuel_white_v2_F", "C_Van_01_fuel_red_v2_F",
					"C_Truck_02_transport_F", "C_Truck_02_covered_F", "C_Truck_02_fuel_F", "C_Truck_02_box_F",
					"CUP_C_Skoda_White_CIV", "CUP_C_Skoda_Red_CIV", "CUP_C_Skoda_Blue_CIV", "CUP_C_Skoda_Green_CIV",
					"CUP_C_V3S_Open_TKC", "CUP_C_V3S_Covered_TKC", 
					"CUP_C_Datsun", "CUP_C_Datsun_4seat", "CUP_C_Datsun_Plain", "CUP_C_Datsun_Covered",
					"CUP_C_Golf4_red_Civ", "CUP_C_Golf4_black_Civ", "CUP_C_Golf4_yellow_Civ", "CUP_C_Golf4_blue_Civ", "CUP_C_Golf4_white_Civ", "CUP_C_Golf4_green_Civ", "CUP_C_Golf4_whiteblood_Civ", "CUP_C_Golf4_camodigital_Civ", "CUP_C_Golf4_camodark_Civ", "CUP_C_Golf4_reptile_Civ", "CUP_C_Golf4_kitty_Civ",
					"CUP_C_SUV_TK", "CUP_C_SUV_CIV", "SUV_01_base_red_F", "SUV_01_base_black_F", "SUV_01_base_grey_F", "SUV_01_base_orange_F",
					"CUP_C_UAZ_Unarmed_TK_CIV", "CUP_C_UAZ_Open_TK_CIV",
					"CUP_C_Ural_Civ_02", "CUP_C_Ural_Civ_03", "CUP_C_Ural_Open_Civ_01", "CUP_C_Ural_Open_Civ_03", 
					"C_Truck_02_transport_F", "C_Truck_02_covered_F", "C_Truck_02_fuel_F", "C_Truck_02_box_F",
					"CUP_C_LR_Transport_CTK"						
				]; 	
			} else {
				ADF_civilian_wheeled_vehicles = _vDefault;
			};
		};

		case "BMFayshkabur";
		case "CLAfghan";
		case "Fallujah";
		case "Fata";
		case "Fayshkhabur";
		case "Kunduz";
		case "MCN_Aliabad";
		case "MCN_Hazarkot";
		case "Mountains_ACR";
		case "PJA306";
		case "PJA307";
		case "Porto";
		case "Praa_AV";
		case "reshmaan";
		case "Shapur_BAF";
		case "Takistan";
		case "Torabora";
		case "Tunba";
		case "TUP_QOM";
		case "Zargabad":{
			ADF_ACT_houseTypes = ["Land_House","Land_A_Mosque"];
			if (ADF_mod_CUP_U) then {
				ADF_civilian_man = [
					"CUP_C_TK_Man_01","CUP_C_TK_Man_02","CUP_C_TK_Man_03", "CUP_C_TK_Man_04","CUP_C_TK_Man_05","CUP_C_TK_Man_06", "CUP_C_TK_Man_07","CUP_C_TK_Man_08",
					"CUP_C_TK_Man_01_Coat","CUP_C_TK_Man_03_Coat","CUP_C_TK_Man_05_Coat","CUP_C_TK_Man_06_Coat","CUP_C_TK_Man_07_Coat",
					"CUP_C_TK_Man_01_Jack","CUP_C_TK_Man_02_Jack","CUP_C_TK_Man_03_Jack","CUP_C_TK_Man_04_Jack","CUP_C_TK_Man_05_Jack","CUP_C_TK_Man_06_Jack","CUP_C_TK_Man_08_Jack",
					"CUP_C_TK_Man_01_Waist","CUP_C_TK_Man_02_Waist","CUP_C_TK_Man_03_Waist","CUP_C_TK_Man_04_Waist","CUP_C_TK_Man_05_Waist","CUP_C_TK_Man_06_Waist","CUP_C_TK_Man_07_Waist","CUP_C_TK_Man_08_Waist"
				];
			
			} else {
				ADF_civilian_man = _mDefault;
			};
			
			ADF_civilian_uniforms = _uDefault;
			if (ADF_mod_CUP_V) then {
				ADF_civilian_wheeled_vehicles = [
					"C_Offroad_01_red_F", "C_Offroad_luxe_F", "C_Offroad_01_sand_F", "C_Offroad_stripped_F", "C_Offroad_01_white_F", "C_Offroad_01_blue_F", "C_Offroad_01_darkred_F", "C_Offroad_01_bluecustom_F",
					"C_Hatchback_01_grey_F", "C_Hatchback_01_green_F", "C_Hatchback_01_blue_F", "C_Hatchback_01_bluecustom_F", "C_Hatchback_01_beigecustom_F", "C_Hatchback_01_yellow_F", "C_Hatchback_01_white_F", "C_Hatchback_01_black_F", "C_Hatchback_01_dark_F",
					"C_Hatchback_01_sport_red_F", "C_Hatchback_01_sport_blue_F", "C_Hatchback_01_sport_orange_F", "C_Hatchback_01_sport_white_F", "C_Hatchback_01_sport_grey_F", "C_Hatchback_01_sport_green_F",
					"SUV_01_base_red_F", "SUV_01_base_black_F", "SUV_01_base_grey_F", "SUV_01_base_orange_F",
					"C_Van_01_transport_white_F", "C_Van_01_transport_red_F",
					"C_Van_01_box_white_F", "C_Van_01_box_red_F",
					"C_Van_01_fuel_white_F", "C_Van_01_fuel_red_F", "C_Van_01_fuel_white_v2_F", "C_Van_01_fuel_red_v2_F",
					"C_Truck_02_transport_F", "C_Truck_02_covered_F", "C_Truck_02_fuel_F", "C_Truck_02_box_F",
					"CUP_C_Skoda_White_CIV", "CUP_C_Skoda_Red_CIV", "CUP_C_Skoda_Blue_CIV", "CUP_C_Skoda_Green_CIV",
					"CUP_C_V3S_Open_TKC", "CUP_C_V3S_Covered_TKC", 
					"CUP_C_Datsun", "CUP_C_Datsun_4seat", "CUP_C_Datsun_Plain", "CUP_C_Datsun_Covered",
					"CUP_C_Golf4_red_Civ", "CUP_C_Golf4_black_Civ", "CUP_C_Golf4_yellow_Civ", "CUP_C_Golf4_blue_Civ", "CUP_C_Golf4_white_Civ", "CUP_C_Golf4_green_Civ", "CUP_C_Golf4_whiteblood_Civ", "CUP_C_Golf4_camodigital_Civ", "CUP_C_Golf4_camodark_Civ", "CUP_C_Golf4_reptile_Civ", "CUP_C_Golf4_kitty_Civ",
					"CUP_C_SUV_TK", "CUP_C_SUV_CIV", "SUV_01_base_red_F", "SUV_01_base_black_F", "SUV_01_base_grey_F", "SUV_01_base_orange_F",
					"CUP_C_UAZ_Unarmed_TK_CIV", "CUP_C_UAZ_Open_TK_CIV",
					"CUP_C_Ural_Civ_02", "CUP_C_Ural_Civ_03", "CUP_C_Ural_Open_Civ_01", "CUP_C_Ural_Open_Civ_03", 
					"C_Truck_02_transport_F", "C_Truck_02_covered_F", "C_Truck_02_fuel_F", "C_Truck_02_box_F",
					"CUP_C_LR_Transport_CTK", "CUP_C_Ikarus_TKC",
					"CUP_C_TT650_TK_CIV"
				];				
			} else {
				ADF_civilian_wheeled_vehicles = _vDefault;
			};
		};
		
		case "Tanoa" :		{
			ADF_ACT_houseTypes=["Land_House","Land_Shop"];
			ADF_civilian_man = [
				"C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F",
				"C_man_shorts_1_F", "C_man_shorts_2_F", "C_man_shorts_3_F", "C_man_shorts_4_F",
				"C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F",
				"C_man_p_beggar_F",
				"C_man_p_fugitive_F",
				"C_man_p_shorts_1_F",
				"C_man_hunter_1_F",
				"C_journalist_F",
				"C_Nikos_aged"
			];			
			ADF_civilian_uniforms = [
				"U_C_man_sport_1_F", "U_C_man_sport_2_F", "U_C_man_sport_3_F",
				"U_C_Man_casual_1_F", "U_C_Man_casual_2_F", "U_C_Man_casual_3_F", "U_C_Man_casual_4_F", "U_C_Man_casual_5_F", "U_C_Man_casual_6_F",
				"U_C_HunterBody_grn", "U_C_HunterBody_brn",
				"U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy",	"U_C_Poloshirt_redwhite", "U_C_Poloshirt_salmon", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour",
				"U_C_Poor_1", "U_C_Poor_2",
				"U_BG_Guerilla2_1", "U_IG_Guerilla2_2", "U_IG_Guerilla2_3",
				"U_IG_Guerilla3_1", "U_IG_Guerilla3_2",
				"U_Competitor",
				"U_C_WorkerCoveralls",	
				"U_C_Journalist",
				"U_C_Scientist",
				"U_Marshal",
				"U_Rangemaster"
			];
			ADF_civilian_wheeled_vehicles = [
				"C_Offroad_01_red_F", "C_Offroad_luxe_F", "C_Offroad_01_sand_F", "C_Offroad_stripped_F", "C_Offroad_01_white_F", "C_Offroad_01_blue_F", "C_Offroad_01_darkred_F", "C_Offroad_01_bluecustom_F",
				"C_Hatchback_01_grey_F", "C_Hatchback_01_green_F", "C_Hatchback_01_blue_F", "C_Hatchback_01_bluecustom_F", "C_Hatchback_01_beigecustom_F", "C_Hatchback_01_yellow_F", "C_Hatchback_01_white_F", "C_Hatchback_01_black_F", "C_Hatchback_01_dark_F",
				"C_Hatchback_01_sport_red_F", "C_Hatchback_01_sport_blue_F", "C_Hatchback_01_sport_orange_F", "C_Hatchback_01_sport_white_F", "C_Hatchback_01_sport_grey_F", "C_Hatchback_01_sport_green_F",
				"SUV_01_base_red_F", "SUV_01_base_black_F", "SUV_01_base_grey_F", "SUV_01_base_orange_F",
				"C_Van_01_transport_white_F", "C_Van_01_transport_red_F",
				"C_Van_01_box_white_F", "C_Van_01_box_red_F",
				"C_Van_01_fuel_white_F", "C_Van_01_fuel_red_F", "C_Van_01_fuel_white_v2_F", "C_Van_01_fuel_red_v2_F",
				"C_Truck_02_transport_F", "C_Truck_02_covered_F", "C_Truck_02_fuel_F", "C_Truck_02_box_F",
				"U_C_man_sport_1_F", "U_C_man_sport_2_F", "U_C_man_sport_3_F",
				"U_C_Man_casual_1_F", "U_C_Man_casual_2_F", "U_C_Man_casual_3_F", "U_C_Man_casual_4_F", "U_C_Man_casual_5_F", "U_C_Man_casual_6_F",		
				"C_Offroad_01_repair_F"
			]; 	
		};			
		
		case "Stratis";
		case "Malden";	
		case "Altis";
		default				{
			ADF_ACT_houseTypes = ["i_House", "i_Shop"];
			ADF_civilian_man = _mDefault;
			ADF_civilian_wheeled_vehicles = _vDefault;
			ADF_civilian_uniforms = _uDefault;
		};
	};
};

/*
				"XXXXX", "XXXXX", "XXXXX", "XXXXX", "XXXXX", "XXXXX",
				"XXXXX", "XXXXX", "XXXXX", "XXXXX", "XXXXX", "XXXXX",
*/
