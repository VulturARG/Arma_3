/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params ["_chair", "_unit"];

[_unit, "Crew"] remoteExec "MAC_fnc_switchMove";

_unit setPos (getPos _chair);
_unit setDir ((getDir _chair) - 180);
standup = _unit addAction ["<t color='#E1E163'>Pararse</t>","scripts\standup.sqf"];
_unit setPos [getPos _unit select 0, getPos _unit select 1,((getPos _unit select 2) + 1)];

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/
