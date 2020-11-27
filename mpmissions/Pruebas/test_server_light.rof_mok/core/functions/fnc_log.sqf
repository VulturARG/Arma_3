/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

if (!(getMissionConfigValue ["DEBUG", 0] == 1)) exitWith { };

_strData = _this;

if (!isServer) exitWith {
     _strData remoteExec ["MIV_fnc_log", 2, false];
};

private _data = "";

if (typeName _strData != "ARRAY") then {
    _strData = [_strData];
};

_strData = _strData apply {
                if (isNil "_x") then {
                    "isNil";
                } else {
                    if (typeName _x != "STRING") then { str _x } else { _x };
                };
            };

{
	_data = _data + " " + _x;
} forEach _strData;

_data call BIS_fnc_log;

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
// Uso [] call MIV_fnc_log;