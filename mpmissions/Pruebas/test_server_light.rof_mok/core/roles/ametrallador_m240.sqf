/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

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

for "_i" from 1 to 4 do {_unit addItemToVest "rhsusf_100Rnd_762x51_m62_tracer";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "rhsusf_100Rnd_762x51_m62_tracer";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellBlue";};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
						  Rol por       |ArgA|Maxi|Cbo
*******************************************************************************/