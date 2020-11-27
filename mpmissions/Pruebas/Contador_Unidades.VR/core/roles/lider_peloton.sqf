/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
                          Rol por       |ArgA|Vultur|Cbo¹
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _useBigBackPack = true;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "ACFAA_FAMCA";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR_3d";
_unit addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator_01_khk_F";

//_unit addItemToVest "ACE_DAGR";
_unit addItemToVest "ACRE_PRC152";
_unit addItemToVest "HandGrenade";
_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
for "_i" from 1 to 7 do {_unit addItemToVest "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";};
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};

_unit addItemToBackpack "ACRE_PRC117F";
for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_20Rnd_762x51_Mk319_Mod_0_Mag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";};
_unit linkItem "ACE_NVG_Wide";

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
                          Rol por       |ArgA|Vultur|Cbo¹
*******************************************************************************/