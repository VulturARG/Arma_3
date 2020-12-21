/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params ["_playerUnit", "_didJIP"];

private _enableAutomaticRole = getMissionConfigValue ["ROL_AUTOMATICO",  1] == 1;
private _enableAcreSetup     = getMissionConfigValue ["SETUP_PERSONALIZADO_RADIOS",  1] == 1;
private _functionWasCalled   = [_playerUnit,"core\scripts\set_role.sqf"] call MIV_fnc_wasFuntionCalled;

waitUntil { time > 5 };

if (call MIV_fnc_isLogSystemEnabled) then {
    [[_playerUnit]] call MIV_fnc_write_alternative_role;
    [_playerUnit, "connected"] execVM "core\scripts\db\querys\write_log.sqf";
    _playerUnit setVariable ["MANDI_IS_PLAYER", true];
};

if (!_functionWasCalled) then {
  if (_enableAutomaticRole) then {
    private _roleList = call MIV_fnc_get_role_list;
    [[_roleList],"core\scripts\set_role.sqf"] remoteExec ["BIS_fnc_execVM", owner _playerUnit, false];
    [_playerUnit,"core\scripts\set_role.sqf"] call MIV_fnc_setFuntionCalled;
  };
};

if (_enableAcreSetup) then {
  [_playerUnit] execVM "core\scripts\init_ACRE2_channels.sqf";
};

execVM "core\scripts\check_template_version.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/