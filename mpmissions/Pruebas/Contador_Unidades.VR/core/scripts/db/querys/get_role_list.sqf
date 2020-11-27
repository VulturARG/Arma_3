/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
//["Funcion: ", !(call MIV_fnc_isLogSystemEnabled)] call MIV_fnc_log;
if (!(call MIV_fnc_isLogSystemEnabled)) exitWith {[]};

// Llamamos a la db
call MIV_fnc_oo_extdb3;

//sleep 2;

private _extdb3 = "new" call OO_EXTDB3;
["setIniSectionDatabase", "Database"] call _extdb3;
["setDatabaseName", "arga-log"] call _extdb3;
["setQueryType", "SQL"] call _extdb3;
_result = "connect" call _extdb3;
//["CONNECTION: ", _result] call MIV_fnc_log;
/////////////////////

private _query = "SELECT code, name, id FROM role;";

private _roleList = ["executeQuery", _query] call _extdb3;

//["ROLE_LIST: ", _roleList] call MIV_fnc_log;

private _query = "SELECT role.code, alt.name, alt.id FROM role_alternative_name as alt LEFT JOIN role as role on alt.role_id = role.id;";

private _alternativeList = ["executeQuery", _query] call _extdb3;

// [format ["ALT LIST: %1", str _alternativeList]] call MIV_fnc_log;

(_roleList + _alternativeList);

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/