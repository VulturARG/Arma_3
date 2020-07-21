/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

private _distanciaVision = getMissionConfigValue ["MAX_DIST_VISION", 4000];
private _initialGoggles =  getMissionConfigValue ["GAFAS_INICIALES", ""];
private _disableCustomLoadout =  getMissionConfigValue ["DESACTIVAR_EQUIPAMIENTO_PERSONALIZADO", 1] == 1;
private _intro = getMissionConfigValue ["INTRO", 2];
private _disableGroupIA = getMissionConfigValue ["DESACTIVAR_IA_DE_GRUPO", 1] == 1;
private _disableBluforIA = getMissionConfigValue ["DESACTIVAR_TODO_BLUFOR", 0] == 1;
private _enableArtilleryComputer = getMissionConfigValue ["ACTIVAR_COMPUTADORA_ARTILLERIA",  1] == 1;

setTerrainGrid 25;

if (hasInterface) then {
  MANDI_ENABLE_DIST = true;
  [_distanciaVision, 800] execVM "scripts\view_distance.sqf";
  execVM "scripts\check_view.sqf";
  if (_intro != 0) then {
    [_intro] execVM "scripts\init_intro.sqf";
  };
  removeGoggles player; //arga_rhs_pm_negro
  if(_initialGoggles != "") then {
    player addGoggles _initialGoggles;
  };
  private _isMedic = player getVariable ["ace_medical_medicClass", 0];
  private _ing = if (_isMedic > 0) then { "arga_ing_medico" } else { "arga_ing_arga" };
  [player, _ing] call BIS_fnc_setUnitInsignia;
  execVM "scripts\setBriefing.sqf";
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

// player enableSimulationGlobal true;
// player hideObjectGlobal false;

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/
// Quito el DARG y el microDARG del inventario de los jugadores
//player removeItem "ACE_DAGR";
//player removeItem "ACE_microDAGR";

// GPS en Mapa
nul = [] execVM 'vultur\GPS_II.sqf';
