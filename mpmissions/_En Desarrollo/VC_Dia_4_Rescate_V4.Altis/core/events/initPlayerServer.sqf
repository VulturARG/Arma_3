/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
private _enableAutomaticRole = getMissionConfigValue ["ACTIVAR_ROL_AUTOMATICO",  1] == 1;

params ["_playerUnit", "_didJIP"];

waitUntil { time > 0 };

sleep 5;

if (call MIV_fnc_isLogSystemEnabled) then {
    [[_playerUnit]] call MIV_fnc_write_alternative_role;
    [_playerUnit, "connected"] execVM "core\scripts\db\querys\write_log.sqf";
    _playerUnit setVariable ["MANDI_IS_PLAYER", true];
};

if ((_enableAutomaticRole)) then {
  execVM "core\scripts\set_role.sqf"
};

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/