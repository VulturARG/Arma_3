/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Vultur|Cbo¹
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_mbosque"], ["_backPack", "arga_m_mbosque_p"], ["_backPackLittle", "arga_m_mbosque_a"]];

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

for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_EntrenchingTool";
_unit addItemToUniform "ACE_Flashlight_XL50";
_unit addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToVest "ACE_HuntIR_monitor";
for "_i" from 1 to 6 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_M84";};
_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 9 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_HuntIR_M203";};
for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
for "_i" from 1 to 42 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
_unit addHeadgear "arga_cas_mbosque";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ACE_Altimeter";
_unit linkItem "ACE_NVG_Wide";

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Vultur|Cbo¹
*******************************************************************************/