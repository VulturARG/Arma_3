/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

{
    if (!(isPlayer  _x))then
    {
        _x setSkill ["aimingAccuracy",0.10];
        _x setSkill ["aimingShake",0.90];
        _x setSkill ["aimingSpeed",0.10];
        _x setSkill ["spotDistance",0.80];
        _x setSkill ["spotTime",0.70];
        _x setSkill ["courage",0.30];
        _x setSkill ["reloadSpeed",0.30];
        _x setSkill ["commanding",0.70];
    }
}forEach allUnits;

private _Nro_Jugadores = 0;

//TODO poner el tiempo en 600
//waitUntil { time > 900};

/*
_Nro_Jugadores = call MIV_fnc_countAlivePlayers;
*/

// Activo la zona EOS
//_markers,_waves,_jugadores,_angle
["",0,_Nro_Jugadores,90] execVM "scripts\eos\OpenMe.sqf";

//["scripts\screenOrder.sqf"] remoteExec ["BIS_fnc_execVM", 0, false];

//sleep 120;
//west setFriend [resistance, 0];
//resistance setFriend [west, 0];

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/
