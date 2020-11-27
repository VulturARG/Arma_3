diag_log "ADF RPT: Init - executing scripts\init_redress.sqf"; // Reporting. Do NOT edit/remove

// v 1.09

ADF_fnc_redressAegis = {
	// init
	params ["_u"];	
	private _goggles			= selectRandom ["G_Lowprofile","None","G_Shades_Red","G_Sport_Red","None","G_Sport_Blackred","G_Squares_Tinted","None","None"];
	private _headGear 		= selectRandom ["H_Cap_tan","None","H_Cap_khaki_specops_UK","H_MilCap_gry","None","H_Beret_blk","H_Watchcap_khk","None","None"];
	
	private _a				= selectRandom [["arifle_MX_GL_Hamr_pointer_F","30Rnd_65x39_caseless_mag_Tracer",30],["arifle_MX_Hamr_pointer_F","30Rnd_65x39_caseless_mag_Tracer",30],["arifle_MXM_Hamr_pointer_F","30Rnd_65x39_caseless_mag_Tracer",30],["srifle_EBR_DMS_pointer_snds_F","20Rnd_762x51_Mag",20],["MMG_02_sand_RCO_LP_F","130Rnd_338_Mag",130],["srifle_DMR_02_sniper_AMS_LP_S_F","10Rnd_338_Mag",10]];
	private _priWeapon		= _a select 0;	
	private _priWeaponMag		= _a select 1;
	private _priWeaponMagAm	= _a select 2;

	// Strip and assign Uniform
	[_u, true] call ADF_fnc_stripUnit;	
	_u forceAddUniform "U_C_WorkerCoveralls";
	
	// Add NV
	_u addWeapon "NVGogglesB_gry_F";
	
	// Add vest
	_u addVest (selectRandom ["V_PlateCarrier2_rgr","V_PlateCarrierSpec_rgr","V_PlateCarrierIA2_dgtl","V_I_G_resistanceLeader_F"]);
	
	// Add headgear
	if (_headGear == "None") then {removeHeadgear _u} else {_u addHeadgear _headGear};	
	
	// Add Primary weapon & ammo
	_u addMagazine [_priWeaponMag,_priWeaponMagAm];	
	_u addWeapon _priWeapon;

	// Add Primary Weapon MAgazines & Secondary Weapon (launcher)
	if (_priWeapon == "MMG_02_sand_RCO_LP_F") then {
		_u addMagazines [_priWeaponMag, 2];
		_u addGoggles "G_Combat";
	} else {
		_u addMagazines [_priWeaponMag, 6];
		if ((random 1 < 0.6) && (_priWeapon == "arifle_MX_Hamr_pointer_F" || _priWeapon == "arifle_MXM_Hamr_pointer_F")) then {_u addBackpack "B_Bergen_sgg"; [_u, "launch_NLAW_F", 2, "NLAW_F"] call BIS_fnc_addWeapon;};
		if !(_goggles == "None") then {_u addGoggles _goggles} else {removeGoggles _u;};
	};
	if (_priWeapon == "arifle_MX_GL_Hamr_pointer_F") then {for "_i" from 1 to 6 do {_u addMagazine "1Rnd_HE_Grenade_shell"};};
	
	// Add default items
	_u linkItem "ItemMap"; _u linkItem "ItemCompass"; _u linkItem "ItemWatch"; _u linkItem "ItemRadio";
	for "_i" from 1 to 2 do {_u addMagazine "HandGrenade"; _u addMagazine "SmokeShell"; _u addMagazine "11Rnd_45ACP_Mag"; _u addItem "FirstAidKit";};
	_u addWeapon "hgun_Pistol_heavy_01_snds_F";
	
	// Identity
	_u setFace (selectRandom ["WhiteHead_09","WhiteHead_11","WhiteHead_19","WhiteHead_17","WhiteHead_15","WhiteHead_20"]);
	_u setSpeaker (selectRandom ["Male01ENGB","Male02ENGB","Male03ENGB","Male04ENGB","Male05ENGB"]);

	// Misc
	_u addPrimaryWeaponItem "acc_flashlight";
	_u selectWeapon (primaryWeapon _u);
	
	// Uniform & Insignia
	_u setObjectTextureGlobal [0, "\A3\characters_f\common\data\coveralls_grey_co.paa"];
	[_u, "Aegis_patch"] call BIS_fnc_setUnitInsignia;	
	
	// Skill
	[_u, "veteran"] call ADF_fnc_unitSetSkill;
	true
};

