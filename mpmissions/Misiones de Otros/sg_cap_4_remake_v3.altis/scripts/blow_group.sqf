/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params ["_vehicle"];

private _group = group leader _vehicle;

{
	_x allowDamage true;	
} forEach units _group;

_vehicle allowDammage true;

_vehicle setDamage 1;

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/