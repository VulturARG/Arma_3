/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _useBigBackPack = false;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};
_helmet = "arga_cas_helicoptero_abierto";

if (!local _unit) exitWith {};

_unit setVariable ["ACE_GForceCoef",0.4];
_unit addBackpack _back;
_unit addHeadgear _helmet;
removeUniform _unit;
_unit forceAddUniform "arga_u_coverall_verde_liso";

_unit addWeapon "acfaa_mp5sd_base";
_unit addPrimaryWeaponItem "acfaa_32Rnd_9x19_FMJ_Mag";
_unit addWeapon "rhsusf_weap_m9";
_unit addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";
_unit addItemToVest "ACE_microDAGR";
_unit addItemToVest "ACE_MapTools";
_unit addItemToVest "ACRE_PRC152";
for "_i" from 1 to 5 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
_unit addItemToBackpack "ACRE_PRC117F";
_unit addItemToBackpack "arga_h_norm";
_unit addItemToBackpack "arga_ca_bomber";

_unit linkItem "tf_microdagr";
_unit linkItem "ACE_NVG_Wide";

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/