/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
  
params ["_playerUnit"];

private _roleList = call MIV_fnc_get_role_list;
private _role = [_playerUnit, _roleList] call MANDI_fnc_getRole;
[[_playerUnit,_role],"core\scripts\setup_ACRE2_channels.sqf"] remoteExec ["BIS_fnc_execVM", owner _playerUnit, false];

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
//[_playerUnit,_role] call MIV_fnc_log;