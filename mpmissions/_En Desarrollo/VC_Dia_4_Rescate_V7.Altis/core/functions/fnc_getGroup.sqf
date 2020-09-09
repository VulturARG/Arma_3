/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

private _argaPlatoonList = parseSimpleArray getMissionConfigValue ["ARGA_PLATOON_LIST", '[]'];

params [["_unit", player]];

private ["_roleDescriptionArray","_platoon","_argaPlatoon"];

_roleDescriptionArray = (toLower roleDescription leader _unit) splitString "@"; 

_platoon     = if (count(_roleDescriptionArray) >= 2) then {_roleDescriptionArray select 1; } else { toLower groupId group _unit; };
_platoon     = _platoon call MANDI_fnc_trim;
_argaPlatoon = (( _argaPlatoonList select {_platoon in (_x select 1) } ) select 0) select 0;
_platoon     = if (isNil "_argaPlatoon") then {_platoon} else {_argaPlatoon};

_platoon

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
//["_roleDescriptionArrayles:", _roleDescriptionArray] call MIV_fnc_log;
//["_platoon return:", _platoon] call MIV_fnc_log;
