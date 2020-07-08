/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Rick|Sdo
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_mbosque"], ["_backPack", "arga_m_mbosque_p"], ["_backPackLittle", "arga_m_mbosque_a"]];

private _useBigBackPack = false;
private _back = "tf_rt1523g_black";

if (!local _unit) exitWith {};

_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "ACFAA_FAMA_base";
_unit addPrimaryWeaponItem "acfaa_fnfal_silencer";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
_unit addPrimaryWeaponItem "acfaa_20Rndfal_762x51";
_unit addWeapon "rhsusf_weap_m9";
_unit addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";

_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator_03";

for "_i" from 1 to 7 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 7 do {_unit addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_EntrenchingTool";
_unit addItemToUniform "ACE_MapTools";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_IR_Strobe_Item";};
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_Flashlight_MX991";
for "_i" from 1 to 2 do {_unit addItemToUniform "adv_aceSplint_splint";};
for "_i" from 1 to 4 do {_unit addItemToVest "acfaa_20Rndfal_762x51";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_20Rnd_762x51_M993_AP_Mag";};
_unit addItemToVest "acfaa_20Rndfal_762x51_T";
_unit addItemToVest "B_IR_Grenade";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
_unit addItemToBackpack "Laserbatteries";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ACE_Altimeter";
//_unit linkItem "tf_anprc152_1";

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Rick|Sdo
*******************************************************************************/