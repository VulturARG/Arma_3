/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

private _Nro_Jugadores = 0;
//Cuento los jugadores a los 10 minutos de iniciado la partida
waitUntil { time > 600};
private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;
_Nro_Jugadores = count _humanPlayers;

// Activo la zona EOS
//_markers,_waves,_jugadores,_angle
["M_Panagia_EOS",10,_Nro_Jugadores,45] execVM "eos\OpenMe.sqf";

// Suena la alarma cuando se destrulle el ZSU y los encubiertos pierden su cobertura 15 segundos despues
ZSU addEventHandler ["Killed", {
  "scripts\alarma.sqf" remoteExec ["execVM", 0];
}];
