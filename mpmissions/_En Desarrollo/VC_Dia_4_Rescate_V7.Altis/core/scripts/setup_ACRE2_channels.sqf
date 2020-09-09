/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

private _enableAcreSetup   = getMissionConfigValue ["ACTIVAR_SETUP_PERSONALIZADO_RADIOS",  1] == 1;

if (!_enableAcreSetup) exitWith {};

private _argaPlatoonList  = parseSimpleArray getMissionConfigValue ["ARGA_PLATOON_LIST", '[]'];
private _setupRadioChanel = parseSimpleArray getMissionConfigValue ["RADIO_CHANNEL_SETUP", '[]'];
private _radioType        = '';
private _channel          = '';
private _platoon          = '';
private _hasRadio         = false;

params ["_unit", "_role"];

_hasRadio = [_unit] call acre_api_fnc_hasRadio;

if (!hasInterface || {player != _unit} || !_hasRadio) exitWith {false};

waitUntil { ([] call acre_api_fnc_isInitialized) };

_platoon = [leader _unit] call MIV_fnc_getGroup;
_argaPlatoon = (( _argaPlatoonList select {_platoon in (_x select 1) } ) select 0) select 0;

if (!isNil "_argaPlatoon") then {
    _role = format["%1@%2",_role,_argaPlatoon]
};

_defaultRadioChannel = (( _setupRadioChanel select {_role isEqualTo (_x select 0)} ) select 0 ) select 1;

if (!isNil "_defaultRadioChannel") then {
    {
        _radioType = _x select 0;
        _channel   = _x select 1;
        if ([_unit, _radioType] call acre_api_fnc_hasKindOfRadio) then {
            [[_radioType] call acre_api_fnc_getRadioByType, _channel] call acre_api_fnc_setRadioChannel;
        };
    } forEach _defaultRadioChannel;
} else {
    if ([_unit, "ACRE_PRC343"] call acre_api_fnc_hasKindOfRadio) then {
        [(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 10] call acre_api_fnc_setRadioChannel;
    };
};

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
//["_defaultRadioChannel",_defaultRadioChannel] call MIV_fnc_log;
