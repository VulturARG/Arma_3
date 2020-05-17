private _distanciaVision = 2000;

if(hasInterface)then{
  [_distanciaVision, 800] execVM "scripts\dist_vis.sqf";
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
