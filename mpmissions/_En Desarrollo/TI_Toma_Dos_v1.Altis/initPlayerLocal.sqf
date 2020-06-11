/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

private _distanciaVision = getMissionConfigValue ["MAX_DIST_VISION", 4000];
private _initialGoggles =  getMissionConfigValue ["GAFAS_INICIALES", ""];
private _disableCustomLoadout =  getMissionConfigValue ["DESACTIVAR_EQUIPAMIENTO_PERSONALIZADO", 1];
private _intro = getMissionConfigValue ["INTRO", 2];
// Vultur
private _enableArtilleryComputer = getMissionConfigValue ["PERMITIR_COMPUTADORA_ARTILLERIA", true];
// TODO Ver por que sale un string y no un bolean

if (hasInterface) then {
  [_distanciaVision, 800] execVM "scripts\view_distance.sqf";
  [] execVM "scripts\check_view.sqf";
  waitUntil {time > 0};
  if (_intro == 1) then {
    [] execVM "scripts\intro.sqf";
  };
  if (_intro == 2) then {
    [] execVM "scripts\intro_2.sqf";
  };
  removeGoggles player; //arga_rhs_pm_negro
  if(_initialGoggles != "") then {
    player addGoggles _initialGoggles;
  };
  private _isMedic = player getVariable ["ace_medical_medicClass", 0];
  private _ing = if (_isMedic > 0) then { "arga_ing_medico" } else { "arga_ing_arga" };
  [player, _ing] call BIS_fnc_setUnitInsignia;
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
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/
addActionID = 0;

//hint roleDescription player;
switch (toLower roleDescription player) do {
  case "cacique @comandancia": { player execVM "roles\capitan.sqf"; };
  case "pampa": { player execVM "roles\teniente.sqf"; };
  case "matrero": { player execVM "roles\tirador_mk11.sqf"; };
  case "líder @alfa": { player execVM "roles\lider_peloton.sqf"; };
  case "líder @bravo": { player execVM "roles\lider_peloton.sqf"; };
  case "líder @charly": { player execVM "roles\lider_peloton.sqf"; };
  case "ametrallador": { player execVM "roles\ametrallador_m240.sqf"; };
  case "granadero": { player execVM "roles\granadero.sqf"; };
  case "médico": { player execVM "roles\medico.sqf"; };
  case "fusilero at": { player execVM "roles\lanzador_at.sqf"; };
  case "fusilero ra": { player execVM "roles\fusileroRA.sqf"; };
  case "fusilero": { player execVM "roles\fusilero.sqf"; };

  //default { player execVM "roles\fusilero.sqf"; };
};
