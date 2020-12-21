/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
                          Rol por       |ArgA|JuanMa|Sto¹
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _useBigBackPack = true;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "arifle_SPAR_02_blk_F";
_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
_unit addPrimaryWeaponItem "rhsusf_acc_su230";
_unit addPrimaryWeaponItem "ACE_30Rnd_556x45_Stanag_M995_AP_mag";
_unit addPrimaryWeaponItem "bipod_01_F_blk";
_unit addWeapon "rhs_weap_M136_hedp";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

_unit addWeapon "ACE_Vector";

//_unit addItemToVest "ACE_microDAGR";
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_epinephrine";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
_unit addItemToVest "ACE_Cellphone";
_unit addItemToVest "ACRE_PRC152";
for "_i" from 1 to 7 do {_unit addItemToVest "30Rnd_556x45_Stanag_red";};
for "_i" from 1 to 7 do {_unit addItemToVest "ACE_30Rnd_556x45_Stanag_M995_AP_mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
_unit addItemToBackpack "ACE_EntrenchingTool";
_unit addItemToBackpack "rhs_tr8_periscope";
for "_i" from 1 to 6 do {_unit addItemToBackpack "SmokeShellBlue";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "ACE_M84";};
_unit addItemToBackpack "Chemlight_blue";
for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_30Rnd_556x45_Stanag_M995_AP_mag";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
for "_i" from 1 to 5 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_red";};
_unit addItemToBackpack "ACE_HandFlare_White";
for "_i" from 1 to 2 do {_unit addItemToBackpack "IEDUrbanSmall_Remote_Mag";};
_unit addItemToBackpack "IEDLandSmall_Remote_Mag";

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
                          Rol por       |ArgA|JuanMa|Sto¹
*******************************************************************************/