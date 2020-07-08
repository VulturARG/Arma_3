/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params ["_query"];

// Llamamos a la db
call compile preprocessFileLineNumbers "scripts\db\source\oo_extdb3.sqf";

private _extdb3 = "new" call OO_EXTDB3;
["setIniSectionDatabase", "Database"] call _extdb3;
["setDatabaseName", "arga-log"] call _extdb3;
["setQueryType", "SQL"] call _extdb3;
_result = "connect" call _extdb3;
[format ["CONNECTION: %1", str _result]] call BIS_fnc_logFormat;
/////////////////////

[format ["QUERY: %1", str _query]] call BIS_fnc_logFormat;

private _result = ["executeQuery", _query] call _extdb3;

[format ["RESULT: %1", str _result]] call BIS_fnc_logFormat;

_result;

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/