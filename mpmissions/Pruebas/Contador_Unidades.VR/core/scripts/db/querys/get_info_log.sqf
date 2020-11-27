/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params ["_uid"];

if (!(call MIV_fnc_isLogSystemEnabled)) exitWith { };

private _query = "SELECT id, createdAt from `arga-log`.log where player_uid = '%1' and log_type_id = (select id from `arga-log`.log_type where name = 'info') and id > (SELECT id from `arga-log`.log WHERE log_type_id = (select id from `arga-log`.log_type where name = 'mission_begin') AND mission_name = '%2' AND server_name = '%3' ORDER BY id DESC LIMIT 1) ORDER BY id DESC LIMIT 1;";

_query = format [_query, _uid, missionName, serverName];

private _log_info = _query call compile preprocessFileLineNumbers "core\scripts\db\connect_db.sqf";

if (count _log_info > 0) then {
	_log_info = (_log_info select 0);
};

_log_info;

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/