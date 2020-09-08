/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
private _enableAutomaticRole = getMissionConfigValue ["ACTIVAR_ROL_AUTOMATICO",  1] == 1;
private _enableAcreSetup     = getMissionConfigValue ["ACTIVAR_SETUP_PERSONALIZADO_RADIOS",  1] == 1;

private _roleList = [];

params ["_playerUnit", "_didJIP"];

waitUntil { time > 0 };

sleep 5;

if (call MIV_fnc_isLogSystemEnabled) then {
    [[_playerUnit]] call MIV_fnc_write_alternative_role;
    [_playerUnit, "connected"] execVM "core\scripts\db\querys\write_log.sqf";
    _playerUnit setVariable ["MANDI_IS_PLAYER", true];
};

if (_enableAutomaticRole || _enableAcreSetup) then {
  _roleList = call MIV_fnc_get_role_list;
};

if (_enableAutomaticRole) then {
  [[_roleList],"core\scripts\set_role.sqf"] remoteExec ["BIS_fnc_execVM", owner _playerUnit, false];
};

if (_enableAcreSetup) then {
  private _role = [_playerUnit, _roleList] call MANDI_fnc_getRole;
  [[_playerUnit,_role],"core\scripts\setup_ACRE2_channels.sqf"] remoteExec ["BIS_fnc_execVM", owner _playerUnit, false]; 
};

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
// ["_enableAutomaticRole:",_enableAutomaticRole] call MIV_fnc_log;
 //["_roleList:",_roleList] call MIV_fnc_log;