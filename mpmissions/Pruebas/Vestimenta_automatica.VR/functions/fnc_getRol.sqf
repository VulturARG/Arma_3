/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params ["_unit", ["_rolList", []]];

private _rol = _unit getVariable ["MANDI_ROL", ""];

if (_rol != "") then {
    private ["_code", "_rolName", "_description"];
    {
        _code = _x select 0;
        _rolName = _x select 1;
        _description = (toLower roleDescription _unit) splitString "@";
        if (_description select 0 == _rolName) then {
            _rol = _code;
        };
    } forEach _rolList;
};

_rol;
/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/