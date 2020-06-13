/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

private _Nro_Jugadores = 0;
//Cuento los jugadores a los 8 minutos de iniciado la partida
waitUntil { time > 480};//600
private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;
_Nro_Jugadores = count _humanPlayers;

//Apago las torres y suena la alarma entre 8.5 y 11.5 minutos de iniciado la partida
waitUntil { time > random[510,600,690]}; 
"alarma" remoteExec ["playSound", 0];
_luces = [Luz_1,Luz_2,Luz_3,Luz_4,Luz_5,Luz_6,Luz_7];
{
    _x setDamage 0.93;
} forEach _luces;

// Activo la zona EOS
//_markers,_waves,_jugadores,_angle
[["Traza_Italiana"],10,_Nro_Jugadores,360] execVM "eos\OpenMe.sqf";