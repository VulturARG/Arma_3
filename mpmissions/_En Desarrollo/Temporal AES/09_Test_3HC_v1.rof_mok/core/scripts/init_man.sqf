/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params ["_unit"];

if (isNil "_unit") exitWith { };

if (!isPlayer _unit) exitWith { };

_unit action ["SwitchWeapon", _unit, _unit, 100];
_unit disableAI "ALL";
//_unit allowDamage false;

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/