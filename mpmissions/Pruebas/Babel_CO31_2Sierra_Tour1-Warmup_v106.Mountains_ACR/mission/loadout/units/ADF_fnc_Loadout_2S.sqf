/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Loadout Gear 2 SIERRA campaign
Author: Whiztler
Script version: 1.06

Game type: COOP
File: ADF_fnc_loadout2S.sqf
*********************************************************************************
Used exclusively for the Two Sierra COOP Campaign
*********************************************************************************/

diag_log "ADF RPT: Init - executing ADF_fnc_Loadout2S.sqf"; // Reporting. Do NOT edit/remove

/********* INIT ********/
		
tf_no_auto_long_range_radio			= true;
private _u 						= _this;
private _r						= toLower (((str  _u) splitString "_") select 1);

// Init Weapon
private _ADF_INF_priWpn			= "arifle_MX_Black_Hamr_pointer_F";
private _ADF_INF_priWpn_lite		= "arifle_MXC_Black_F";
private _ADF_INF_priWpn_GL			= "arifle_MX_GL_Black_Hamr_pointer_F";
private _ADF_INF_priWpn_LMG		= "LMG_Mk200_MRCO_F";
private _ADF_INF_priWpn_MG			= "MMG_02_black_RCO_BI_F";
private _ADF_INF_handWpn			= "hgun_P07_F";
private _ADF_INF_tube_Lite			= "launch_NLAW_F";
private _ADF_INF_tube_AT			= "launch_B_Titan_short_F";
private _ADF_INF_tube_AA			= "launch_B_Titan_F";

// Attachments
private _ADF_INF_priWpnScope_lite	= "optic_Aco";

// Init ammo
private _ADF_INF_priWpnMag			= "30Rnd_65x39_caseless_mag";
private _ADF_INF_priWpnMag_LMG		= "200Rnd_65x39_cased_Box_Tracer";
private _ADF_INF_priWpnMag_MG		= "130Rnd_338_Mag";

private _ADF_INF_handWpn_mag		= "16Rnd_9x21_Mag";
private _ADF_INF_tubeMag_Lite		= "NLAW_F";
private _ADF_INF_tubeMag_AT		= "Titan_AT";
private _ADF_INF_tubeMag_AA		= "Titan_AA";
private _ADF_INF_40mike			= "1Rnd_HE_Grenade_shell";
private _ADF_INF_handgrenade		= "HandGrenade";

// Radios
private _ADF_TFAR_PersonalRadio	= "tf_rf7800str";
private _ADF_TFAR_SWRadio			= "tf_anprc152";
private _ADF_TFAR_LRRadio			= "tf_rt1523g_big_rhs";

// Misc
private _ADF_microDAGR				= "Chemlight_green"; // in can of no ACE3 or cTAB

// ACE overrides
if (ADF_mod_ACE3) then {
	_ADF_INF_priWpnMag 			= "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim";
	_ADF_INF_priWpnMag_LMG			= "ACE_200Rnd_65x39_cased_Box_Tracer_Dim";
};

// Default ACE3 kit
private _ADF_INF_ACE3_default 		= ["ACE_EarPlugs", "ace_mapTools", "ACE_CableTie", "ACE_IR_Strobe_Item", "ACE_morphine", "ACE_HandFlare_White", "ACE_HandFlare_White", "ACE_M84", "ACE_M84"];
private _ADF_INF_ACE3_defaultMed	= ["ACE_fieldDressing", "ACE_elasticBandage", "ACE_quikclot", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_quikclot", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_quikclot"];
								
// Strip the unit
[_u] call ADF_fnc_stripUnit;


/********* DEFAULT TWO SIERRA LOADOUT ********/

