/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params ["_playerUnit", "_didJIP"];

["*************** Antes del waitUntil Player ***************"] call BIS_fnc_logFormat;

waitUntil { time > 0 };

["*************** Despues del waitUntil Player ***************"] call BIS_fnc_logFormat;

sleep 5;

if (isDedicated) then {
    [[_playerUnit]] call compile preprocessFileLineNumbers "scripts\db\querys\write_alternative_role.sqf";
    [_playerUnit, "connected"] execVM "scripts\db\querys\write_log.sqf";

    _playerUnit addEventHandler ["Killed", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        [_unit, "killed"] execVM "scripts\db\querys\write_log.sqf";
    }];

    _playerUnit addEventHandler ["Respawn", {
        params ["_unit", "_corpse"];
        [_unit, "respawn"] execVM "scripts\db\querys\write_log.sqf";
    }];
};

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/