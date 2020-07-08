/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];
    [[_uid, _name, _unit], "disconnected"] execVM "scripts\db\querys\write_log.sqf";
    true;
}];

addMissionEventHandler ["MPEnded", {
    "mission_end" execVM "scripts\db\querys\write_mission_state.sqf";
}];

["*************** Antes del waitUntil Server ***************"] call BIS_fnc_logFormat;

waitUntil { time > 0 };

["*************** Despues del waitUntil Server ***************"] call BIS_fnc_logFormat;

"mission_begin" execVM "scripts\db\querys\write_mission_state.sqf";

sleep 60;

execVM "scripts\db\querys\write_alternative_role.sqf";

sleep 60;

execVM "scripts\db\cron.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/