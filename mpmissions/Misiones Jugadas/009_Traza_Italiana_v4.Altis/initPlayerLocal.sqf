/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

private _distanciaVision = getMissionConfigValue ["MAX_DIST_VISION", 2500];
private _initialGoggles =  getMissionConfigValue ["GAFAS_INICIALES", ""];
private _disableCustomLoadout =  getMissionConfigValue ["DESACTIVAR_EQUIPAMIENTO_PERSONALIZADO", 1];

if(hasInterface)then{
  [_distanciaVision, 800] execVM "scripts\dist_vis.sqf";
  [] execVM "scripts\3rdView Restrictions.sqf";
  waitUntil {time > 0};
  [] execVM "scripts\intro.sqf";
  removeGoggles player; //arga_rhs_pm_negro
  if(_initialGoggles != "")then{
    player addGoggles _initialGoggles;
  };
  private _isMedic = player getVariable ["ace_medical_medicClass", 0];
  if(_isMedic > 0)then{
    [player,"arga_ing_medico"] call BIS_fnc_setUnitInsignia
  };
};

player action ["SwitchWeapon", player, player, 100];

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
*******************************************************************************/