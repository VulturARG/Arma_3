/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params [["_unit", player], "_role", ["_uniform", "arga_u_gen3_bosque_marpat"], ["_helmet", "arga_cas_combate_bosque_marpat"], ["_vest", "arga_c_pesado_bosque_marpat"], ["_backPack", "arga_m_petate_bosque_marpat"], ["_backPackLittle", "arga_m_asalto_bosque_marpat"]];

if (!local _unit) exitWith {};

private _enableAcreSetup     = getMissionConfigValue ["SETUP_PERSONALIZADO_RADIOS",  1] == 1;
private _initialGoggles      = getMissionConfigValue ["GAFAS_INICIALES", ""];
private _rolesNeedingPlatoon = parseSimpleArray getMissionConfigValue ["ROLES_NEEDING_PLATOON", '[]'];
private _enableHALO          = getMissionConfigValue ["HALO",  1] == 1;
private _roleInList          = "";
private _roleWithPlatoon     = _role;
private _scuadLeader = [["lider_escuadra",["lider_escuadra_1","lider_escuadra_2","lider_escuadra_3","lider_escuadra_4","lider_escuadra_5"]],["sublider_escuadra",["sublider_escuadra_1","sublider_escuadra_2","sublider_escuadra_3","sublider_escuadra_4","sublider_escuadra_5"]]];

//["[BASE] Role:",_role] call MIV_fnc_log;
private _roleInList = ( _rolesNeedingPlatoon select {_role isEqualTo _x }) select 0;

if (!isNil "_roleInList") then {
  //["[BASE] roleInList:", _roleInList] call MIV_fnc_log;
  _roleWithPlatoon = [player, _role]call MIV_fnc_addPlatoonToRole;
};

if (_role isEqualTo _roleWithPlatoon) then {
  private _rankRole = (( _scuadLeader select {_role in (_x select 1) } ) select 0) select 0;
  if (!isNil "_rankRole") then {_roleWithPlatoon = _rankRole};  
};

//["[BASE] roleWithPlatoon:",_roleWithPlatoon] call MIV_fnc_log;

_unit call MANDI_fnc_clearEquipment;

_unit forceAddUniform _uniform;
_unit addVest _vest;

if (!isNil "_roleWithPlatoon") then {
  //["[BASE] roleWithPlatoon:",_roleWithPlatoon] call MIV_fnc_log;
  private _rolePath = format ['core\roles\%1.sqf', _roleWithPlatoon];
  [_unit, _helmet, _backPack, _backPackLittle] call compile preprocessFileLineNumbers _rolePath;
};

call compile preprocessFileLineNumbers 'core\roles\uniform.sqf';

if(_initialGoggles != "") then {
    _unit addGoggles _initialGoggles;
};

_unit call MIV_fnc_setInsignia;

if (_enableHALO) then {
  ["core\scripts\halo.sqf"] remoteExec ["BIS_fnc_execVM", owner _unit, false];
};

sleep 5;

if (_enableAcreSetup) then {
  //["[BASE]",_unit,_role] call MIV_fnc_log;
  [[_unit,_role],"core\scripts\setup_ACRE2_channels.sqf"] remoteExec ["BIS_fnc_execVM", owner _unit, false];
};

/*******************************************************************************
                          Realizadoor |ArgA|MIV
*******************************************************************************/