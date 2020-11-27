/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/

params ["_unit","_description"];

_unit setVariable ["MIV_KEEP_ROLE", ["#nc", _description] call BIS_fnc_inString];
_description = [_description, "#nc", ""] call MIV_fnc_replaceInString;
_description = _description call MIV_fnc_removeAccentMark;

_description;

/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/