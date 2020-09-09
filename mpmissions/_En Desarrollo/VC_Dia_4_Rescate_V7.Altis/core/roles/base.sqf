/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

params [["_unit", player], "_role", ["_uniform", "arga_u_gen3_bosque_marpat"], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_vest", "arga_c_pesado_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _initialGoggles =  getMissionConfigValue ["GAFAS_INICIALES", ""];

if (!local _unit) exitWith {};

_unit call MANDI_fnc_clearEquipment;

_unit forceAddUniform _uniform;
_unit addVest _vest;

if (! isNil "_role") then {
    [_unit, _helmet, _backPack, _backPackLittle] call compile preprocessFile _role;
};

call compile preprocessFileLineNumbers 'core\roles\uniform.sqf';

if(_initialGoggles != "") then {
    _unit addGoggles _initialGoggles;
};

_unit call MIV_fnc_setInsignia;
/*******************************************************************************
                          Realizadoor |ArgA|Ignacio
*******************************************************************************/