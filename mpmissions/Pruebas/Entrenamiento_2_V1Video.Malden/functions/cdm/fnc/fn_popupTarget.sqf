/*
	Pops up all targets in trigger radious (trigger A axis).

    Parameters:

        marker
*/
params ["_marker"];
private ["_marker", "_pos", "_radious"];

_pos = getMarkerPos _marker;
_size = (getMarkerSize _marker);
_radious = _size select 0;

{
  _x setDamage 0;
  _x animate ["terc", 0];
  if (typeOf _x == "Land_Target_Oval_Wall_Left_F") then {
    _x animate ["left_rotate", 0];
    _x animate ["target_left_rotate", 0];
  }
} forEach (_pos nearObjects ["TargetBase", _radious]);

true;
