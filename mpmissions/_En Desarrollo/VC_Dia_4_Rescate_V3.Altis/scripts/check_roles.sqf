/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

if (isDedicated) exitWith {};

private _role = '';
private _defaultRoleList = parseSimpleArray getMissionConfigValue ["AUXILIAR_ROLE_LIST", '[]'];
private _badRoles = '';
{
	_role = [_x, _defaultRoleList] call MANDI_fnc_getRole;
	if (typeName _role != "STRING" || _role == "desconocido") then {_badRoles = _badRoles + format['%1\n',roleDescription _x]};
	//["UNIT:",  _x, "ROLE_DESC:", roleDescription _x, "ROLE:", _role, "_badRoles:",((roleDescription _x) splitString "@") select 0] call MIV_fnc_log;
} foreach playableUnits;
if (count(_badRoles) > 0) then {
	hint ('ROLES DESCONOCIDOS:\n' + _badRoles);
};
//["_badRoles:", _badRoles] call MIV_fnc_log;
