/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

params ["_unit", "_role"];

private _argaPlatoonList = parseSimpleArray getMissionConfigValue ["ARGA_PLATOON_LIST", '[]'];

_platoon = [leader _unit] call MIV_fnc_getGroup;

private _argaPlatoon = (( _argaPlatoonList select {_platoon in (_x select 1) } ) select 0) select 0;
if (!isNil "_argaPlatoon") then {
	_role = format["%1@%2",_role,_argaPlatoon]
};

_role

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
//["[APTR] _platoon:", _platoon] call MIV_fnc_log;
//["[APTR] Role:", _role] call MIV_fnc_log;