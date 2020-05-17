

{  //Script para configuracion de dificultad de los enemigos
    if (!(isPlayer  _x))then
    {
        _x setSkill ["aimingAccuracy",0.60];
        _x setSkill ["aimingShake",0.60];
        _x setSkill ["aimingSpeed",0.30];
        _x setSkill ["spotDistance",0.35];
        _x setSkill ["spotTime",0.30];
        _x setSkill ["courage",0.80];
        _x setSkill ["reloadSpeed",0.70];
        _x setSkill ["commanding",0.80];
    }
}forEach allUnits;
