/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

private _maxDistanciaVision      = getMissionConfigValue ["MAX_DIST_VISION", 4000];
private _minDistanciaVision      = getMissionConfigValue ["MIN_DIST_VISION", 800];
private _initialGoggles          = getMissionConfigValue ["GAFAS_INICIALES", ""];
private _disableCustomLoadout    = getMissionConfigValue ["DESACTIVAR_EQUIPAMIENTO_PERSONALIZADO", 1] == 1;
private _disableGroupIA          = getMissionConfigValue ["DESACTIVAR_IA_DE_GRUPO", 1] == 1;
private _disableBluforIA         = getMissionConfigValue ["DESACTIVAR_TODO_BLUFOR", 0] == 1;
private _enableArtilleryComputer = getMissionConfigValue ["ACTIVAR_COMPUTADORA_ARTILLERIA",  1] == 1;
private _enablestealthCoef       = getMissionConfigValue ["ACTIVAR_COEFICIENTES_CAMUFLAJE",  0] == 1;
private _hearingCoef             = getMissionConfigValue ["COEFICIENTE_AUDICION", 1];
private _camouflageCoef          = getMissionConfigValue ["COEFICIENTE_CAMUFLAJE", 1];
private _enableAcreSetup         = getMissionConfigValue ["ACTIVAR_SETUP_PERSONALIZADO_RADIOS",  1] == 1;

setTerrainGrid 25;

if (hasInterface) then {
  MANDI_ENABLE_DIST = true;
  [_maxDistanciaVision, _minDistanciaVision] execVM "core\scripts\view_distance.sqf";
  execVM "core\scripts\check_view.sqf";
  execVM "core\scripts\init_intro.sqf";
  execVM "core\scripts\setBriefing.sqf";
  call MIV_fnc_setInsignia;
  removeGoggles player;
  if(_initialGoggles != "") then {
    player addGoggles _initialGoggles;
  };
};

enableEngineArtillery (_enableArtilleryComputer);

// Deshabilita el movimiento de la IA para todas las IA que 
// esten en el mismo grupo que un jugador humano
if(_disableGroupIA) then {
  private _units = units (group player);
  {
    if (local _x && !isPlayer _x) then {
      doStop _x;
      _x disableAI "MOVE";
      _x action ["SwitchWeapon", _x, _x, 100];
      // _x enableSimulationGlobal false;
      // _x hideObjectGlobal true;
    };
  }foreach _units;
};

if (_disableBluforIA) then {
  {
    if (side _x == west && local _x && !isPlayer _x) then {
      doStop _x;
      _x disableAI "MOVE";
      _x action ["SwitchWeapon", _x, _x, 100];
      // _x enableSimulationGlobal false;
      // _x hideObjectGlobal true;
    };
  }foreach allUnits;
};

// Deshabilita las opciones de Cargar y Guardar Equipo en el arsenal
if(_disableCustomLoadout) then {
  [missionNamespace, "arsenalOpened", {
    disableSerialization;
    params ["_display"];
    _display displayAddEventHandler ["keydown", "_this select 3"];
    {
      (_display displayCtrl _x) ctrlShow false
    } forEach [44151, 44150, 44146, 44147, 44148, 44149, 44346];
  }] call BIS_fnc_addScriptedEventHandler;
};

doStop player;
player disableAI "MOVE";
player action ["SwitchWeapon", player, player, 100];

if (_enablestealthCoef) then {
  player setUnitTrait ["audibleCoef ",_hearingCoef];
  player setUnitTrait ["camouflageCoef  ",_camouflageCoef];
};

if (_enableAcreSetup) then {
  execVM "core\scripts\setup_ACRE2_displays.sqf";
};

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
