/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

private _roleList = call MIV_fnc_get_role_list;
private _role = [player, _roleList] call MANDI_fnc_getRole;
private _maintainRole = player getVariable ["MIV_MAINTAIN_ROLE", false];

if (!_maintainRole) then {
    if (typeName _role != "STRING") then {_role = "desconocido"};
    if (_role == "desconocido" && isDedicated) then { _role = "fusilero"};
    if (_role == "desconocido" && !isDedicated) then { hint "Rol desconocido\nRevisar nombre de rol\nUd. no posee equípo de combate"};
    _role = format['core\roles\%1.sqf',_role];
    [objNull, _role] execVM "core\scripts\init_roles.sqf";    
};


/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/