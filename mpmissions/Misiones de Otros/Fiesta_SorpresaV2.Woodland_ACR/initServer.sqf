[] execVM "scripts\del_terrain.sqf";

setTimeMultiplier 1;

{
    if (!(isPlayer  _x))then
    {
        _x setSkill ["aimingAccuracy",0.3];
        _x setSkill ["aimingShake",0.3];
        _x setSkill ["aimingSpeed",0.5];
        _x setSkill ["spotDistance",0.3];
        _x setSkill ["spotTime",0.5];
        _x setSkill ["courage",0.7];
        _x setSkill ["reloadSpeed",0.5];
        _x setSkill ["commanding",0.5];
    }
}forEach allUnits;

