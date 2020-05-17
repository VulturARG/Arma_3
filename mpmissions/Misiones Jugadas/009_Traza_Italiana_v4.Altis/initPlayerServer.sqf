/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/
private _disbleGroupIA = getMissionConfigValue ["DESACTIVAR_IA_DE_GRUPO", 1];
private _disableBluforIA = getMissionConfigValue ["DESACTIVAR_TODO_BLUFOR", 0];
// Deshabilita el movimiento de la IA para todas las IA que 
// esten en el mismo grupo que un jugador humano
if(_disbleGroupIA == 1)then{
  private _group = (group player);
  {
    _x disableAI "move";
    _x setUnitPos "middle";
  } forEach units _group;
};

if(_disableBluforIA == 1)then{
  {
    if(side _X == west)then{
      _x disableAI "move";
      _x setUnitPos "middle";
    };
  }foreach allUnits;
};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/