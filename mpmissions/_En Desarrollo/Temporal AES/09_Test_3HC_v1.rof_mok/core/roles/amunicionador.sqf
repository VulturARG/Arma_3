/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Axel|Cbo
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _useBigBackPack = true;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "rhs_weap_hk416d145";
_unit addPrimaryWeaponItem "rhsusf_acc_SF3P556";
_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds";
_unit addPrimaryWeaponItem "150Rnd_556x45_Drum_Mag_F";
_unit addPrimaryWeaponItem "rhsusf_acc_grip1";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

_unit addItemToVest "ACE_SpareBarrel";
for "_i" from 1 to 8 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";};
_unit addItemToVest "150Rnd_556x45_Drum_Mag_F";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_100Rnd_556x45_M855A1_cmag";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_200rnd_556x45_mixed_box";};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Axel|Cbo
*******************************************************************************/