acre2_languages =   [
    ["english", "English"],
    ["russian", "Russian"]
];

{
    _x call acre_api_fnc_babelAddLanguageType;
} foreach acre2_languages;
call acre_api_fnc_babelSetSpokenLanguages;
call acre_api_fnc_babelSetSpeakingLanguage;