// Add Items/gear
_u forceAddUniform "U_B_SpecopsUniform_sgg";
{_u linkItem _x} forEach ["ItemWatch", "ItemCompass", "ItemMap"];
_u addHeadgear (selectRandom ["H_HelmetSpecB_paint2", "H_HelmetB_sand", "H_HelmetB_desert"]);
_u addVest "V_TacVest_khk";
_u addItem "acc_flashlight";
_u addItemToUniform "acc_pointer_IR";
_u addWeapon "NVGoggles_OPFOR";


// MicroDAGR. If no ACE or CtAB than add chemlight
if (ADF_mod_ACE3) then {_ADF_microDAGR = "ACE_microDAGR"};
if (!ADF_mod_ACE3 && ADF_mod_CTAB) then {_ADF_microDAGR = "itemMicroDagr"};

// Closing arguments
ADF_loadout_platoon = {
	params ["_u", "_r"];
	_u selectWeapon (primaryWeapon _u);
	if (isMultiplayer && ADF_mod_ACE3) then {_u setSpeaker "ACE_NoVoice";};
	if (ADF_mod_ACE3) then {[_u, currentWeapon _u, currentMuzzle _u] call ACE_SafeMode_fnc_lockSafety;};
	if (ADF_Clan_uniformInsignia) then {[_u,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
	
	// Hand weapon
	for "_i" from 1 to 3 do {_u addMagazine _ADF_INF_handWpn_mag;};
	_u addWeapon _ADF_INF_handWpn;
	
	// Misc 
	for "_i" from 1 to 2 do {
		_u addItem "SmokeShell"; _u addItem "Chemlight_green"; _u addItem _ADF_INF_handgrenade;
		if (!ADF_mod_ACE3) then {_u addItem "FirstAidKit";};
	};	
	
	// Add ACE3 default loadout items
	if (ADF_mod_ACE3) then {
		_def = count _ADF_INF_ACE3_default;
		for "_i" from 0 to _def do {_u addItem (_ADF_INF_ACE3_default select _i)};
		_med = count _ADF_INF_ACE3_defaultMed;
		for "_i" from 0 to _med do {_u addItem (_ADF_INF_ACE3_defaultMed select _i)};
	};

	// cTab
	if (ADF_mod_CTAB) then {_u addItemToUniform "ItemcTabHCam"};	

	// Personal Radios all units
	if (ADF_mod_ACRE) then {_u addItem "ACRE_PRC343"}; // ACRE
	if (ADF_mod_TFAR) then {_u linkItem _ADF_TFAR_PersonalRadio; _u addItem "tf_microdagr";}; // TFAR
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_u linkItem "ItemRadio"}; // Vanilla
	
	// mircoDAGR
	if (_r == "pc" || _r == "tto" || _r == "sql" || _r == "wtl" || _r == "frl") then {_u addItem _ADF_microDAGR;};
	
	// Add Uniform EH
	_u addEventHandler ["Take", {
		(getObjectTextures player + [uniformContainer player getVariable "texture"])
		params ["_t", "_n", "_c"];
		if (isNil "_c") exitWith {};
		if (_t == _c) exitWith {};
		player setObjectTextureGlobal [0, _c];
		if (ADF_Clan_uniformInsignia) then {[player,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
		false
	}];

	// Set local Texture
	private _t =  "\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa";
	uniformContainer _u setVariable ["texture", _t, true];
	player setObjectTextureGlobal [0, _t];
	ADF_gearLoaded = true;
};

/********* TWO SIERRA UNIT LOADOUT ********/

// Platoon Commander
if (_r == "pc") exitWith {
	_u linkItem "ItemGPS";
	_u addGoggles "G_Tactical_Clear";
	_u addWeapon "Laserdesignator";
	_u addItem "Laserbatteries";	
	
	// Mod Items
	if (ADF_mod_ACRE) then {_u addBackpack "B_AssaultPack_cbr"; _u addItem "ACRE_PRC148"; _u addItemToBackpack "ACRE_PRC117F";};
	if (ADF_mod_TFAR) then {_u addBackpack _ADF_TFAR_LRRadio} else {_u addBackpack "B_AssaultPack_cbr"};	
	if (ADF_mod_ACE3) then {_u addItem "ace_dagr";};
	if (ADF_mod_CTAB) then {_u addItem "ItemcTab";};

	// Weapons
	for "_i" from 1 to 5 do {_u addMagazine _ADF_INF_priWpnMag;};
	_u addWeapon _ADF_INF_priWpn_lite;
	_u addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	
	[_u, _r] call ADF_loadout_platoon;
};

// Platoon/Squad: RTO
if (_r == "rto") exitWith {
	_u linkItem "ItemGPS";
	_u addGoggles "G_Tactical_Clear";
	
	// Mod items
	if (ADF_mod_ACRE) then {_u addBackpack "B_AssaultPack_cbr"; _u addItem "ACRE_PRC148"; _u addItemToBackpack "ACRE_PRC117F";};
	if (ADF_mod_TFAR) then {_u addBackpack _ADF_TFAR_LRRadio};
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_u addBackpack "B_AssaultPack_cbr";};
	if (ADF_mod_ACE3) then {_u addWeapon "ACE_Vector"; _u addItem "ace_dagr";} else {_u addWeapon "Rangefinder";};
	if (ADF_mod_CTAB) then {_u addItem "ItemAndroid";};	
	
	// Weapons
	for "_i" from 1 to 8 do {_u addMagazine _ADF_INF_priWpnMag;};
	_u addWeapon _ADF_INF_priWpn_lite;
	_u addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;


	[_u, _r] call ADF_loadout_platoon;
};

// Squad: Leader
if (_r == "sql") exitWith {
	_u linkItem "ItemGPS";
	_u addGoggles "G_Tactical_Clear";
	
	// Mod items
	if (ADF_mod_ACRE) then {_u addBackpack "B_Kitbag_cbr"; _u addItemToBackpack "ACRE_PRC148";};
	if (ADF_mod_TFAR) then {_u addBackpack _ADF_TFAR_LRRadio};
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_u addBackpack "B_Kitbag_cbr";};	
	if (ADF_mod_ACE3) then {_u addItem "ACE_HuntIR_M203"; _u addItem "ACE_HuntIR_monitor"; _u addWeapon "ACE_Vector"; 	_u addItem "ace_dagr";	} else {_u addWeapon "Rangefinder";};
	if (ADF_mod_CTAB) then {_u addItem "ItemAndroid";};
	
	// Weapons
	for "_i" from 1 to 8 do {_u addMagazine _ADF_INF_priWpnMag; _u addItemToVest _ADF_INF_40mike;};
	_u addWeapon _ADF_INF_priWpn_GL;
	
	[_u, _r] call ADF_loadout_platoon;
};

// Fire Team: Leader
if (_r == "ftl") exitWith {
	_u linkItem "ItemGPS";
	_u addGoggles "G_Tactical_Clear";
	
	// Mod items
	if (ADF_mod_ACRE) then {_u addBackpack "B_Kitbag_cbr"; _u addItemToBackpack "ACRE_PRC148";};
	if (ADF_mod_TFAR) then {_u addBackpack _ADF_TFAR_LRRadio};
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_u addBackpack "B_Kitbag_cbr";};	
	if (ADF_mod_ACE3) then {_u addItem "ACE_HuntIR_M203"; _u addItem "ACE_HuntIR_monitor"; _u addWeapon "ACE_Vector"; 	_u addItem "ace_dagr";	} else {_u addWeapon "Rangefinder";};
	if (ADF_mod_CTAB) then {_u addItem "ItemAndroid";};
	
	// Weapons
	for "_i" from 1 to 8 do {_u addMagazine _ADF_INF_priWpnMag; _u addItemToVest _ADF_INF_40mike;};
	_u addWeapon _ADF_INF_priWpn_GL;
	
	[_u, _r] call ADF_loadout_platoon;
};

