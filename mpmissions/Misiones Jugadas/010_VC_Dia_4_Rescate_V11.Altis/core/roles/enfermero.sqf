/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Labrador|Cbo¹
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _useBigBackPack = false;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit setVariable ["ace_medical_medicClass", 2, true];
_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "ACFAA_FAMCA";
_unit addPrimaryWeaponItem "muzzle_snds_b";
_unit addPrimaryWeaponItem "rhsusf_acc_g33_xps3";
_unit addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk319_Mod_0_Mag";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

_unit addItemToVest "ACE_EntrenchingTool";
_unit addItemToVest "ACRE_PRC152";
for "_i" from 1 to 4 do {_unit addItemToVest "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";};
for "_i" from 1 to 4 do {_unit addItemToVest "ACE_20Rnd_762x51_Mk319_Mod_0_Mag";};
for "_i" from 1 to 5 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 1 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};

for "_i" from 1 to 23 do {_unit addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 23 do {_unit addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_tourniquet";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_EarPlugs";};
for "_i" from 1 to 20 do {_unit addItemToBackpack "adv_aceSplint_splint";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_epinephrine";};
_unit addItemToBackpack "ACE_bodyBag";

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Labrador|Cbo¹
*******************************************************************************/