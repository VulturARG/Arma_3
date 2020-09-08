/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

_strData = _this;

if (!(getMissionConfigValue ["DEBUG", 0] == 1)) exitWith { };

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