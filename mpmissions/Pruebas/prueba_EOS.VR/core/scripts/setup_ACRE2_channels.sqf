/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

if (!hasInterface ) exitWith {false};

private _enableAcreSetup   = getMissionConfigValue ["ACTIVAR_SETUP_PERSONALIZADO_RADIOS",  1] == 1;

if (!_enableAcreSetup) exitWith {};

params ["_unit", "_role"];

private _argaPlatoonList     = parseSimpleArray getMissionConfigValue ["ARGA_PLATOON_LIST", '[]'];
private _setupRadioChanel    = parseSimpleArray getMissionConfigValue ["RADIO_CHANNEL_SETUP", '[]'];
private _rolesNeedingPlatoon = parseSimpleArray getMissionConfigValue ["ROLES_NEEDING_PLATOON", '[]'];
private _radioType           = '';
private _channel             = '';
private _platoon             = '';
private _hasRadio            = false;
private _roleInList          = "";

//["SAC",_unit,_role] call MIV_fnc_log;

_hasRadio = [_unit] call acre_api_fnc_hasRadio;

if ( player != _unit || !_hasRadio) exitWith {false};

waitUntil { ([] call acre_api_fnc_isInitialized) };

private _roleInList = ( _rolesNeedingPlatoon select {_role isEqualTo _x }) select 0;

if (!isNil "_roleInList") then {
    //["SAC _roleInList:", _roleInList] call MIV_fnc_log;
    _role = [player, _role]call MIV_fnc_addPlatoonToRole;
};

//["SAC Rol:",_role] call MIV_fnc_log;
_defaultRadioChannel = (( _setupRadioChanel select {_role isEqualTo (_x select 0)} ) select 0 ) select 1;

if (!isNil "_defaultRadioChannel") then {
    //["SAC","_defaultRadioChannel",_defaultRadioChannel] call MIV_fnc_log;
    {
        _radioType = _x select 0;
        _channel   = _x select 1;

        if ([_unit, _radioType] call acre_api_fnc_hasKindOfRadio) then {
            [[_radioType] call acre_api_fnc_getRadioByType, _channel] call acre_api_fnc_setRadioChannel;
        };
    } forEach _defaultRadioChannel;
} else {
    //["SAC","_defaultRadioChannel isNil"] call MIV_fnc_log;
    if ([_unit, "ACRE_PRC343"] call acre_api_fnc_hasKindOfRadio) then {
        [(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 10] call acre_api_fnc_setRadioChannel;
    };
};

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
//["_defaultRadioChannel",_defaultRadioChannel] call MIV_fnc_log;
