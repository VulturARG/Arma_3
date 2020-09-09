/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Ignacio
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _useBigBackPack = true;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "rhs_weap_sr25_ec";
_unit addPrimaryWeaponItem "muzzle_snds_B";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
_unit addPrimaryWeaponItem "rhsusf_acc_premier_low";
_unit addPrimaryWeaponItem "rhsusf_20Rnd_762x51_SR25_m993_Mag";
_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_acc_omega9k";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

_unit addWeapon "ACE_Vector";

for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
for "_i" from 1 to 7 do {_unit addItemToVest "rhsusf_20Rnd_762x51_SR25_m62_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
_unit addItemToBackpack "rhsusf_acc_ACOG_RMR_3d";
_unit addItemToBackpack "Laserdesignator";
for "_i" from 1 to 10 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_SR25_m62_Mag";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_SR25_m993_Mag";};
_unit addItemToBackpack "Laserbatteries";

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Ignacio
*******************************************************************************/