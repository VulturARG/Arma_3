/*[true, true] call acre_api_fnc_setupMission;
[ [west, "English", "French"], [east, "Russian"], [civilian, "French"] ] call acre_api_fnc_babelSetupMission;
/*["en"] call acre_api_fnc_babelSetSpokenLanguages;
["en", "English"] call acre_api_fnc_babelAddLanguageType;


hint "Test 1";
/*

if ("G1" in str(group player)) then {
    hint "G1";
    ["en"] call acre_api_fnc_babelSetSpokenLanguages;
};
if ("G2" in str(group player)) then {
    hint "G2";
    ["ru"] call acre_api_fnc_babelSetSpokenLanguages;
};
if ("G3" in str(group player)) then {
    hint "G3";
    ["ab"] call acre_api_fnc_babelSetSpokenLanguages;
};

/*["unit", {
    params ["_player"];
    switch ((getNumber (configFile >> "CfgVehicles" >> (typeOf _player) >> "side"))) do {
        case 1: { ["en"] call acre_api_fnc_babelSetSpokenLanguages; };
        case 0: { ["ru"] call acre_api_fnc_babelSetSpokenLanguages; };
        case 2: { ["ab"] call acre_api_fnc_babelSetSpokenLanguages; };
        default {  ["ab","en","ru"] call acre_api_fnc_babelSetSpokenLanguages; };
    };
}, true] call CBA_fnc_addPlayerEventHandler;
*/
/*
[true, true] call acre_api_fnc_setupMission;

f_available_languages = [
    ["en", "English"],
    ["ru", "Russian"],
    ["ar", "Arabic"]
];
{
    _x call acre_api_fnc_babelAddLanguageType;
} forEach f_available_languages;

[] spawn {
    if (!hasInterface) exitWith {};
    if (player != player) then {waitUntil {player == player};};
    if (!alive player) then {waitUntil {alive player};};

    _languagesPlayerSpeaks = player getVariable ["f_languages", []];

    switch (playerside) do {
    case west: {
            if (_languagesPlayerSpeaks isEqualTo []) then {_languagesPlayerSpeaks = ["en","ru"];};
        };
    case east: {
            if (_languagesPlayerSpeaks isEqualTo []) then {_languagesPlayerSpeaks = ["en","ru"];};
        };
    case independent: {
            if (_languagesPlayerSpeaks isEqualTo []) then {_languagesPlayerSpeaks = ["ar","ru"];};
        };
    case civilian: {
            if (_languagesPlayerSpeaks isEqualTo []) then {_languagesPlayerSpeaks = ["ar"];};
        };
    };
    _languagesPlayerSpeaks call acre_api_fnc_babelSetSpokenLanguages;
// * /
    [true, true] call acre_api_fnc_setupMission;
    [[west, "English"],[east, "Russian"],[independent, "English", "Russian"],[civilian, "English", "Russian"]] call acre_api_fnc_setupMission;
    ["en", "English"] call acre_api_fnc_babelAddLanguageType;
    ["ru", "Russian"] call acre_api_fnc_babelAddLanguageType;

    if (hasInterface) then {
        switch ( side (group player) ) do {
            case west: {
                ["en","ru"] call acre_api_fnc_babelSetSpokenLanguages;
            };
            case civilian: {
                ["en","ru"] call acre_api_fnc_babelSetSpokenLanguages;
            };
            case east: {
                ["ru"] call acre_api_fnc_babelSetSpokenLanguages;
            };
            case independent: {
                ["en","ru"] call acre_api_fnc_babelSetSpokenLanguages;
            };
        };
    };

// */