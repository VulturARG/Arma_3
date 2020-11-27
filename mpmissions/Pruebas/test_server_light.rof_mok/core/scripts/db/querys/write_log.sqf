/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

/*
Recibe una unidad (o player) un array de players o un array con el formato [ ["_uid", "_name", "_unit"] ]
Además recibe una string indicando el logType
*/

params [["_unit", []], ["_logType", "connected"]];

if (!(call MIV_fnc_isLogSystemEnabled)) exitWith { };


// Aca transformar _unit a una lista si no lo es
// [ ["_uid", "_name", "_unit"] ]

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

private _roleList = call MIV_fnc_get_role_list;
private ["_role", "_query", "_valuesQuery", "_values", "_state", "_id", "_logInfo", "_createdAt"];
private _querys = [];

{
	_x params ["_uid", "_name", "_unit"];

	//Checkear que hacer con estos parametros cuando no hay unidad
	_role = [_unit, _roleList] call MANDI_fnc_getRole;
	_state = _unit call MANDI_fnc_getState;

	_query = if (typeName _role == "SCALAR") then { " INTO log (`id`, `log_type_id`, `player_name`, `player_uid`, `player_state_id`, `mission_name`, `role_alternative_name_id`, `mission_time`, `server_name`, `createdAt`) VALUES" } else { " INTO log (`id`, `log_type_id`, `player_name`, `player_uid`, `player_state_id`, `mission_name`, `role_id`, `mission_time`, `server_name`, `createdAt`) VALUES" };
	_valuesQuery = if (typeName _role == "SCALAR") then { "(%1, (SELECT id from log_type WHERE name = '%2'), '%3', '%4', (SELECT id from player_state WHERE name = '%5'), '%6', %7, %8, '%9', %10);" } else { "(%1, (SELECT id from log_type WHERE name = '%2'), '%3', '%4', (SELECT id from player_state WHERE name = '%5'), '%6', (SELECT id from role WHERE code = '%7'), %8, '%9', %10);" };
	_query = if (_logType == "info") then { "REPLACE" + _query } else { "INSERT" + _query };

	_id = "NULL";
	_createdAt = "NOW()";
	
	if (_logType == "info") then {
		_logInfo = _uid call MIV_fnc_get_info_log;
		if (count _logInfo > 0 ) then {
			_id = _logInfo select 0;
			_createdAt = format["'%1'", ([_logInfo select 1] call MANDI_fnc_formatDate)];
		};
	}; 

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
		serverName,
		_createdAt
	];

	_querys pushBack ([_query, _values] joinString " ");

} forEach _unitList;

if (count _querys > 0) then {
	_querys call MIV_fnc_connect_db;
};

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/