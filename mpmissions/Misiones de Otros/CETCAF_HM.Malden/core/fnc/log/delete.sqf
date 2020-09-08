
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_delete

Description:
    Delete object created by logistic point.

Parameters:
    _object - Helipad where the object to delete is. [Object]
    _blackList - Object can't be deleted. [Array]

Returns:

Examples:
    (begin example)
        [btc_create_object_point] call btc_fnc_log_delete;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_object", objNull, [objNull]],
    ["_blackList", [btc_create_object], [[]]]
];

private _array = ((nearestObjects [_object, btc_log_main_rc select {_x isEqualType ""}, 6]) select {!(
    _x isKindOf "Land_ConnectorTent_01_floor_dark_F"
)}) - _blackList;
/*
private _array = ((nearestObjects [btc_create_object_point,["All"], 6]) select {!(
    _x isKindOf "Land_ConnectorTent_01_floor_dark_F"
)}) - (btc_vehicles + btc_helo);*/

if (_array isEqualTo []) exitWith {
    [
        [localize "STR_BTC_HAM_LOG_DELETE"],
        ["<img size='1' image='\z\ace\addons\arsenal\data\iconClearContainer.paa' align='center'/>"]
    ] call CBA_fnc_notify;
};

[_array select 0] remoteExec ["btc_fnc_log_server_delete",[2]];
