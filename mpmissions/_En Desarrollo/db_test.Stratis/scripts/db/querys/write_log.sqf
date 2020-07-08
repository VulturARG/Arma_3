/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params [["_unit", player], ["_logType", "connected"]];

/*
	TODO: Arreglar, cuando un jugador tiene IA de forma local (o sea es lider de grupo y tiene IA en su grupo)
	este script en el disconnect corre una vez por cada IA y jugador.
	TODO: Agregar tiempo de log real desde aca y no dejar el default de la db
	TODO: Crear funcion para loguear con una sola llamada varias personas
*/

[format ["UNIT: %1, ,LOGTYPE: %2", str _unit, str _logType]] call BIS_fnc_logFormat;

private ["_query"];

private _values = " ";

// Llamamos a la db
call compile preprocessFileLineNumbers "scripts\db\source\oo_extdb3.sqf";

private _extdb3 = "new" call OO_EXTDB3;
["setIniSectionDatabase", "Database"] call _extdb3;
["setDatabaseName", "arga-log"] call _extdb3;
["setQueryType", "SQL"] call _extdb3;
private _result = "connect" call _extdb3;
[format ["CONNECTION: %1", str _result]] call BIS_fnc_logFormat;
/////////////////////

if (_logType == "connected") then {
	private _roleList = call compile preprocessFileLineNumbers "scripts\db\querys\get_role_list.sqf";

	private _role = [_unit, _roleList] call MANDI_fnc_getRole;

	if (typeName _role == "SCALAR") then {
		_query = "INSERT INTO log (`log_type_id`, `player_name`, `player_uid`, `player_state_id`, `mission_name`, `role_alternative_name_id`, `mission_time`) VALUES";
		_values = format [
			"((SELECT id from log_type WHERE name = '%1'), '%2', '%3', (SELECT id from player_state WHERE name = '%4'), '%5', %6, %7);",
			_logType,
			name _unit,
			getPlayerUID _unit,
			_unit call MANDI_fnc_getState,
			missionName,
			_role,
			time
		];
	} else {
		_query = "INSERT INTO log (`log_type_id`, `player_name`, `player_uid`, `player_state_id`, `mission_name`, `role_id`, `mission_time`) VALUES";
		_values = format [
			"((SELECT id from log_type WHERE name = '%1'), '%2', '%3', (SELECT id from player_state WHERE name = '%4'), '%5', (SELECT id from role WHERE code = '%6'), %7);",
			_logType,
			name _unit,
			getPlayerUID _unit,
			_unit call MANDI_fnc_getState,
			missionName,
			_role,
			time
		];
	};

	_query = [_query, _values] joinString " ";

	_query execVM "scripts\db\connect_db.sqf";
};

if (_logType == "info") then {
	private _unitList = _unit;
	private _roleList = call compile preprocessFileLineNumbers "scripts\db\querys\get_role_list.sqf";
	{
		_query = format ["SELECT id from `arga-log`.log where player_uid = '%1' and log_type_id = 3 and id > (SELECT id from `arga-log`.log WHERE log_type_id = (select id from `arga-log`.log_type where name = 'mission_begin') AND mission_name = '%3' ORDER BY id DESC LIMIT 1) ORDER BY id DESC LIMIT 1;",
			getPlayerUID _x,
			getPlayerUID _x,
			missionName
		];

		[format ["QUERY: %1", str _query]] call BIS_fnc_logFormat;
		
		private _log_id = ["executeQuery", _query] call _extdb3;

		if (count _log_id > 0) then {

			_log_id = (_log_id select 0) select 0;
		}else{
			_log_id = "NULL";
		};

		private _role = [_x, _roleList] call MANDI_fnc_getRole;

		if (typeName _role == "SCALAR") then {
			_query = "REPLACE INTO log (`id`, `log_type_id`, `player_name`, `player_uid`, `player_state_id`, `mission_name`, `role_alternative_name_id`, `mission_time`, `updatedAt`) VALUES";
			_values = format [
				"(%1, (SELECT id from log_type WHERE name = '%2'), '%3', '%4', (SELECT id from player_state WHERE name = '%5'), '%6', %7, '%8', NOW());",
				_log_id,
				_logType,
				name _x,
				getPlayerUID _x,
				_x call MANDI_fnc_getState,
				missionName,
				_role,
				time
			];
		} else {
			_query = "REPLACE INTO log (`id`, `log_type_id`, `player_name`, `player_uid`, `player_state_id`, `mission_name`, `role_id`, `mission_time`, `updatedAt`) VALUES";
			_values = format [
				"(%1, (SELECT id from log_type WHERE name = '%2'), '%3', '%4', (SELECT id from player_state WHERE name = '%5'), '%6', (SELECT id from role WHERE code = '%7'), '%8', NOW());",
				_log_id,
				_logType,
				name _x,
				getPlayerUID _x,
				_x call MANDI_fnc_getState,
				missionName,
				_role,
				time
			];
		};
		_query = [_query, _values] joinString " ";

		["executeQuery", _query] call _extdb3;
	} forEach _unitList;
};

if (_logType == "disconnected" || _logType == "killed" || _logType == "respawn") then {
	private _uid = _unit select 0;
	private _name = _unit select 1;
	_unit = _unit select 2;
	// TODO verificar si la instrucción de abajo funciona al tener el _unit de los dos lados de la igualdad
	//_unit params["_uid","_name","_unit"];

	_query = "INSERT INTO log (`log_type_id`, `player_name`, `player_uid`, `player_state_id`, `mission_name`, `mission_time`) VALUES";

	_values = format [
		"((SELECT id from log_type WHERE name = '%1'), '%2', '%3', (SELECT id from player_state WHERE name = '%4'), '%5', %6);",
		_logType,
		_name,
		_uid,
		_unit call MANDI_fnc_getState,
		missionName,
		time
	];

	_query = [_query, _values] joinString " ";

	_query execVM "scripts\db\connect_db.sqf";
};

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/