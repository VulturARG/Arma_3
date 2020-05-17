///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

//[] execVM "scripts\del_terrain.sqf";
/*
{
    if (!(isPlayer  _x))then
    {
        _x setSkill ["aimingAccuracy",0.05];
        _x setSkill ["aimingShake",0.99];
        _x setSkill ["aimingSpeed",0.1];
        _x setSkill ["spotDistance",0.2];
        _x setSkill ["spotTime",0.5];
        _x setSkill ["courage",0.25];
        _x setSkill ["reloadSpeed",0.25];
        _x setSkill ["commanding",0.75];
    }
}forEach allUnits;*/

//////////////////////////////////////////////////////////////////
///////////      Realizado por |ArgA|Vultur|Sdo¹    //////////////
//////////////////////////////////////////////////////////////////

// Destruye en un radio de 450 m alrededor del camion_1 en la base Pyrgos
//{ _x setdamage 1; } foreach (nearestTerrainObjects [camion_1,[],450]);
// Destruye los camiones en la base Pyrgos
//{_x setDammage 1;} forEach [camion_1, camion_2,camion_3,camion_4,BP_1,BP_2,BP_3,BP_4,BP_5,BP_6];
// Tiempo de inicio de la misión
//tiempoInicio = serverTime;
// Variables que controlan el activador por tiempo y por objetivo, para mostrar la nueva tarea
act_tiempo = true;
act_obj = true;
