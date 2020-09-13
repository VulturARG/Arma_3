/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

params [["_unit", player], "_role", ["_uniform", "arga_u_gen3_bosque_marpat"], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_vest", "arga_c_pesado_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

private _enableAcreSetup = getMissionConfigValue ["ACTIVAR_SETUP_PERSONALIZADO_RADIOS",  1] == 1;
private _initialGoggles =  getMissionConfigValue ["GAFAS_INICIALES", ""];

if (!local _unit) exitWith {};

_unit call MANDI_fnc_clearEquipment;

_unit forceAddUniform _uniform;
_unit addVest _vest;

if (!isNil "_role") then {
  private _rolePath = format ['core\roles\%1.sqf', _role];
  [_unit, _helmet, _backPack, _backPackLittle] call compile preprocessFileLineNumbers _rolePath;
};

call compile preprocessFileLineNumbers 'core\roles\uniform.sqf';

if(_initialGoggles != "") then {
    _unit addGoggles _initialGoggles;
};

_unit call MIV_fnc_setInsignia;

sleep 5;

if (_enableAcreSetup) then {
  ["Base",_unit,_role] call MIV_fnc_log;
  [[_unit,_role],"core\scripts\setup_ACRE2_channels.sqf"] remoteExec ["BIS_fnc_execVM", owner _unit, false];
};

/*******************************************************************************
                          Realizadoor |ArgA|Ignacio
*******************************************************************************/