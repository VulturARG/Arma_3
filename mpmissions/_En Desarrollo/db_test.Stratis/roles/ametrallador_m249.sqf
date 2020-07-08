/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_mbosque"], ["_backPack", "arga_m_mbosque_p"], ["_backPackLittle", "arga_m_mbosque_a"]];

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

for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "ACE_EntrenchingTool";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
_unit addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 2 do {_unit addItemToUniform "adv_aceSplint_splint";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote";};
_unit addItemToBackpack "SmokeShellBlue";
for "_i" from 1 to 6 do {_unit addItemToBackpack "rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote";};

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ACE_Altimeter";

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/