/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

private _Nro_Jugadores = 0;
//Cuento los jugadores a los 10 minutos de iniciado la partida
//TODO poner el tiempo en 600
//waitUntil { time > 600};
/*
private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;
_Nro_Jugadores = count _humanPlayers;
*/

// Activo la zona EOS
//_markers,_waves,_jugadores,_angle
["",0,_Nro_Jugadores,90] execVM "scripts\eos\OpenMe.sqf";

//execVM "scripts\timeOrderFinish.sqf";

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/
