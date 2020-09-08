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

_unit addWeapon "ACFAA_FAMTD_CL";
_unit addPrimaryWeaponItem "muzzle_snds_B";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "rhsusf_acc_premier_low";
_unit addPrimaryWeaponItem "acfaa_20Rndfal_762x51";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_acc_omega9k";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

_unit addWeapon "ACE_Vector";

for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 4 do {_unit addItemToVest "acfaa_20Rndfal_762x51_T";};
for "_i" from 1 to 3 do {_unit addItemToVest "acfaa_20Rndfal_762x51";};
_unit addItemToBackpack "rhsusf_acc_ACOG_RMR_3d";
_unit addItemToBackpack "ACE_SpottingScope";
_unit addItemToBackpack "ACE_Tripod";
_unit addItemToBackpack "Laserdesignator";
_unit addItemToBackpack "Laserbatteries";
_unit addItemToBackpack "ACE_SpareBarrel";
for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_20Rnd_762x51_Mag_Tracer";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "acfaa_20Rndfal_762x51_T";};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Ignacio
*******************************************************************************/