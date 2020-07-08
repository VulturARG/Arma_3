/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params [["_unit", player], ["_roleList", []]];

private _role = _unit getVariable ["MANDI_ROL", "desconocido"]; 

if (typeName _role != "SCALAR") then {
    if (_role == "desconocido" && !isNil "_unit") then { 
        private ["_code", "_roleName", "_description"];  
        {  
            _code = _x select 0;  
            _roleName = _x select 1;
            
            // Si no tiene rol asignado elegimos el ID del rol alternativo
            if (_code == "") then {
                _code = _x select 2; 
            };

            _description = ((toLower roleDescription _unit) splitString "@") select 0;
            if (!isNil "_description") then {
                _description = _description call MANDI_fnc_trim;
                if (_description == _roleName) then {
                    _role = _code;
                    _unit setVariable ["MANDI_ROL", _code];
                };
            };
        } forEach _roleList;  
    };
};

_role;

/*******************************************************************************
                          Realizado por |ArgA|MandI
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


