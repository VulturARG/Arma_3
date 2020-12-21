/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

private _mission         = getMissionConfigValue ["onLoadName", ""];
private _date            = getMissionConfigValue ["FECHA", ""];
private _time            = getMissionConfigValue ["HORARIO", ""];
private _mode            = getMissionConfigValue ["CARACTER", "No oficial"];
private _weather         = getMissionConfigValue ["CLIMA", ""];
private _location        = getMissionConfigValue ["UBICACION", ""];
private _isCampaign      = getMissionConfigValue ["ES_CAMPANIA", 0] == 1;
private _campaignName    = getMissionConfigValue ["NOMBRE_CAMPANIA", ""];
private _situation       = parseSimpleArray getMissionConfigValue ["SITUACION", "[]"];
private _storySituation  = parseSimpleArray getMissionConfigValue ["SITUACION_HISTORICA", "[]"];
private _intelligence    = parseSimpleArray getMissionConfigValue ["EXTRACTO_INTELIGENCIA", "[]"];
private _objectives      = parseSimpleArray getMissionConfigValue ["OBJETIVOS", "[]"];
private _loadout         = parseSimpleArray getMissionConfigValue ["RECURSOS", "[]"];
private _enemyForces     = parseSimpleArray getMissionConfigValue ["ENEMIGOS", "[]"];
private _author          = getMissionConfigValue ["AUTHOR", "ArgA"];
private _worldName       = worldName;
private _templateVersion = getMissionConfigValue ["TEMPLATE_VERSION", "0.0.0"];
private _templateData    = getMissionConfigValue ["TEMPLATE_LAST_UPDATE", "00-00-0000"];
private _saveReport      = getMissionConfigValue ["SAVE_REPORT", 1] == 1;

_situation      = _situation      joinString "\\n\\n";
_storySituation = _storySituation joinString "\\n\\n";
_intelligence   = _intelligence   joinString "\\n\\n";
_objectives     = _objectives     joinString "\\n\\n";
_loadout        = _loadout        joinString "\\n\\n";
_enemyForces    = _enemyForces    joinString "\\n\\n";

private _missionsValues = [
  ["mission", _mission],
  ["mode", _mode],
  ["isCampaign", _isCampaign],
  ["campaignName", _campaignName],
  ["briefing", [
      ["situation", _situation],
      ["storySituation", _storySituation],
      ["intelligence", _intelligence],
      ["objectives", _objectives],
      ["loadout", _loadout],
      ["enemyForces", _enemyForces],
      ["weather", _weather],
      ["location", _location],
      ["date", _date],
      ["time", _time]
    ]
  ],
  ["author", _author],
  ["worldName", _worldName],
  ["templateVersion", _templateVersion],
  ["templateData", _templateData],
  ["saveReport", _saveReport]
];

private _result  = [_missionsValues] call MIV_fnc_create_jsonObject;

[_result, "'", "\'"] call MIV_fnc_replaceInString;

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
