/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

private _disableGroupIA = getMissionConfigValue ["DESACTIVAR_IA_DE_GRUPO", 1];
private _disableBluforIA = getMissionConfigValue ["DESACTIVAR_TODO_BLUFOR", 0];
private _standMedico = getMissionConfigValue ["STAND_MEDICO", objNull];
private _standIngeniero = getMissionConfigValue ["STAND_INGENIERO", objNull];
private _standPiloto = getMissionConfigValue ["STAND_PILOTO", objNull];
_standMedico = missionNamespace getVariable [_standMedico, objNull];
_standIngeniero = missionNamespace getVariable [_standIngeniero, objNull];
_standPiloto = missionNamespace getVariable [_standPiloto, objNull];

setTerrainGrid 25;

[] execVM "scripts\civiles.sqf";

[] execVM "scripts\setBriefing.sqf";

if(! isNil "roles") then {
  [roles] execVM "scripts\init_roles.sqf";
};

[_standMedico, _standIngeniero, _standPiloto] execVM "scripts\init_stands.sqf";

[] execVM "scripts\init_vcom_driving.sqf";

player disableAI "MOVE";
player action ["SwitchWeapon", player, player, 100];
player setUnitPos "middle";

// Deshabilita el movimiento de la IA para todas las IA que 
// esten en el mismo grupo que un jugador humano
if(_disableGroupIA == 1)then{
  private _units = units (group player);
  {
    if(local _x) then {
      _x disableAI "MOVE";
      _x action ["SwitchWeapon", _x, _x, 100];
      _x setUnitPos "middle";
    };
  }foreach _units;
};

if(_disableBluforIA == 1) then {
  {
    if(side _x == west && local _x) then {
      _x disableAI "MOVE";
      _x action ["SwitchWeapon", _x, _x, 100];
      _x setUnitPos "middle";
    };
  }foreach allUnits;
};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/
