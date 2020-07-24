/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/

private _defaultRoleList = parseSimpleArray getMissionConfigValue ["AUXILIAR_ROLE_LIST", '[]'];

params [["_unit", player], ["_roleList", _defaultRoleList]];

if (count(_roleList) == 0) then { _roleList = _defaultRoleList};

private _role = _unit getVariable ["MANDI_ROL", "desconocido"];

/*
 Detectar si en roleDescription esta el tag #nc, segun el resultado, setear
 el atributo MIV_NO_CHANGE al valor correspondiente en la unidad.

 Si el tag #nc esta presente, quitarlo de la string de comparación. (_description)
 (checkear que el tag pueda estar al principio, final, medio, cualquier lado. y quitarlo bien.)

 Detectar esta variable (con default False) en la funcion que setea el rol y actuar como corresponda.
*/

if (typeName _role != "SCALAR") then {
    if (_role == "desconocido" && !isNil "_unit") then { 
        private ["_code", "_roleName", "_description"];
        _description = ((toLower roleDescription _unit) splitString "@") select 0;
        if (!isNil "_description") then {
            _unit setVariable ["MIV_MAINTAIN_ROLE", ["#nc", _description] call BIS_fnc_inString];
            _description = [_description, "#nc", ""] call MIV_fnc_replaceInString;
            _description = _description call MANDI_fnc_trim;
            {  
                _code = _x select 0;  
                _roleName = _x select 1;
                
                // Si no tiene rol asignado elegimos el ID del rol alternativo
                if (_code == "") then {
                    _code = _x select 2; 
                };

                if (_description == _roleName) then {
                    _role = _code;
                    _unit setVariable ["MANDI_ROL", _code];
                };
            } forEach _roleList;
        };
    };
};

_role;

/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/

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


