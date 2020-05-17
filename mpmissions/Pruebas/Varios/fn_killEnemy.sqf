/*
************************************************
@Editor:    Redburn
@Para:      FAM
@Date:      27/10/2018
@Version:   NONE
************************************************
*/

//////////////////////////////////////////////////////////////////////////////////////////////////////

//FAM_DeadCivilianCount = 0;
//publicVariable "FAM_DeadCivilianCount";

FAM_DeadPlayerCount = 0;
publicVariable "FAM_DeadPlayerCount";

FAM_DeadPEnemyCount = 0;
publicVariable"FAM_DeadPEnemyCount";

{

  if (side _x == Civilian && _x iskindof "Man") then {
    _x addEventHandler ["killed",
    {
      [2,4] call FAM_fnc_puntaje;

    }];
  };

  if (side _x == EAST && _x iskindof "Man") then {
    _x addEventHandler ["killed",
    {

      FAM_DeadPEnemyCount = FAM_DeadPEnemyCount + 1;
      publicVariable "FAM_DeadPEnemyCount";
      hint "Enemy Eliminated";
      if (FAM_DeadPEnemyCount == 1) then {
      [6,3] call FAM_fnc_puntaje;
      //["tareaTres", ["20 Enemigos Muertos. Reciben 2 Puntos!"]] remoteExecCall ["BIS_fnc_showNotification"];
      publicVariable "FAM_DeadPEnemyCount";

      }
    }];
  };

    if (side _x == WEST && _x iskindof "Man") then {

    };

} foreach allunits;

{
_x addEventHandler ["MPKilled",
      {
        ["JugadorDead", ["Miembro de equipo Muerto. Penzalización -1 Puntos!"]] remoteExecCall ["BIS_fnc_showNotification"];
        FAM_DeadPlayerCount = FAM_DeadPlayerCount + 1;
        publicvariable "FAM_DeadPlayerCount";

      }];
} forEach playableUnits;

//objetivoTarea = objetivoTarea + 2;
      //publicVariable "objetivoTareaTres";
