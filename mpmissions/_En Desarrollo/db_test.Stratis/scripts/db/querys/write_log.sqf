/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

/*

Recibe una unidad (o player) un array de players o un array con el formato [ ["_uid", "_name", "_unit"] ]
Además recibe una string indicando el logType

*/

params [["_unit", []], ["_logType", "connected"]];

if (!isDedicated) exitWith { };

[format ["UNIT: %1, ,LOGTYPE: %2", str _unit, str _logType]] call BIS_fnc_logFormat;

//Aca transformar _unit a una lista si no lo es
//[ ["_uid", "_name", "_unit"] ]

private _unitList = [];

if (typeName _unit != "ARRAY") then {
	if (! isPlayer _unit) exitWith { };
	_unitList pushBack [getPlayerUID _unit, name _unit, _unit];
} else {
	_unitArray = _unit;
	if (count _unitArray == 0) exitWith { };

	if (typeName (_unitArray select 0) != "ARRAY") then {
		{
			if (isPlayer _x) then { 
				_unitList pushBack [getPlayerUID _x, name _x, _x];
			};
		} forEach _unitArray;
	} else {
		{
			_x params ["_uid", "_name", "_unit"];
			if (_unit getVariable ["MANDI_IS_PLAYER", false]) then {
				_unitList pushBack _x;
			};
		} forEach _unitArray;
	};
};

[format ["UNITLIST: %1", str _unitList]] call BIS_fnc_logFormat;

private _roleList = call compile preprocessFileLineNumbers "scripts\db\querys\get_role_list.sqf";
private ["_role", "_query", "_valuesQuery", "_values", "_role", "_state", "_id"];
private _querys = [];

{
	_x params ["_uid", "_name", "_unit"];

	//Checkear que hacer con estos parametros cuando no hay unidad
	_role = [_unit, _roleList] call MANDI_fnc_getRole;
	_state = _unit call MANDI_fnc_getState;

	_query = if (typeName _role == "SCALAR") then { " INTO log (`id`, `log_type_id`, `player_name`, `player_uid`, `player_state_id`, `mission_name`, `role_alternative_name_id`, `mission_time`, `server_name`) VALUES" } else { " INTO log (`id`, `log_type_id`, `player_name`, `player_uid`, `player_state_id`, `mission_name`, `role_id`, `mission_time`, `server_name`) VALUES" };
	_valuesQuery = if (typeName _role == "SCALAR") then { "(%1, (SELECT id from log_type WHERE name = '%2'), '%3', '%4', (SELECT id from player_state WHERE name = '%5'), '%6', %7, %8, '%9');" } else { "(%1, (SELECT id from log_type WHERE name = '%2'), '%3', '%4', (SELECT id from player_state WHERE name = '%5'), '%6', (SELECT id from role WHERE code = '%7'), %8, '%9');" };
	_query = if (_logType == "info") then { "REPLACE" + _query } else { "INSERT" + _query };
	
	_id = if (_logType == "info") then { _uid call compile preprocessFileLineNumbers "scripts\db\querys\get_info_log_id.sqf" } else { "NULL" };

	_values = format [
		_valuesQuery,
		_id,
		_logType,
		_name,
		_uid,
		_state,
		missionName,
		_role,
		time,
		serverName
	];

	_querys pushBack ([_query, _values] joinString " ");

} forEach _unitList;

[format ["QUERYS: %1", str _querys]] call BIS_fnc_logFormat;

if (count _querys > 0) then {
	_querys call compile preprocessFileLineNumbers "scripts\db\connect_db.sqf";
};

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/