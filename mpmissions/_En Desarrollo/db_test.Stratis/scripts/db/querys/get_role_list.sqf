/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

// Llamamos a la db
call compile preprocessFileLineNumbers "scripts\db\source\oo_extdb3.sqf";

//sleep 2;

private _extdb3 = "new" call OO_EXTDB3;
["setIniSectionDatabase", "Database"] call _extdb3;
["setDatabaseName", "arga-log"] call _extdb3;
["setQueryType", "SQL"] call _extdb3;
_result = "connect" call _extdb3;
[format ["CONNECTION: %1", str _result]] call BIS_fnc_logFormat;
/////////////////////

private _query = "SELECT code, name, id FROM role;";

private _roleList = ["executeQuery", _query] call _extdb3;

[format ["ROLE_LIST: %1", str _roleList]] call BIS_fnc_logFormat;

private _query = "SELECT role.code, alt.name, alt.id FROM role_alternative_name as alt LEFT JOIN role as role on alt.role_id = role.id;";

private _alternativeList = ["executeQuery", _query] call _extdb3;

[format ["ALT LIST: %1", str _alternativeList]] call BIS_fnc_logFormat;

(_roleList + _alternativeList);

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/