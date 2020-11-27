/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Vultur|Cbo¹
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _useBigBackPack = true;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "rhs_weap_hk416d145_m320";
_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR_3d";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
_unit addPrimaryWeaponItem "1Rnd_HE_Grenade_shell";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

_unit addWeapon "Rangefinder";
_unit addItemToVest "ACE_HuntIR_monitor";
_unit addItemToVest "ACRE_PRC152";
_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
for "_i" from 1 to 6 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 7 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HuntIR_M203";};
for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
for "_i" from 1 to 29 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_M397_HET";};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Vultur|Cbo¹
*******************************************************************************/