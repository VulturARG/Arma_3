/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

// Variable para indicar que el enemigo no nos detectó
stealthStatus = "undetected";
publicVariable "stealthStatus";

// Destruye en un radio de 450 m alrededor del camion_1 en la base Pyrgos
{ _x setdamage 1; } foreach (nearestTerrainObjects [camion_1,[],450]);
// Destruye los camiones en la base Pyrgos
{_x setDamage 1;} forEach [camion_1, camion_2,camion_3,camion_4,BP_1,BP_2,BP_3,BP_4,BP_5,BP_6];

private _Nro_Jugadores = 0;
//Cuento los jugadores a los 10 minutos de iniciado la partida
//TODO poner el tiempo en 600
waitUntil { time > 6};
private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;
_Nro_Jugadores = count _humanPlayers;

// Activo la zona EOS
//_markers,_waves,_jugadores,_angle
["M_Panagia_EOS",10,_Nro_Jugadores,45] execVM "scripts\eos\OpenMe.sqf";

// Suena la alarma cuando se destrulle el ZSU y los encubiertos pierden su cobertura 15 segundos despues
ZSU addEventHandler ["Killed", {
  "scripts\alarma.sqf" remoteExec ["execVM", 0];
}];