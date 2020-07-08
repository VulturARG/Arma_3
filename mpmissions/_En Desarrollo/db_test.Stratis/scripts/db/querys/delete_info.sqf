/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

// Llamamos a la db
call compile preprocessFileLineNumbers "scripts\db\source\oo_extdb3.sqf";

private _extdb3 = "new" call OO_EXTDB3;
["setIniSectionDatabase", "Database"] call _extdb3;
["setDatabaseName", "arga-log"] call _extdb3;
["setQueryType", "SQL"] call _extdb3;
private _result = "connect" call _extdb3;
[format ["CONNECTION: %1", str _result]] call BIS_fnc_logFormat;
/////////////////////

private _query = format ["SELECT id from `arga-log`.log WHERE log_type_id = (select id from `arga-log`.log_type where name = 'mission_begin') AND mission_name = '%1' ORDER BY id DESC LIMIT 1;", missionName];

[format ["QUERY: %1", str _query]] call BIS_fnc_logFormat;

private _mission_id = ["executeQuery", _query] call _extdb3;

[format ["RESULT: %1", str _mission_id]] call BIS_fnc_logFormat;

_mission_id = (_mission_id select 0) select 0;

_query = format ["DELETE FROM `arga-log`.log WHERE log_type_id = (select id from `arga-log`.log_type where name = 'info') AND id > %1;", _mission_id];

[format ["QUERY: %1", str _query]] call BIS_fnc_logFormat;

_result = ["executeQuery", _query] call _extdb3;

[format ["RESULT: %1", str _result]] call BIS_fnc_logFormat;

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
