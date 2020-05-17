private _distanciaVision = 4000;

if(hasInterface)then{
  [_distanciaVision, 4000] execVM "scripts\dist_vis.sqf";
  [] execVM "scripts\3rdView Restrictions.sqf";
  waitUntil {time > 0};
  [] execVM "scripts\intro.sqf";
  removeGoggles player;
  //player addGoggles "arga_rhs_pm_negro"; //Si quieren aparecer con algun accesorio facil, si no, comentar la linea con //
  private _isMedic = player getVariable ["ace_medical_medicClass", 0];
  if(_isMedic == 1 || _isMedic == 2)then{
    [player,"arga_ing_medico"] call BIS_fnc_setUnitInsignia
  };
};

player action ["SwitchWeapon", player, player, 100]; 

[missionNamespace, "arsenalOpened", {
disableSerialization;
params ["_display"];
_display displayAddEventHandler ["keydown", "_this select 3"];
{
(_display displayCtrl _x) ctrlShow false
} forEach [44151, 44150, 44146, 44147, 44148, 44149, 44346];
}] call BIS_fnc_addScriptedEventHandler;