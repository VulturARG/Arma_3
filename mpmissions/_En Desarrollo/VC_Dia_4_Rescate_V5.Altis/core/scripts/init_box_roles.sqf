/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

params ["_box"];

if(isNil "_box") exitWith {};

private _boxRoleList = parseSimpleArray getMissionConfigValue ["BOX_ROLE_LIST", []];
private _equipment   = call MIV_fnc_getEquipment;

removeAllActions _box;

private ["_roleCode", "_rolePath","_role"];

{
    _role = _x;
    
    _roleCode = [toLower _role, []] call MIV_fnc_getRoleCode;
    _rolePath = format ['core\roles\%1.sqf', _roleCode];
	
	_box addAction ["<t color='#ffffff'>" + _x + "</t>", {  
            params ["_target", "_caller", "_actionId", "_arguments"];
            private _role =  (_arguments select 0);
            private _params = [_caller, (_role select 1)];
            _params append (_arguments select 1);
            _params execVM "core\roles\base.sqf";
            hint format ["Rol: %1", _role select 0]; 
        }, [[_role, _rolePath], _equipment], 1.5, true, true, "","true", 4, false, "", ""
    ];
} forEach _boxRoleList;

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
//["_roleCode:",_roleCode] call MIV_fnc_log;
//["_arguments:",_arguments] call MIV_fnc_log;
