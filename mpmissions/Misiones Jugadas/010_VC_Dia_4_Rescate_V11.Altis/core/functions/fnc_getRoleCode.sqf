/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/
/*
	roleDescription, roleList -> String or Number

	Recibe una string en crudo de un rol y una lista de roles con el formato

	[
		["role_code_1", "Role 1", 1],
		["", "Role 2", 2],
		["role_code_3", "Role 3", 3],
		["role_code_4", "Role 4", 4]
	]

	Devuelve el role_code o el id si el primero no se encuentra.
*/

private _defaultRoleList = parseSimpleArray getMissionConfigValue ["AUXILIAR_ROLE_LIST", '[]'];

params ["_description", ["_roleList", _defaultRoleList]];

if (count(_roleList) == 0) then { _roleList = _defaultRoleList};

private ["_code", "_roleName"];

private _role = "";

_description = _description call MANDI_fnc_trim;
_description = _description call MIV_fnc_removeAccentMark;
{  
	_code = _x select 0;  
	_roleName = (_x select 1) call MIV_fnc_removeAccentMark;
	
	// Si no tiene rol asignado elegimos el ID del rol alternativo
	if (_code == "") then {
		_code = _x select 2; 
	};

	if (_description == _roleName) exitWith {
		_role = _code;
	};
} forEach _roleList;

_role

/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/