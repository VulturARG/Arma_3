/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

private _Nro_Jugadores = 0;
//Cuento los jugadores a los 10 minutos de iniciado la partida
waitUntil { time > 6};
private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;
_Nro_Jugadores = count _humanPlayers;
// Activo la zona EOS
["M_Panagia_EOS",45,_Nro_Jugadores,10] execVM "eos\OpemMe.sqf";

