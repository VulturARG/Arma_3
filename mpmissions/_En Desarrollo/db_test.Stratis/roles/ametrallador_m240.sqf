/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_mbosque"], ["_backPack", "arga_m_mbosque_p"], ["_backPackLittle", "arga_m_mbosque_a"]];

private _useBigBackPack = true;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "rhs_weap_m240B";
_unit addPrimaryWeaponItem "rhsusf_acc_ARDEC_M240";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_MDO";
_unit addPrimaryWeaponItem "rhsusf_100Rnd_762x51";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_epinephrine";};
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "ACE_EntrenchingTool";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 2 do {_unit addItemToUniform "adv_aceSplint_splint";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_elasticBandage";};
_unit addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 4 do {_unit addItemToVest "rhsusf_100Rnd_762x51_m62_tracer";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_100Rnd_762x51_m62_tracer";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellBlue";};

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ACE_Altimeter";

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/