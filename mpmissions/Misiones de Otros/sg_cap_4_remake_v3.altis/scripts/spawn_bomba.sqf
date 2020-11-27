/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params ["_marker"];

Minas =
{
  params ["_marker"];
  _mina = createVehicle ["Bo_GBU12_LGB_MI10", (getMarkerPos _marker),[],0,"NONE"];
  _mina setDamage 1;
  //"M_RPG32_AA_F" createVehicle (getMarkerPos (_this select 0));
};

_marker call Minas;
/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/