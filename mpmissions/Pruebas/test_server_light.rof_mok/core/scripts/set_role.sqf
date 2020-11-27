/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

params ["_roleList"];

private _role      = [player, _roleList] call MANDI_fnc_getRole;
private _keepRole  = player getVariable ["MIV_KEEP_ROLE", false];
private _equipment = [];

if (!_keepRole) then {
    if (typeName _role != "STRING") then {_role = "desconocido"};
    if (_role == "desconocido" &&  isDedicated) then { _role = "fusilero"};
    if (_role == "desconocido" && !isDedicated) then { hint "Rol desconocido\nRevisar nombre de rol\nNo posee equípo de combate"};
    
    private _unitRoleEquipment = [player, _role];
    _equipment = call MIV_fnc_getEquipment;
    _unitRoleEquipment append _equipment;

    _unitRoleEquipment call compile preprocessFile "core\roles\base.sqf";

    player action ["SwitchWeapon", player, player, 100];

    // player call MIV_fnc_setInsignia;

};

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
//["SR Rol:",_role] call MIV_fnc_log;