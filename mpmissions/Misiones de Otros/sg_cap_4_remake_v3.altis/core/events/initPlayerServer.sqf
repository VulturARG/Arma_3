/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
private _enableAutomaticRole = getMissionConfigValue ["ACTIVAR_ROL_AUTOMATICO",  1] == 1;
private _enableAcreSetup     = getMissionConfigValue ["ACTIVAR_SETUP_PERSONALIZADO_RADIOS",  1] == 1;

params ["_playerUnit", "_didJIP"];

waitUntil { time > 5 };

//sleep 5;

if (call MIV_fnc_isLogSystemEnabled) then {
    [[_playerUnit]] call MIV_fnc_write_alternative_role;
    [_playerUnit, "connected"] execVM "core\scripts\db\querys\write_log.sqf";
    _playerUnit setVariable ["MANDI_IS_PLAYER", true];
};

if (_enableAutomaticRole) then {
  private _roleList = call MIV_fnc_get_role_list;
  [[_roleList],"core\scripts\set_role.sqf"] remoteExec ["BIS_fnc_execVM", owner _playerUnit, false];
};

if (_enableAcreSetup) then {
  [_playerUnit] execVM "core\scripts\init_ACRE2_channels.sqf";
};

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
// ["_enableAutomaticRole:",_enableAutomaticRole] call MIV_fnc_log;
 //["_roleList:",_roleList] call MIV_fnc_log;