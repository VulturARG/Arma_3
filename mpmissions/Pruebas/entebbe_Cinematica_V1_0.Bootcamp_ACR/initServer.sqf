///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

[] execVM "scripts\del_terrain.sqf";

{
    if (!(isPlayer  _x))then
    {
        _x setSkill ["aimingAccuracy",0.1];
        _x setSkill ["aimingShake",0.99];
        _x setSkill ["aimingSpeed",0.1];
        _x setSkill ["spotDistance",0.2];
        _x setSkill ["spotTime",0.5];
        _x setSkill ["courage",0.25];
        _x setSkill ["reloadSpeed",0.25];
        _x setSkill ["commanding",0.75];
    }
}forEach allUnits;


///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
