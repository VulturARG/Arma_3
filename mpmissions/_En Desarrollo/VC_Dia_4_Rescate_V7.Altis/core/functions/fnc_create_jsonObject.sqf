/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
params ["_dataArray"];

private _dataResult   = [];

{
    _x params ["_key", "_data"];
    _data = if (typeName _data == "STRING") then {format['"%1"',_data]} else {_data};
    _data = if (typeName _data == "ARRAY") then {[_data] call MIV_fnc_create_jsonObject} else {_data};
    _dataResult append [([format['"%1"',_key],_data] joinString ":")];
} forEach _dataArray;

_dataResult = format ["{%1}",(_dataResult joinString ",")];

_dataResult;

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
// [_x] call MIV_fnc_log;
// ["Final:",_jsonResult] call MIV_fnc_log;
