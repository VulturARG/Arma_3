/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Ignacio
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_mbosque"], ["_backPack", "arga_m_mbosque_p"], ["_backPackLittle", "arga_m_mbosque_a"]];

private _useBigBackPack = false;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "ACFAA_FNFAL_PARA";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
_unit addPrimaryWeaponItem "acfaa_20Rndfal_762x51";
_unit addWeapon "rhsusf_weap_m9";
_unit addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";

for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
for "_i" from 1 to 2 do {_unit addItemToUniform "adv_aceSplint_splint";};
for "_i" from 1 to 7 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_EntrenchingTool";
_unit addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_elasticBandage";};
_unit addItemToUniform "ACE_Flashlight_XL50";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

for "_i" from 1 to 7 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m993_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
for "_i" from 1 to 9 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m993_Mag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "SmokeShellBlue";};

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ACE_Altimeter";


/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Ignacio
*******************************************************************************/
