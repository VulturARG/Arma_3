/*******************************************************************************
                          Realizado por MIV
						  Rol por       |ArgA|Vultur
*******************************************************************************/

params [["_unit", player], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _useBigBackPack = false;
private _back = if (_useBigBackPack) then {_backPack} else {_backPackLittle};

if (!local _unit) exitWith {};

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit forceAddUniform "U_C_ConstructionCoverall_Red_F";
_unit addHeadgear "rhs_xmas_antlers";

/*******************************************************************************
                          Realizado por MIV
						  Rol por       |ArgA|Vultur
*******************************************************************************/
