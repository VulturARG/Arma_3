/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

if (!isDedicated) exitWith {};

private _enableAcreSetup   = getMissionConfigValue ["ACTIVAR_SETUP_PERSONALIZADO_RADIOS",  1] == 1;

if (!_enableAcreSetup) exitWith {};

private _argaPlatoonList    = parseSimpleArray getMissionConfigValue ["ARGA_PLATOON_LIST", '[]'];
private _radioChannelName   = parseSimpleArray getMissionConfigValue ["RADIO_CHANNEL_NAME", '[]'];
private _fixedChannelName   = parseSimpleArray getMissionConfigValue ["FIXED_CHANNEL_NAME", '[]'];
private _channelNameInRadio = [["ACRE_PRC152","description"],["ACRE_PRC117F","name"]];
private _radioType          = '';
private _description        = '';
private _platoon            = [];
private _channelCompare     = '';

{
	_platoon append [_x call MIV_fnc_getGroup];

} foreach playableUnits;
_platoon = _platoon arrayIntersect _platoon;

{
    _radioType             = _x select 0;
    _defaultRadioChannel   = _x select 1;
    private _platoonNumber = 0;
    private _channelMax    = 0;
    private _channeArray   = [];
    private _extraPlatoons = _platoon;

    _description = (( _channelNameInRadio select {_radioType isEqualTo (_x select 0)} ) select 0) select 1;
    {
        private _channelNumber = _x select 0;
        private _channelText   = _x select 1;
        private _argaPlatoon   = '';
        private _fixedName     = '';
        
        _channeArray append [_channelNumber];
        _fixedName = (_fixedChannelName select {(toLower _channelText) in (toLower _x)}) select 0 ;
        
        if (isNil "_fixedName") then {
            _argaPlatoon = (( _argaPlatoonList select {(tolower _channelText) in (_x select 1) } ) select 0) select 0;
            _channelCompare = (_platoon select {(toLower _argaPlatoon) in (toLower _x) } select 0);
            if (isNil "_channelCompare" ) then { 
                _channelText = _platoon select _platoonNumber;
                _platoonNumber = _platoonNumber + 1;
                _extraPlatoons = _extraPlatoons - [_channelText];
            };
            if (!isNil "_argaPlatoon" ) then { 
                _extraPlatoons = _extraPlatoons - [_argaPlatoon];
            };
        };

        if (!isNil "_description") then {
            [_radioType, "default", _channelNumber, _description, _channelText] call acre_api_fnc_setPresetChannelField;
        };       
        
    } forEach _defaultRadioChannel;

    _channelMax = selectMax _channeArray;
    for "_channelNumber" from 1 to count(_extraPlatoons) do { 
        if (!isNil "_description") then {
            _channelText = _extraPlatoons select (_channelNumber-1);
            [_radioType, "default", _channelNumber+_channelMax, _description, _channelText] call acre_api_fnc_setPresetChannelField;
            ["radioType",_radioType,"channelNumber",_channelNumber+_channelMax,"description",_description,"channelText",_channelText] call MIV_fnc_log;
        }; 
    };
} forEach _radioChannelName;

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

//[""] call MIV_fnc_log;
