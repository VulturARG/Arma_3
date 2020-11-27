/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

if (!(call MIV_fnc_isLogSystemEnabled)) exitWith { };

private _query = _this;

// Llamamos a la db
call MIV_fnc_oo_extdb3;

private _extdb3 = "new" call OO_EXTDB3;
["setIniSectionDatabase", "Database"] call _extdb3;
["setDatabaseName", "arga-log"] call _extdb3;
["setQueryType", "SQL"] call _extdb3;
"connect" call _extdb3;
/////////////////////

private ["_result", "_response"];

if (typeName _query == "ARRAY") then {
    _result = [];
    {
        ["QUERY:", _x] call MIV_fnc_log;
        _response = ["executeQuery", _x] call _extdb3;
        ["RESULT", _response] call MIV_fnc_log;
        _result pushBack _response;
    } forEach _query;
} else {
    ["QUERY:", _query] call MIV_fnc_log;
    _result = ["executeQuery", _query] call _extdb3;
    ["RESULT:", _result] call MIV_fnc_log;
};

_result;

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/