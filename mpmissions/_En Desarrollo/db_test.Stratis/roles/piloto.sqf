/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_mbosque"], ["_backPack", "arga_m_mbosque_p"], ["_backPackLittle", "arga_m_mbosque_a"]];

private _useBigBackPack = false;
private _back = "tf_rt1523g_black";
_helmet = "arga_bo_pilot";

if (!local _unit) exitWith {};

_unit setVariable ["ACE_GForceCoef",0.4];
_unit addBackpack _back;
_unit addHeadgear _helmet;
removeUniform _unit;
_unit forceAddUniform "arga_u_piloto";

_unit addWeapon "acfaa_mp5sd_base";
_unit addPrimaryWeaponItem "acfaa_32Rnd_9x19_FMJ_Mag";
_unit addWeapon "rhsusf_weap_m9";
_unit addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";

for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 2 do {_unit addItemToUniform "adv_aceSplint_splint";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToVest "ACE_DAGR";
_unit addItemToVest "ACE_microDAGR";
_unit addItemToVest "ACE_MapTools";
_unit addItemToVest "ACE_Flashlight_XL50";
for "_i" from 1 to 5 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
_unit addItemToBackpack "arga_h_norm";
_unit addItemToBackpack "arga_ca_bomber";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "tf_microdagr";
_unit linkItem "tf_anprc148jem_1";

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/