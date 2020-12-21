/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

private _isBriefingActivate = getMissionConfigValue ["BRIEFING", 1];

if (_isBriefingActivate == 0) exitWith { false };

private _mode = getMissionConfigValue ["CARACTER", "No oficial"];
private _time = getMissionConfigValue ["HORARIO", ""];
private _date = getMissionConfigValue ["FECHA", ""];
private _weather = getMissionConfigValue ["CLIMA", ""];
private _location = getMissionConfigValue ["UBICACION", ""];
private _situation = getMissionConfigValue ["SITUACION", "[]"];
private _storySituation = getMissionConfigValue ["SITUACION_HISTORICA", "[]"];
private _intelligence = getMissionConfigValue ["EXTRACTO_INTELIGENCIA", "[]"];
private _objectives = getMissionConfigValue ["OBJETIVOS", "[]"];
private _loadout = getMissionConfigValue ["RECURSOS", "[]"];
private _enemyForces = getMissionConfigValue ["ENEMIGOS", "[]"];
private _author = getMissionConfigValue ["AUTHOR", "ArgA"];

private _info = [
    "Caracter: " + _mode,
    "Horario: " + _time,
    "Fecha: " + _date,
    "Clima: " + _weather,
    "Ubicación: " + _location
];

private _params = [
    parseSimpleArray _loadout, 
    parseSimpleArray _enemyForces, 
    parseSimpleArray _objectives, 
    parseSimpleArray _situation, 
    parseSimpleArray _intelligence,
    parseSimpleArray _storySituation,
    _info,
    _author
];

_params call MANDI_fnc_setBriefing;

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/