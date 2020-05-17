private _distanciaVision = 5000;

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

  //////////////////////////////////////////////////////////////////
  ///////////      Realizado por |ArgA|Vultur|Sdo¹    //////////////
  //////////////////////////////////////////////////////////////////

  // Los jugadores no pueden recibir daño al inicio de la misión
  //player allowDamage false;
  // GPS en Mapa
  nul = [] execVm "scripts\gpsMap.sqf";
  // Empieza el jugador con el arma baja
  //player action ["WeaponOnBack", player];

  // Empieza el jugador con el arma en la espalda
  player action ["SwitchWeapon", player, player, 100];
};
