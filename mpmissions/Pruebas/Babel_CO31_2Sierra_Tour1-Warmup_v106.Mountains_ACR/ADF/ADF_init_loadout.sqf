/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Mission init - Client Loadout
Author: Whiztler
Script version: 5.64

File: ADF_init_loadout.sqf
**********************************************************************************
NOTE: Gear loads on actual players only. Does not load on AI's!!
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt || time < 180) then {diag_log "ADF RPT: Init - executing: ADF_init_loadout.sqf"};

// Dedicated server and no-loadout selected exits
If (IsDedicated || !(local player)) exitWith {}; // 5.43

// Two Sierra campaign players exit
if (ADF_clanName == "TWO SIERRA") exitWith {player execVM "mission\loadout\units\ADF_fnc_Loadout_2S.sqf";};

// Init
params [
	["_ADF_noLoadout", false, [true]],
	["_ADF_customLoadout_MOD", false, [true]],
	"_ADF_uniform_inf",
	"_ADF_uniform_sor",
	["_ADF_NVGoggles", true, [true]],
	["_ADF_GPS",  false, [true]],
	["_ADF_INF_assault_weapon", 1, [0]],
	["_ADF_INF_LMG_weapon", 1, [0]],
	["_ADF_INF_hand_weapon", 1, [0]],
	["_ADF_INF_scopes", false, [false]],
	["_ADF_SOR_assault_weapon", 1, [0]],
	["_ADF_SOR_hand_weapon", 1, [0]],
	["_ADF_CAV_assault_weapon", 1, [0]],
	["_ADF_TFAR_PersonalRadio", "tf_rf7800str", [""]],
	["_ADF_TFAR_SWRadio", "tf_anprc152", [""]],
	["_ADF_TFAR_LRRadio", "tf_rt1523g_big", [""]],
	["_ADF_TFAR_LRRadioSOR", "tf_rt1523g_black", [""]],
	["_ADF_ACE3_microDAGR_all", false, [true]],
	["_ADF_ACE3_microDAGR_leaders", false, [true]],
	["_ADF_cTAB_microDAGR_all", false, [true]],
	["_ADF_cTAB_microDAGR_leaders", false, [true]]
];
private _ADF_unit 			= player;

// Set vars
tf_no_auto_long_range_radio 	= true;
ADF_SOR_MK20 					= false;
ADF_SOR_MXC 					= false;
ADF_SOR_MX 					= false;

// No loadout selected exits now.
if (_ADF_noLoadout) exitWith {
	diag_log "ADF RPT: Init - Loadout - noLoadout option selected. Exiting loadout client.";
	ADF_gearLoaded = true; 
	publicVariableServer "ADF_gearLoaded";
};


//////////////////////////// BLUFOR CUSTOM LOADOUT

