/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/

private _defaultRoleList = parseSimpleArray getMissionConfigValue ["AUXILIAR_ROLE_LIST", '[]'];

params [["_unit", player], ["_roleList", _defaultRoleList]];

if (count(_roleList) == 0) then { _roleList = _defaultRoleList};

private _role = _unit getVariable ["MANDI_ROL", "desconocido"];

if (typeName _role != "SCALAR") then {
    if (_role == "desconocido" && !isNil "_unit") then { 
        private ["_description"];
        _description = ((toLower roleDescription _unit) splitString "@") select 0;
        //["GR_description :", _description] call MIV_fnc_log;
        if (!isNil "_description") then {
            _description = [_unit, _description] call MIV_fnc_parseRole;
            _role        = [_description, _roleList] call MIV_fnc_getRoleCode;
            _role        =  _role call MIV_fnc_removeAccentMark;
            if (isNil "_role") exitWith { "_role is nil" call MIV_fnc_log; "" };
            if (typeName _role != "STRING") exitWith { ["ROLE:", _role, "UNIT:",_unit] call MIV_fnc_log; "" };
            if (_role != "") then {
                _unit setVariable ["MANDI_ROL", _role];
            };
        };
    };
};

_role;

/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/

/*{
    ["_roleList 1:", _x] call MIV_fnc_log;
} forEach _roleList;
*/

/*
 Detectar si en roleDescription esta el tag #nc, segun el resultado, setear
 el atributo MIV_NO_CHANGE al valor correspondiente en la unidad.

 Si el tag #nc esta presente, quitarlo de la string de comparación. (_description)
 (checkear que el tag pueda estar al principio, final, medio, cualquier lado. y quitarlo bien.)

 Detectar esta variable (con default false) en la funcion que setea el rol y actuar como corresponda.
*/

/*
    [
        ["rol", codigo, id],
        ["rol", codigo, id],
        ["rol", codigo, id],
        ["rol", codigo, id],
        ["rol", codigo, id],
        ["rol", codigo, id],
    ]

*/