// Weapons Team: Leader
if (_r == "wtl") exitWith {
	_u linkItem "ItemGPS";
	_u addGoggles "G_Tactical_Clear";
	
	// Mod items
	if (ADF_mod_ACRE) then {_u addBackpack "B_Kitbag_cbr"; _u addItemToBackpack "ACRE_PRC148";};
	if (ADF_mod_TFAR) then {_u addBackpack _ADF_TFAR_LRRadio};
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_u addBackpack "B_Kitbag_cbr";};		
	if (ADF_mod_ACE3) then {_u addItem "ACE_HuntIR_M203"; _u addItem "ACE_HuntIR_monitor"; _u addWeapon "ACE_Vector"; 	_u addItem "ace_dagr";	} else {_u addWeapon "Rangefinder";};
	if (ADF_mod_CTAB) then {_u addItem "ItemAndroid";};
	
	// Weapons
	for "_i" from 1 to 8 do {_u addMagazine _ADF_INF_priWpnMag;};
	for "_i" from 1 to 3 do {_u addItemToVest _ADF_INF_40mike;};
	_u addWeapon _ADF_INF_priWpn_GL;	
	_u addMagazine _ADF_INF_tubeMag_AA;
	_u addWeapon _ADF_INF_tube_AA;
	
	[_u, _r] call ADF_loadout_platoon;
};

