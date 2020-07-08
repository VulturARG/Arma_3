/*******************************************************************************
                          Realizado por |ArgA|Ignacio
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

private _distanciaVision = getMissionConfigValue ["MAX_DIST_VISION", 4000];
private _initialGoggles =  getMissionConfigValue ["GAFAS_INICIALES", ""];
private _disableCustomLoadout =  getMissionConfigValue ["DESACTIVAR_EQUIPAMIENTO_PERSONALIZADO", 1];
private _intro = getMissionConfigValue ["INTRO", 2];
// Vultur
private _enableArtilleryComputer = getMissionConfigValue ["PERMITIR_COMPUTADORA_ARTILLERIA", true];
// TODO Ver por que sale un string y no un bolean
private _enableAutomaticRole = getMissionConfigValue ["PERMITIR_ROL_AUTOMATICO", true];
private _rol = "";

if (hasInterface) then {
  MANDI_ENABLE_DIST = true;
  [_distanciaVision, 800] execVM "scripts\view_distance.sqf";
  execVM "scripts\check_view.sqf";
  [_intro] execVM "scripts\init_intro.sqf";
  removeGoggles player; //arga_rhs_pm_negro
  if(_initialGoggles != "") then {
    player addGoggles _initialGoggles;
  };
  private _isMedic = player getVariable ["ace_medical_medicClass", 0];
  private _ing = if (_isMedic > 0) then { "arga_ing_medico" } else { "arga_ing_arga" };
  [player, _ing] call BIS_fnc_setUnitInsignia;
};
systemChat format["%1",_rol];
if ((_enableAutomaticRole == "true")) then {
  switch (toLower roleDescription player) do {
    case "cacique @comandancia": { _rol = "roles\capitan.sqf"; };
    case "capitán @comandancia": { _rol = "roles\capitan.sqf"; };
    case "pampa": { _rol = "roles\teniente.sqf"; };
    case "Teniente": { _rol = "roles\teniente.sqf"; };
    case "matrero": { _rol = "roles\tirador_fal.sqf"; };
    case "líder @cóndor": { _rol = "roles\lider_peloton.sqf"; };
    case "líder @yaguar": { _rol = "roles\lider_peloton.sqf"; };
    case "líder": { _rol = "roles\lider_peloton.sqf"; };
    case "ametrallador": { _rol = "roles\ametrallador_m240.sqf"; };
    case "ametrallador m240": { _rol = "roles\ametrallador_m240.sqf"; };
    case "ametrallador m249": { _rol = "roles\ametrallador_m249.sqf"; };
    case "granadero": {_rol = "roles\granadero.sqf"; };
    case "granadero bengalas": {_rol = "roles\granadero_bengalas.sqf"; };
    case "fusilero at": { _rol = "roles\lanzador_at.sqf"; };
    case "fusilero aa": { _rol = "roles\lanzador_aa.sqf"; };
    case "tirador fal": { _rol = "roles\tirador_fal.sqf"; };
    case "tirador mk11": { _rol = "roles\tirador_mk11.sqf"; };
    case "francotirador": { _rol = "roles\francotirador.sqf"; };
    case "ingeniero": { _rol = "roles\ingeniero.sqf"; };
    case "observador": { _rol = "roles\observador.sqf"; };
    case "piloto": { _rol = "roles\piloto.sqf"; };
    case "radio operador": { _rol = "roles\radio_operador.sqf"; };
    case "médico": { _rol = "roles\medico.sqf"; };
    case "médico de combate": { _rol = "roles\medico_combate.sqf"; };
    case "enfermero": { _rol = "roles\enfermero.sqf"; };
    case "fusilero": {_rol = "roles\fusilero.sqf"; };
    case "fusilero ra": { _rol = "roles\fusilero_ra.sqf"; };

    //default { player execVM "roles\fusilero.sqf"; };
  };
  
  [objNull, _rol] execVM "scripts\init_roles.sqf"
};

player disableAI "MOVE";
player action ["SwitchWeapon", player, player, 100];
player setUnitPos "middle";
enableEngineArtillery (_enableArtilleryComputer == "true");

// Deshabilita las opciones de Cargar y Guardar Equipo en el arsenal
if(_disableCustomLoadout == 1)then{
  [missionNamespace, "arsenalOpened", {
    disableSerialization;
    params ["_display"];
    _display displayAddEventHandler ["keydown", "_this select 3"];
    {
      (_display displayCtrl _x) ctrlShow false
    } forEach [44151, 44150, 44146, 44147, 44148, 44149, 44346];
  }] call BIS_fnc_addScriptedEventHandler;
};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/