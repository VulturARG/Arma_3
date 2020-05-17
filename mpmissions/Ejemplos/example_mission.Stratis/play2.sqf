_unit = _this select 0;
{_unit disableAI _x;} forEach ["ANIM","MOVE","FSM","TARGET","AUTOTARGET"];
[_unit, HLF_moveData2] spawn BIS_fnc_UnitPlay;
[_unit, HLF_fireData2, true] spawn HLF_fnc_infUnitPlayFiring;
[_unit, HLF_animData2, true] spawn HLF_fnc_infUnitPlayAnim;