/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
                          Rol por       |ArgA|Vultur|Cbo¹
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_mbosque"], ["_backPack", "arga_m_mbosque_p"], ["_backPackLittle", "arga_m_mbosque_a"]];

private _useBigBackPack = true;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "ACFAA_FAMCA";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR_3d";
_unit addPrimaryWeaponItem "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator_01_khk_F";

for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_elasticBandage";};
_unit addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_EntrenchingTool";
for "_i" from 1 to 3 do {_unit addItemToUniform "adv_aceSplint_splint";};
_unit addItemToUniform "ACE_Flashlight_XL50";
_unit addItemToUniform "ACE_MapTools";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToVest "ACE_DAGR";
for "_i" from 1 to 7 do {_unit addItemToVest "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";};
_unit addItemToVest "HandGrenade";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellBlue";};
_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_20Rnd_762x51_Mk319_Mod_0_Mag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_20Rnd_762x51_Mk316_Mod_0_Mag";};

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ACE_NVG_Wide";

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
                          Rol por       |ArgA|Vultur|Cbo¹
*******************************************************************************/