if ((faction _ADF_unit == "BLU_F") && _ADF_customLoadout_MOD) exitWith {

	call compile preprocessFileLineNumbers "mission\loadout\units\ADF_fnc_Loadout_West.sqf";
				
	// Check if the player is a ADF unit
	private _ADF_unitCheck = toLower str (vehicle _ADF_unit);
	_ADF_unitCheck = toArray _ADF_unitCheck;
	_ADF_unitCheck resize 3;
	if (
		(toString _ADF_unitCheck != "inf") &&
		(toString _ADF_unitCheck != "sor") &&
		(toString _ADF_unitCheck != "sod") &&
		(toString _ADF_unitCheck != "sop") &&	
		(toString _ADF_unitCheck != "cav") &&
		(toString _ADF_unitCheck != "air") &&
		(toString _ADF_unitCheck != "dev")
	) exitWith {
		// Undefined unit > load standard infantry gear
		[_ADF_unit] call ADF_fnc_loadoutNotDef; 
	}; 
	
	// Split the player variable into Squad, Role
	private _ADF_unitString = str _ADF_unit;
	private _u = _ADF_unitString splitString "_";
	private _s = toLower (_u select 0);
	private _r = toLower (_u select 1);
	
	// Strip the unit of vanilla loadout 
	[_ADF_unit,true] call ADF_fnc_stripUnit;	
	
	// Add default loadout
	_ADF_unit linkItem "ItemMap";
	_ADF_unit linkItem "ItemWatch";
	_ADF_unit linkItem "ItemCompass";
	if (_ADF_NVGoggles) then {_ADF_unit addWeapon "NVGoggles"};	
	
	// MicroDAGR config
	if ((_ADF_cTAB_microDAGR_all || _ADF_cTAB_microDAGR_leaders) && ADF_mod_CTAB) then {
		ADF_microDAGR = "itemMicroDagr";
		if (_ADF_cTAB_microDAGR_all) then {ADF_microDAGR_all = 1} else {ADF_microDAGR_all = 2};
	};
	// ACE3 prevails when both CtAB and ACE3 DAGR are selected
	if ((_ADF_ACE3_microDAGR_all || _ADF_ACE3_microDAGR_leaders) && ADF_mod_ACE3) then { 
		ADF_microDAGR = "ACE_microDAGR";
		if (_ADF_ACE3_microDAGR_all) then {ADF_microDAGR_all = 1} else {ADF_microDAGR_all = 2};
	};
	if (!_ADF_cTAB_microDAGR_all && !_ADF_cTAB_microDAGR_leaders && !_ADF_ACE3_microDAGR_all && !_ADF_ACE3_microDAGR_leaders) then { // 140B06
		ADF_microDAGR = "Chemlight_green"; // No microDAGR wanted, replaced with green chemlight
	};
	
	// set identity
	if (isMultiplayer && ADF_mod_ACE3) then {_ADF_unit setSpeaker "ACE_NoVoice";};
	
	// SOR uniform texture update
	if (_s == "sor") then {
		[_ADF_unit] spawn {
			params ["_ADF_unit"];
			_ADF_unit setVariable ["BIS_enableRandomization",false];
			waitUntil {time > 10};
			
			// Add Uniform EH
			player addEventHandler ["Take", {
				(getObjectTextures player + [uniformContainer player getVariable "texture"]) params ["_texUniform", "_texInsignia", "_texCustom"];
				if (isNil "_texCustom") exitWith {};
				if (_texUniform == _texCustom) exitWith {};
				player setObjectTextureGlobal [0, _texCustom];
				if (ADF_Clan_uniformInsignia) then {[player,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
				false
			}];

			// Set local Texture
			_ADF_texture =  "\A3\Characters_F\Common\Data\basicbody_black_co.paa";
			player setObjectTextureGlobal [0, _ADF_texture]; 
			uniformContainer player setVariable ["texture", _ADF_texture, true];
		};
	};
	
	// Load the appropriate Squad/Role gear											
	if (_s == "inf") exitWith {[_s, _r] call ADF_fnc_loudoutInf}; // Infantry Platoon
	if (_s == "cav") exitWith {[_s, _r] call ADF_fnc_loadoutCav}; // Cavalry Battery
	if (_s == "air") exitWith {[_s, _r] call ADF_fnc_loadoutAir}; // Air wing
	if (_s == "sor") exitWith {[_s, _r] call ADF_fnc_loadoutSor}; // SpecOp/Recon Squadron
	if (_s == "sod") exitWith {[_s, _r] call ADF_fnc_loadoutSod}; // Divers
	if (_s == "sop") exitWith {[_s, _r] call ADF_fnc_loadoutSop}; // Snipers/JTAC
	if (_s == "dev") exitWith {								 // Mission Developer
		_ADF_unit addVest "V_Rangemaster_belt";
		_ADF_unit unassignItem "NVGoggles";
		_ADF_unit addWeapon "LaserDesignator";
		_ADF_unit addMagazine "LaserBatteries";
		_ADF_unit allowDamage false;
		_ADF_unit addBackpack "B_OutdoorPack_blu"; 
		if (ADF_mod_ACE3) then {_ADF_unit addItemToBackpack "ACE_microDAGR"};
		if (ADF_mod_CTAB) then {_ADF_unit addItemToBackpack "ItemcTab"};

	};
}; // close _ADF_customLoadout_MOD


//////////////////////////// BLUFOR BIS VANILLA LOADOUT

if ((faction player == "BLU_F") && !(_ADF_customLoadout_MOD)) exitWith { // BLUFOR: Custom loadout = false
	private _ADF_unitString = str _ADF_unit;
	private _u = _ADF_unitString splitString "_";
	private _s = toLower (_u select 0);
	private _r = toLower (_u select 1);
	// Default equip (additional to Vanilla)
	if (ADF_mod_CTAB && (side player == ADF_playerSide)) then {_ADF_unit addItemToVest "ItemcTabHCam"};

	if (ADF_mod_ACE3) then { // ACE3 items added by default
		_ADF_unit addItemToVest "ACE_EarPlugs";
		_ADF_unit addItemToVest "ACE_CableTie";
		_ADF_unit addItemToVest "ace_mapTools";
		_ADF_unit addItemToVest "ACE_IR_Strobe_Item";
	};

	// Add additional radios for leaders & RTO's
	if (ADF_mod_TFAR && (_r == "rto")) then {
		_ADF_unit addItemToVest _ADF_TFAR_SWRadio;
		_ADF_unit addBackpack _ADF_TFAR_LRRadio;
	};
	
	// Add cTAB equipment to leadership units
	if (ADF_mod_CTAB && (_r == "xo")) then {_ADF_unit addItemToVest "itemcTab"};
	if (ADF_mod_CTAB && ((_r == "sql") || (_r == "ftl") || (_r == "atl") || (_r == "rtl") || (_r == "vc") || (_r == "p") || (_r == "hp") || (_r == "sp") || (_r == "jtc") || (_r == "wtl"))) then {_ADF_unit addItemToVest "itemAndroid"};
};