ADF_fnc_redressCAF = {
	params ["_u"];
	
	_uniformItems = uniformItems _u;
	removeUniform _u;
	_u forceAddUniform "U_B_CTRG_1";
	{_u addItemToUniform _x;} forEach _uniformItems;
	_u setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa"];
	
	if	(format	["%1", unitBackpack _u] != "") then {
		_backpackStore = backpackItems _u;
		removeBackpack _u;
		_u addBackpack "B_AssaultPack_blk";
		{_u addItemToBackpack _x;} forEach _backpackStore;	
	};
	
	_vestItems = vestItems _u;
	removeVest _u;
	_u addVest "V_PlateCarrier1_blk";
	{_u addItemToVest _x;} forEach _vestItems;
	
	removeHeadgear _u;
	_u addHeadgear "H_Beret_blk";
	
	// Identity
	_u setFace (selectRandom ["WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15"	]);
	
	// Insignia
	[_u,"CAF_patch"] call BIS_fnc_setUnitInsignia;
	
	[_u, "veteran"] call ADF_fnc_unitSetSkill;
	true
};

ADF_fnc_redressCSAT = {
	// init
	params ["_u"];

	// strip the unit
	[_u, true] call ADF_fnc_stripUnit;

	// Add Uniform container
	_u forceAddUniform "U_O_CombatUniform_ocamo"; 	//U_O_PilotCoveralls / U_O_CombatUniform_ocamo
	
	// Add Primary weapon & ammo
	_u addMagazine ["30Rnd_65x39_caseless_green",30];	
	_u addWeapon "arifle_Katiba_ACO_pointer_F";
	_u addHeadgear "H_HelmetSpecO_ocamo";
	
	// Add backpack
	if (random 1 < 0.33) then {_u addBackpack "B_FieldPack_ocamo"};
	_u addVest "V_HarnessOSpec_brn";
			
	// Add Primary Weapon MAgazines & Secondary Weapon (launcher)
	_u addMagazines ["30Rnd_65x39_caseless_green", 6];
	
	// Add default items
	_u linkItem "ItemMap"; _u linkItem "ItemCompass"; _u linkItem "ItemWatch"; _u linkItem "ItemRadio";
	for "_i" from 1 to 2 do {_u addMagazine "HandGrenade"; _u addMagazine "SmokeShell"; _u addMagazine "16Rnd_9x21_Mag"; _u addMagazine "Chemlight_red"; _u addItem "FirstAidKit";};
	_u addWeapon "hgun_Rook40_F";
	
	// Identity
	_u setFace (selectRandom ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","GreekHead_A3_03","GreekHead_A3_09","AfricanHead_02","AfricanHead_03"]);
	_u setSpeaker (selectRandom ["Male01PER","Male02PER","Male03PER"]);

	// Misc
	_u addPrimaryWeaponItem "acc_pointer_IR";
	_u selectWeapon (primaryWeapon _u);
	
	// Weapon light
	if (	((date select 3) < 5) && ((date select 3) > 19) && (random 1 < 0.33)) then {_u enableGunLights "forceOn"};
		
	[_u] call ADF_fnc_unitSetSkill;
	true
};

ADF_fnc_redressCSAT_airCrew = {
	// init
	params ["_u"];

	// strip the unit
	[_u, true] call ADF_fnc_stripUnit;

	// Add Uniform container
	_u forceAddUniform "U_O_PilotCoveralls";
	
	// Add Primary weapon & ammo
	_u addMagazine ["30Rnd_9x21_Mag_SMG_02_Tracer_Green",30];	
	_u addWeapon "SMG_02_ACO_F";
	_u addPrimaryWeaponItem "optic_Holosight_smg_blk_F";
	_u addHeadgear "H_PilotHelmetHeli_O";
	
	_u addVest "V_TacVest_khk";
			
	// Add Primary Weapon MAgazines & Secondary Weapon (launcher)
	_u addMagazines ["30Rnd_65x39_caseless_green", 6];
	
	// Add default items
	_u linkItem "ItemMap"; _u linkItem "ItemCompass"; _u linkItem "ItemWatch"; _u linkItem "ItemRadio";
	for "_i" from 1 to 2 do {_u addMagazine "SmokeShellRed"; _u addMagazine "SmokeShell"; _u addMagazine "16Rnd_9x21_Mag"; _u addMagazine "Chemlight_red"; _u addItem "FirstAidKit";};
	
	// Identity
	_u setFace "PersianHead_A3_01";

	// Misc
	if ("acc_pointer_IR" in (primaryWeaponItems _u)) then {_u removePrimaryWeaponItem "acc_pointer_IR"};
	_u addPrimaryWeaponItem "acc_flashlight";
	_u enableGunLights "forceOn";
	_u selectWeapon (primaryWeapon _u);
	true
};

ADF_fnc_redressCSAT3 = {
	// init
	params [
		"_u",
		["_vestItems", [], [[]]],
		["_backpackItems", [], [[]]]
	];
	private _unitRole = typeOf _u;
	private _hasBackpack = false;
	private _hasVest = false;

	_gv	= ["O_Soldier_GL_F","O_Soldier_TL_F"];


	// Store items for transfer into new containers
	private _uniformItems = uniformItems _u;	
	if ((vest _u) != "") then {_vestItems = vestItems _u; removeVest _u; _hasVest = true};
	if ((backpack _u) != "") then {_backpackItems = backpackItems _u; removeBackpack _u; _hasBackpack = true};	
	
	// remove uniform and headgear
	removeUniform _u; removeHeadgear _u;	

	// Add Uniform container and restore uniform gear
	_u forceAddUniform "U_O_PilotCoveralls";	
	
	// Add vest
	_u addVest "V_I_G_resistanceLeader_F";
	
	// Add backpack
	if (_hasBackpack) then {
		if (_unitRole in ["O_medic_F","O_Soldier_AAT_F","O_Soldier_A_F","O_Soldier_AAA_F","O_Soldier_AA_F","O_HeavyGunner_F"]) then {_u addBackpack "B_Kitbag_cbr"};
		if (_unitRole in ["O_Soldier_AR_F","O_Soldier_AT_F","O_Soldier_LAT_F","O_Soldier_AAR_F"]) then {_u addBackpack "B_TacticalPack_ocamo"};
	} else {
		_u addBackpack "B_FieldPack_ocamo";
	};
	
	// Add head gear
	if ((random 1) < 0.90) then {_u addHeadgear (["H_ShemagOpen_khk","H_ShemagOpen_tan","H_Watchcap_khk","H_Watchcap_cbr","H_Bandanna_sand","H_Booniehat_dirty","H_Shemag_tan","H_Cap_tan","H_TurbanO_blk","H_Cap_brn_SPECOPS"] call BIS_fnc_selectRandom)};
	
	// Add goggles	
	if (_unitRole in ["O_HeavyGunner_F","O_Soldier_AR_F"]) then {
		_u addGoggles "G_Combat"
	} else {
		if ((random 1) > 0.25) then {
			_u addGoggles (["G_Bandanna_tan","G_Bandanna_khk","G_Shades_Black","G_Tactical_Black"] call BIS_fnc_selectRandom)
		};
	};
	
	if (_unitRole in ["O_Soldier_F","O_Soldier_lite_F","O_Soldier_GL_F","O_Soldier_SL_F","O_Soldier_TL_F","O_Soldier_LAT_F","O_medic_F","O_soldier_repair_F","O_soldier_exp_F","O_Soldier_A_F","O_Soldier_AT_F","O_Soldier_AA_F","O_engineer_F","O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AAA_F","O_uniformItemspport_MG_F"]) then {
		if ("optic_ACO_grn" in (primaryWeaponItems _u)) then {_u removePrimaryWeaponItem "optic_ACO_grn"};
		if ("optic_Arco" in (primaryWeaponItems _u)) then {_u removePrimaryWeaponItem "optic_ACO_grn"};
		if !("acc_pointer_IR" in (primaryWeaponItems _u)) then {_u addPrimaryWeaponItem "acc_pointer_IR"};
		_u addPrimaryWeaponItem "optic_MRCO";
		_u addPrimaryWeaponItem "muzzle_snds_H";
	};
	if (_unitRole == "O_soldierU_AR_F") then {_u addPrimaryWeaponItem "optic_Arco"};
	if (_unitRole == "O_HeavyGunner_F") then {_u addPrimaryWeaponItem "muzzle_snds_93mmg_tan"; _u removePrimaryWeaponItem "optic_Arco"; _u addPrimaryWeaponItem "optic_tws_mg"};
	if (_unitRole == "O_soldier_M_F") then {_u addPrimaryWeaponItem "bipod_02_F_hex"; _u addPrimaryWeaponItem "muzzle_snds_B"};
	if (_unitRole == "O_Sharpshooter_F") then {_u addPrimaryWeaponItem "muzzle_snds_93mmg"; _u removePrimaryWeaponItem "optic_KHS_blk"; _u addPrimaryWeaponItem "optic_Nightstalker"};
	
	// Add stored items
	{_u addItem _x} forEach _uniformItems;
	if (_hasBackpack) then {{_u addItemToBackpack _x} forEach _backpackItems};
	if (_hasVest) then {{_u addItemToVest _x} forEach _vestItems};

	_u selectWeapon (primaryWeapon _u);
	
	// Weapon light
	if (	((date select 3) < 5) && ((date select 3) > 19) && (random 1 < 0.33)) then {_u enableGunLights "forceOn"};
	
	// Insignia
	[_u, "CSAT3_patch"] call BIS_fnc_setUnitInsignia;	
	
	// skill
	private _n = random 100;
	private _s = "novice";
	if (_n < 50) then {If (_n < 10) then {_s = "expert"} else {_s = "veteran"}};
	[_u, _s] call ADF_fnc_unitSetSkill;
	true
};

ADF_fnc_redressAFRF = {
	// init
	params ["_u"];
	private _a				= selectRandom [["arifle_Katiba_F","30Rnd_65x39_caseless_green_mag_Tracer",30],["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green_mag_Tracer",30],["srifle_DMR_04_F","10Rnd_127x54_Mag",10],["srifle_DMR_05_tan_f","10Rnd_93x64_DMR_05_Mag",10],["MMG_01_tan_F","150Rnd_93x64_Mag",150],["SMG_02_F","30Rnd_9x21_Mag",30]];
	private _priWeapon		= _a select 0;	
	private _priWeaponMag		= _a select 1;
	private _priWeaponMagAm	= _a select 2;
	private _magazines		= 3;

	// strip the unit
	[_u, true] call ADF_fnc_stripUnit;

	// Add generic containers
	_u forceAddUniform "U_O_CombatUniform_ocamo";
	_u addVest "V_PlateCarrier1_rgr";
	_u addHeadgear "H_HelmetIA_camo";
	_u addGoggles "G_Balaclava_oli";
	_u addWeapon "NVGoggles_INDEP";
	
	// Add Primary weapon & ammo
	_u addMagazine [_priWeaponMag,_priWeaponMagAm];
	_u addWeapon _priWeapon;
	_u addPrimaryWeaponItem "acc_pointer_IR";
	
	// Magazines stock
	switch (_priWeapon) do {
		case "arifle_Katiba_F"			: {_magazines = 7; _u addPrimaryWeaponItem "optic_MRCO"; _u addPrimaryWeaponItem "muzzle_snds_H";};
		case "arifle_Katiba_GL_F"		: {_magazines = 7; _u addPrimaryWeaponItem "optic_MRCO"; _u addPrimaryWeaponItem "muzzle_snds_H"; _u addBackpack "B_AssaultPack_dgtl"; for "_i" from 1 to 8 do {_u addMagazine "1Rnd_HE_Grenade_shell"}};
		case "srifle_DMR_04_F"			: {_magazines = 4; _u addPrimaryWeaponItem "optic_KHS_hex"; _u addPrimaryWeaponItem "bipod_03_F_oli";};
		case "srifle_DMR_05_tan_f"		: {_magazines = 3; _u addPrimaryWeaponItem "optic_KHS_tan"; _u addPrimaryWeaponItem "bipod_02_F_tan";};
		case "MMG_01_tan_F"				: {_magazines = 4; _u addPrimaryWeaponItem "optic_tws_mg"; _u addPrimaryWeaponItem "bipod_02_F_hex"; _u addBackpack "B_Kitbag_sgg";};
		case "SMG_02_F"					: {_magazines = 9; _u addPrimaryWeaponItem "muzzle_snds_L"; _u addPrimaryWeaponItem "optic_Nightstalker";};
		default 							  {_magazines = 7;};
	};
	_u addMagazines [_priWeaponMag, _magazines];
	
	// Add AT to Kariba soldier?
	if ((random 1 > 0.5) && _priWeapon == "arifle_Katiba_F") then {_u addBackpack "B_Kitbag_sgg"; [_u, "launch_I_Titan_short_F", 2, "Titan_AT"] call BIS_fnc_addWeapon;};
	
	// Add default items
	_u linkItem "ItemMap"; _u linkItem "ItemCompass"; _u linkItem "ItemWatch"; _u linkItem "ItemRadio";
	for "_i" from 1 to 2 do {_u addMagazine "HandGrenade"; _u addMagazine "SmokeShell"; _u addMagazine "16Rnd_9x21_Mag"; _u addMagazine "Chemlight_red"; _u addItem "FirstAidKit";};
	_u addWeapon "hgun_Rook40_F";
	
	// Identity
	_u setFace "WhiteHead_04";

	// Misc
	if (	((date select 3) < 5) && ((date select 3) > 19) && (random 1 < 0.33)) then {_u enableGunLights "forceOn"};
	_u selectWeapon (primaryWeapon _u);	
	
	// skill
	private _n = random 100;
	private _s = "novice";
	if (_n < 33) then {If (_n < 5) then {_s = "expert"} else {_s = "veteran"}};
	[_u, _s] call ADF_fnc_unitSetSkill;
	
	_u setObjectTextureGlobal [0, "\a3\characters_f\OPFOR\Data\clothing_rus_co.paa"];
	[_u, "AFRF_patch"] call BIS_fnc_setUnitInsignia;	
	true
};

ADF_fnc_redressNRF = {
	// init
	params ["_u"];
	
	// Strip
	[_u] call ADF_fnc_stripUnit;
	
	// Add uniform
	_u forceAddUniform "U_B_SpecopsUniform_sgg";
	
	// Add NV
	_u addWeapon "NVGoggles";
	
	// Add vest
	_u addVest "V_TacVest_khk";
	
	// Add headgear
	_u addHeadgear (selectRandom ["H_HelmetSpecB_paint2","H_HelmetB_sand","H_HelmetB_desert"]);	
	
	// Add Primary weapon & ammo
	_u addMagazine ["30Rnd_65x39_caseless_mag",30];	
	_u addWeapon "arifle_MX_Black_Hamr_pointer_F";
	_u addMagazines ["30Rnd_65x39_caseless_mag", 6];
	_u addGoggles "G_Combat";
	
	// Add default items
	_u linkItem "ItemMap"; _u linkItem "ItemCompass"; _u linkItem "ItemWatch"; _u linkItem "ItemRadio";
	for "_i" from 1 to 2 do {_u addMagazine "HandGrenade"; _u addMagazine "SmokeShell"; _u addMagazine "11Rnd_45ACP_Mag"; _u addItem "FirstAidKit";};
	_u addWeapon "hgun_Pistol_heavy_01_snds_F";
	
	// Misc
	_u setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa"];
	[_u, "CLANPATCH"] call BIS_fnc_setUnitInsignia;
	_u selectWeapon (primaryWeapon _u);
	
	[_u, "veteran"] call ADF_fnc_unitSetSkill;
	true
};

ADF_fnc_redressNRF_airCrew = {
	// init
	params ["_u"];

	// strip the unit
	[_u, true] call ADF_fnc_stripUnit;

	// Add Uniform container
	_u forceAddUniform "U_B_HeliPilotCoveralls";
	
	// Add Primary weapon & ammo
	_u addMagazine ["30Rnd_9x21_Mag_SMG_02_Tracer_Green",30];	
	_u addWeapon "SMG_02_ACO_F";
	_u addHeadgear "H_PilotHelmetHeli_B";
	
	_u addVest "V_TacVest_khk";
			
	// Add Primary Weapon MAgazines & Secondary Weapon (launcher)
	_u addMagazines ["30Rnd_65x39_caseless_green", 6];
	
	// Add default items
	_u linkItem "ItemMap"; _u linkItem "ItemCompass"; _u linkItem "ItemWatch"; _u linkItem "ItemRadio";
	for "_i" from 1 to 2 do {_u addMagazine "SmokeShellGreen"; _u addMagazine "SmokeShell"; _u addMagazine "16Rnd_9x21_Mag"; _u addMagazine "Chemlight_red"; _u addItem "FirstAidKit";};

	// Misc
	[_u, "CLANPATCH"] call BIS_fnc_setUnitInsignia;
	_u addPrimaryWeaponItem "acc_flashlight";
	_u selectWeapon (primaryWeapon _u);
	true
};

ADF_fnc_redressRebel = {
	// init
	params ["_u"];
	private _a				= selectRandom [["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green_mag_Tracer",30],["arifle_Mk20_plain_F","30Rnd_556x45_Stanag_Tracer_Green",30],["LMG_Zafir_F","150Rnd_762x54_Box_Tracer",150],["srifle_DMR_01_F","10Rnd_762x54_Mag",10]];
	private _priWeapon		= _a select 0;	
	private _priWeaponMag		= _a select 1;
	private _priWeaponMagAm	= _a select 2;

	// strip the unit
	[_u, true] call ADF_fnc_stripUnit;

	// Uniform container
	_u forceAddUniform (selectRandom ["U_C_WorkerCoveralls","U_I_pilotCoveralls","U_BG_Guerilla1_1","U_IG_leader","U_IG_Guerilla3_2","U_IG_Guerilla3_1","U_BG_leader","U_C_HunterBody_grn","U_I_G_resistanceLeader_F","U_BG_Guerilla2_2","U_IG_Guerilla2_3"]);
	if (uniform _u == "U_C_WorkerCoveralls") then {if (random 1 < 0.5) then {_u setObjectTextureGlobal [0, "\A3\characters_f\common\data\coveralls_bandit_co.paa"]} else {_u setObjectTextureGlobal [0, "\A3\characters_f\common\data\coveralls_urbancamo_co.paa"];}};

	// Vest & backpack
	_u addBackpack (selectRandom ["B_HuntingBackpack","B_OutdoorPack_blk","B_FieldPack_cbr","B_OutdoorPack_tan"]);
	_u addVest (selectRandom ["V_HarnessOGL_brn","V_BandollierB_oli","V_TacVest_oli","V_BandollierB_khk","V_HarnessO_gry","V_Chestrig_oli"]);
	
	// Add Primary weapon & ammo
	_u addMagazine [_priWeaponMag,_priWeaponMagAm];	
	_u addWeapon _priWeapon;
	
	// Add headgear
	if ((random 1) > 0.5) then {_u addHeadgear (selectRandom ["H_Bandanna_khk","H_Bandanna_camo","H_Cap_grn","H_Hat_camo"])};
	 
	// Add headgear
	if ((random 1) > 0.5) then {_u addGoggles (selectRandom ["G_Balaclava_blk","G_Bandanna_beast","G_Bandanna_oli"])}; ///// check addGoggles?????
			
	// Add Primary Weapon MAgazines & Secondary Weapon (launcher)
	if (_priWeapon == "LMG_Zafir_F") then {
		_u addMagazines [_priWeaponMag, 2];
	} else {
		_u addMagazines [_priWeaponMag, 6];
		if ((random 1 > 0.5) && _priWeapon == "arifle_Mk20_plain_F") then {[_u, "launch_RPG32_F", 2, "RPG32_F"] call BIS_fnc_addWeapon;};
	};
	
	if (_priWeapon == "arifle_Katiba_GL_F") then {_u addMagazines ["1Rnd_HE_Grenade_shell", 6];};
	
	// Add default items
	_u linkItem "ItemMap"; _u linkItem "ItemCompass"; _u linkItem "ItemWatch"; _u linkItem "ItemRadio";
	for "_i" from 1 to 2 do {_u addMagazine "HandGrenade"; _u addMagazine "SmokeShell"; _u addMagazine "Chemlight_red"; _u addItem "FirstAidKit";};
	if ((random 100) < 40) then {_u addMagazine "16Rnd_9x21_Mag"; _u addWeapon "hgun_Rook40_F";};
	
	// Identity
	_u setFace (selectRandom ["WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15"]);

	// Misc
	if ("acc_pointer_IR" in (primaryWeaponItems _u)) then {_u removePrimaryWeaponItem "acc_pointer_IR"};
	if ((random 100) < 33) then {_u addPrimaryWeaponItem "acc_flashlight"};
	_u selectWeapon (primaryWeapon _u);
	
	// skill
	private _s = "novice";
	if ((random 100) < 25) then {_s = "veteran"};
	[_u, _s] call ADF_fnc_unitSetSkill;
	true
};

ADF_fnc_redressPashtun = {
	// init
	params ["_u"];
	private _a				= selectRandom [["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green_mag_Tracer",30], ["arifle_Mk20_plain_F","30Rnd_556x45_Stanag_Tracer_Green",30], ["LMG_Zafir_F","150Rnd_762x54_Box_Tracer",150], ["srifle_DMR_01_F","10Rnd_762x54_Mag",10]];
	private _priWeapon		= _a select 0;	
	private _priWeaponMag		= _a select 1;
	private _priWeaponMagAm	= _a select 2;

	// strip the unit
	[_u, true] call ADF_fnc_stripUnit;

	// Add Uniform container
	_u forceAddUniform (selectRandom ["U_BG_Guerilla1_1","U_C_Poor_1","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_I_G_resistanceLeader_F","U_BG_leader","U_C_HunterBody_grn","U_BG_Guerilla2_1","U_BG_Guerilla2_2"]);
	
	// Add pairing containers
	switch (uniform _u) do {
		case "U_BG_Guerilla1_1"			: {_u addVest "V_BandollierB_khk"; _u addHeadgear "H_Bandanna_sand"; _u addGoggles "G_Bandanna_khk";};
		case "U_C_Poor_1"				: {_u addVest "V_BandollierB_oli"; _u addHeadgear "H_Cap_grn"; _u addGoggles "G_Bandanna_shades";};
		case "U_BG_Guerilla3_1"			: {_u addHeadgear "H_ShemagOpen_tan"; _u addGoggles "G_Aviator";};
		case "U_I_G_resistanceLeader_F"	: {_u addVest "V_HarnessOGL_brn"; _u addHeadgear "H_ShemagOpen_khk"; _u addGoggles "G_Shades_Green";};
		case "U_BG_Guerilla2_3"			: {_u addVest "V_TacVest_oli"; _u addHeadgear "H_Shemag_olive"; _u addGoggles "G_Aviator";};
		case "U_BG_leader"				: {_u addVest "V_BandollierB_khk"; _u addGoggles "G_Bandanna_khk";};
		case "U_C_HunterBody_grn"		: {_u addHeadgear "H_ShemagOpen_khk"; _u addGoggles "G_Sport_BlackWhite";};
		case "U_BG_Guerilla2_1"			: {_u addVest "V_HarnessO_gry"; _u addHeadgear "H_Bandanna_gry"; _u addGoggles "G_Bandanna_shades";};
		case "U_BG_Guerilla2_2"			: {_u addVest "V_Chestrig_oli"; _u addHeadgear "H_Bandanna_khk"; _u addGoggles "G_Balaclava_oli";};
		default 							  {_u addVest "V_BandollierB_khk"; _u addHeadgear "H_Bandanna_sand"; _u addGoggles "G_Bandanna_khk";};
	};
	
	// Add Primary weapon & ammo
	_u addMagazine [_priWeaponMag,_priWeaponMagAm];	
	_u addWeapon _priWeapon;
	
	// Add backpack
	_u addBackpack (selectRandom ["B_HuntingBackpack","B_OutdoorPack_blk","B_FieldPack_cbr","B_OutdoorPack_tan"]);
			
	// Add Primary Weapon Magazines & Secondary Weapon (launcher)
	if (_priWeapon == "LMG_Zafir_F") then {
		_u addMagazines [_priWeaponMag, 2];
	} else {
		_u addMagazines [_priWeaponMag, 6];
		if ((random 1 < 0.5) && _priWeapon == "arifle_Mk20_plain_F") then {[_u, "launch_RPG32_F", 2, "RPG32_F"] call BIS_fnc_addWeapon;};
	};
	if (_priWeapon == "arifle_Katiba_GL_F") then {_u addMagazines ["1Rnd_HE_Grenade_shell", 6];};
	
	// Add default items
	_u linkItem "ItemMap"; _u linkItem "ItemCompass"; _u linkItem "ItemWatch"; _u linkItem "ItemRadio";
	for "_i" from 1 to 2 do {_u addMagazine "HandGrenade"; _u addMagazine "SmokeShell"; _u addMagazine "Chemlight_red"; _u addItem "FirstAidKit";};
	if ((random 100) < 40) then {_u addMagazine "16Rnd_9x21_Mag"; _u addWeapon "hgun_Rook40_F";};
	
	// Identity
	_u setFace (selectRandom ["AfricanHead_01","AfricanHead_02","AfricanHead_03","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]);
	_u setSpeaker (selectRandom ["Male01PER","Male02PER","Male03PER"]);

	// Misc
	if ("acc_pointer_IR" in (primaryWeaponItems _u)) then {_u removePrimaryWeaponItem "acc_pointer_IR"};
	if ((random 100) < 33) then {_u addPrimaryWeaponItem "acc_flashlight"};
	_u selectWeapon (primaryWeapon _u);
	
	[_u] call ADF_fnc_unitSetSkill;
	true
};