// Squad: Medic
if (_r == "cls") exitWith {
	_u linkItem "ItemGPS";
	_u addBackpack "B_Carryall_cbr";
	_u addGoggles "G_Tactical_Clear";
	
	// Weapons
	for "_i" from 1 to 8 do {_u addMagazine _ADF_INF_priWpnMag;};
	_u addWeapon _ADF_INF_priWpn;
	for "_i" from 1 to 4 do {_u addItemToVest "SmokeShell"; 	_u addItemToVest "Chemlight_green";	};
	
	// ACE3 Medical
	if (ADF_mod_ACE3) then { // ACE3 Advanced Medical
		for "_i" from 1 to 10 do {			
			_u addItemToBackpack "ACE_fieldDressing";
			_u addItemToBackpack "ACE_elasticBandage";
			_u addItemToBackpack "ACE_quikclot";
			_u addItemToBackpack "ACE_atropine";				
		};		
		for "_i" from 1 to 7 do {			
			_u addItemToBackpack "ACE_morphine";
			_u addItemToBackpack "ACE_epinephrine";				
			_u addItemToBackpack "ACE_packingBandage";			
		};
		for "_i" from 1 to 4 do {			
			_u addItemToBackpack "ACE_salineIV_500";					
			_u addItemToBackpack "ACE_tourniquet";				
		};
		for "_i" from 1 to 2 do {			
			_u addItemToBackpack "ACE_bloodIV";				
			_u addItemToBackpack "ACE_plasmaIV";
			_u addItemToBackpack "ACE_personalAidKit";
		};
		_u addItemToBackpack "ACE_surgicalKit";
	} else { // Vanilla
		for "_i" from 1 to 10 do {			
			_u addItemToBackpack "FirstAidKit";
		};
		_u addItemToBackpack "Medikit";
	};
	
	[_u, _r] call ADF_loadout_platoon;
};

// Fire Team: Automatic Rifleman (LMG) 
if (_r == "ar") exitWith {
	_u addBackpack "B_Kitbag_cbr";
	_u addGoggles "G_Combat";
	
	for "_i" from 1 to 3 do {_u addMagazine _ADF_INF_priWpnMag_LMG;};
	_u addWeapon _ADF_INF_priWpn_LMG;
	
	[_u, _r] call ADF_loadout_platoon;
};

// Fire Team: Asst Automatic Rifleman (LMG)
if (_r == "aar") exitWith {
	_u addBackpack "B_Kitbag_cbr";
	_u addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 11 do {_u addMagazine _ADF_INF_priWpnMag;};
	_u addWeapon _ADF_INF_priWpn;	
	for "_i" from 1 to 3 do {_u addItemToBackpack _ADF_INF_priWpnMag_LMG;};
	
	[_u, _r] call ADF_loadout_platoon;
};

