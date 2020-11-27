/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Veck|Cbo¹
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

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

_unit addItemToVest "ACE_SpraypaintRed";
_unit addItemToVest "ACE_EntrenchingTool";
_unit addItemToVest "ACRE_PRC152";
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

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Veck|Cbo¹
*******************************************************************************/