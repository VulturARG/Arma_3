/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
						  Rol por       |ArgA|Rodo|Sdo¹
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _useBigBackPack = true;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

_unit setVariable ["ACE_IsEngineer", 1, true];
_unit setVariable ["ACE_isEOD", true, true];
//_unit addBackpack _back;
_unit addBackpack "acfaa_Carryall_multicam";
_unit addHeadgear _helmet;

_unit addWeapon "ACFAA_FNFAL_PARA";
_unit addPrimaryWeaponItem "acfaa_fnfal_silencer";
_unit addPrimaryWeaponItem "rhsusf_acc_su230a";
_unit addPrimaryWeaponItem "acfaa_20Rndfal_762x51";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

_unit addWeapon "Rangefinder";

removeVest _unit;
_unit addVest "V_PlateCarrierIAGL_oli";

_unit addItemToVest "ACE_EntrenchingTool";
_unit addItemToVest "MineDetector";
_unit addItemToVest "ACE_M26_Clacker";
_unit addItemToVest "ACE_DefusalKit";
for "_i" from 1 to 4 do {_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_blue";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk3a2";};
_unit addItemToVest "acfaa_20Rndfal_762x51";
_unit addItemToBackpack "ACE_wirecutter";
_unit addItemToBackpack "ToolKit";
for "_i" from 1 to 4 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
for "_i" from 1 to 7 do {_unit addItemToBackpack "acfaa_20Rndfal_762x51";};
_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
						  Rol por       |ArgA|Rodo|Sdo¹
*******************************************************************************/