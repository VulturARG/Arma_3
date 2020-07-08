/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Veck|Cbo¹
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_mbosque"], ["_backPack", "arga_m_mbosque_p"], ["_backPackLittle", "arga_m_mbosque_a"]];

private _useBigBackPack = true;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit setVariable ["ACE_IsEngineer", 1, true];
_unit setVariable ["ACE_isEOD", true, true];
_unit addBackpack _back;
_unit addHeadgear _helmet;

_unit addWeapon "ACFAA_FNFAL_PARA";
_unit addPrimaryWeaponItem "acfaa_fnfal_silencer";
_unit addPrimaryWeaponItem "rhsusf_acc_su230";
_unit addPrimaryWeaponItem "20Rnd_762x51_Mag";
_unit addWeapon "ACE_VMH3";

_unit addMagazine "Laserbatteries";
_unit addWeapon "Laserdesignator_02";

for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_EntrenchingTool";
_unit addItemToUniform "ACE_MapTools";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 2 do {_unit addItemToUniform "adv_aceSplint_splint";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "ACE_M26_Clacker";
_unit addItemToVest "MineDetector";
_unit addItemToVest "ACE_SpraypaintRed";
for "_i" from 1 to 4 do {_unit addItemToVest "ACE_20Rnd_762x51_M993_AP_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {_unit addItemToVest "20Rnd_762x51_Mag";};
_unit addItemToBackpack "ToolKit";
_unit addItemToBackpack "ACE_wirecutter";
_unit addItemToBackpack "ACE_M26_Clacker";
_unit addItemToBackpack "MineDetector";
_unit addItemToBackpack "ACE_DefusalKit";
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addItemToBackpack "SatchelCharge_Remote_Mag";
_unit addItemToBackpack "APERSMineDispenser_Mag";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Veck|Cbo¹
*******************************************************************************/