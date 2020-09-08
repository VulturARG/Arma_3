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

_unit addWeapon "rhs_weap_mk18_bk";
_unit addPrimaryWeaponItem "rhsusf_acc_g33_xps3";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

//_unit addItemToVest "ACE_DAGR";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";};
for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "ACE_20Rnd_762x51_Mk319_Mod_0_Mag";};
for "_i" from 1 to 9 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addItemToBackpack "ACE_EntrenchingTool";

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
                          Rol por       |ArgA|Vultur|Cbo¹
*******************************************************************************/