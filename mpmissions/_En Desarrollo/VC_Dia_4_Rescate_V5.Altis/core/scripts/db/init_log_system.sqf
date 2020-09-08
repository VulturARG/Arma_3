/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

execVM "core\scripts\db\spawn_fnc.sqf";

if (!(call MIV_fnc_isLogSystemEnabled)) exitWith { };

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];
    [[[_uid, _name, _unit]], "disconnected"] execVM "core\scripts\db\querys\write_log.sqf";
    // _unit enableSimulationGlobal false;
    // _unit hideObjectGlobal true;
    true;
}];

addMissionEventHandler ["MPEnded", {
    "mission_end" execVM "core\scripts\db\querys\write_mission_state.sqf";
}];

waitUntil { time > 0 };

"mission_begin" execVM "core\scripts\db\querys\write_mission_state.sqf";

sleep 60;

execVM "core\scripts\db\querys\write_alternative_role.sqf";

sleep 60;

execVM "core\scripts\db\cron.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/