// Fire Team: Rifleman
if (_r == "r") exitWith {
	_u addBackpack "B_AssaultPack_cbr";
	_u addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 13 do {_u addMagazine _ADF_INF_priWpnMag;};
	_u addWeapon _ADF_INF_priWpn;

	[_u, _r] call ADF_loadout_platoon;

};

// Fire Team: Rifleman AT
if (_r == "rat") exitWith {
	_u addBackpack "B_FieldPack_cbr";
	_u addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 8 do {_u addMagazine _ADF_INF_priWpnMag;};
	_u addWeapon _ADF_INF_priWpn;
	_u addMagazine _ADF_INF_tubeMag_Lite;
	_u addWeapon _ADF_INF_tube_Lite;
	
	[_u, _r] call ADF_loadout_platoon;
};

// Weapons Team: Machine Gunner
if (_r == "mg") exitWith {
	_u addBackpack "B_Kitbag_cbr";
	_u addGoggles "G_Combat";
	
	for "_i" from 1 to 4 do {_u addMagazine _ADF_INF_priWpnMag_MG;};
	_u addWeapon _ADF_INF_priWpn_MG;
	
	if (ADF_mod_CTAB) then {_u addItem "ItemAndroid";};	
	
	[_u, _r] call ADF_loadout_platoon;
};

// Weapons Team: Asst. Machinegunner
if (_r == "amg") exitWith {
	_u addBackpack "B_Carryall_cbr";
	_u addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 8 do {_u addMagazine _ADF_INF_priWpnMag;};
	_u addWeapon _ADF_INF_priWpn_lite;
	_u addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	for "_i" from 1 to 4 do {_u addItemToBackpack _ADF_INF_priWpnMag_MG;};
	
	[_u, _r] call ADF_loadout_platoon;
};

// Weapons Team: Missile Specialist
if (_r == "ms") exitWith {
	_u addBackpack "B_Kitbag_cbr";
	_u addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 5 do {_u addMagazine _ADF_INF_priWpnMag;};
	_u addWeapon _ADF_INF_priWpn_lite;
	_u addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	_u addMagazine _ADF_INF_tubeMag_AT;
	_u addItemToBackpack _ADF_INF_tubeMag_AT;
	_u addWeapon _ADF_INF_tube_AT;
	
	if (ADF_mod_CTAB) then {_u addItem "ItemAndroid";};	
	
	[_u, _r] call ADF_loadout_platoon;
};

// Weapons Team: Asst. Missile Specialist
if (_r == "ams") exitWith {
	_u addBackpack "B_Carryall_cbr";
	_u addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 5 do {_u addMagazine _ADF_INF_priWpnMag;};
	_u addWeapon _ADF_INF_priWpn_lite;
	_u addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	for "_i" from 1 to 2 do {_u addItemToBackpack _ADF_INF_tubeMag_AT;};
	
	[_u, _r] call ADF_loadout_platoon;
};

// Weapons Team: HMG specialist
if (_r == "hmg") exitWith {
	_u addBackpack "B_HMG_01_weapon_F";
	_u addGoggles "G_Combat";
	
	for "_i" from 1 to 5 do {_u addMagazine _ADF_INF_priWpnMag;};
	_u addWeapon _ADF_INF_priWpn_lite;
	_u addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	
	if (ADF_mod_CTAB) then {_u addItem "ItemAndroid";};	
	
	[_u, _r] call ADF_loadout_platoon;
};

// Weapons Team: Asst. HMG specialist
if (_r == "ahmg") exitWith {
	_u addBackpack "B_HMG_01_support_F";
	_u addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 5 do {_u addMagazine _ADF_INF_priWpnMag;};
	_u addWeapon _ADF_INF_priWpn_lite;
	_u addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	
	[_u, _r] call ADF_loadout_platoon;
};