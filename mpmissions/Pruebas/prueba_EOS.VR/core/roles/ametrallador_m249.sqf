/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _useBigBackPack = true;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "rhs_weap_m249_pip_S_vfg3";
_unit addPrimaryWeaponItem "rhsusf_acc_SF3P556";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
_unit addPrimaryWeaponItem "rhsusf_200Rnd_556x45_box";
_unit addPrimaryWeaponItem "rhsusf_acc_kac_grip_saw_bipod";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "9Rnd_45ACP_Mag";

for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote";};
_unit addItemToBackpack "SmokeShellBlue";
for "_i" from 1 to 6 do {_unit addItemToBackpack "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote";};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/