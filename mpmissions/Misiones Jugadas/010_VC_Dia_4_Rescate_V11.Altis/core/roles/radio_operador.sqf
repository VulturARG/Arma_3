/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Rick|Sdo
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _useBigBackPack = true;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "ACFAA_FAMA_base";
_unit addPrimaryWeaponItem "acfaa_fnfal_silencer";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
_unit addPrimaryWeaponItem "acfaa_20Rndfal_762x51";
_unit addWeapon "rhsusf_weap_m9";
_unit addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";

_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator_03";

_unit addItemToVest "ACRE_PRC152";
for "_i" from 1 to 4 do {_unit addItemToVest "acfaa_20Rndfal_762x51";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_20Rnd_762x51_M993_AP_Mag";};
_unit addItemToVest "B_IR_Grenade";
for "_i" from 1 to 6 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};

_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "ACRE_PRC117F";
for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_10Rnd_762x51_Mk319_Mod_0_Mag";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "acfaa_20Rndfal_762x51_T";};
_unit addItemToBackpack "Laserbatteries";

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Rick|Sdo
*******************************************************************************/