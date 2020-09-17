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

_unit addWeapon "rhs_weap_M107_d";
_unit addPrimaryWeaponItem "rhsusf_mag_10Rnd_STD_50BMG_mk211";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_acc_omega9k";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator_03";

_unit addItemToVest "MineDetector";
_unit addItemToVest "ACE_Kestrel4500";
_unit addItemToVest "ACE_ATragMX";
//_unit addItemToVest "ACE_DAGR";
for "_i" from 1 to 5 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 4 do {_unit addItemToVest "ACE_5Rnd_127x99_AMAX_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HandFlare_White";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
_unit addItemToBackpack "rhsusf_acc_premier_anpvs27";
_unit addItemToBackpack "rhsusf_acc_ACOG_RMR_3d";
_unit addItemToBackpack "rhsusf_acc_M8541";
_unit addItemToBackpack "ACE_Vector";
for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_5Rnd_127x99_AMAX_Mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_Chemlight_HiBlue";};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Ignacio
*******************************************************************************/