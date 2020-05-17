/*
	initPlayerLocal

	Descripción:
	Script de evento que corre en la máquina de cada jugador al conectarse al servidor.

	Parámetros:
		0:
			_player 
					Objeto - representa al jugador en el motor.
		1:
			_didJIP
					Boolean - True si el jugador hizo JIP (join in progress), false en caso contrario
	Retorna:
	--
*/

params["_player", "_didJIP"];

if (_didJIP) then {jipeado = true} else {jipeado = false};
/****************************************** Manejadores de eventos *********************************************************************** */

// Evento de terminar de cargar
["cargado", "onPreloadFinished", 
{

	PRIMERA_LINEA = getMissionConfigValue ["PRIMERA_LINEA", "primera_linea"];
	SEGUNDA_LINEA = getMissionConfigValue ["SEGUNDA_LINEA", "segunda_linea"];

	if (!jipeado) then {[PRIMERA_LINEA, SEGUNDA_LINEA] execVM "scripts\IntroFAM.sqf"};
	[] execVM "scripts\esEspectador.sqf";
	[player] execVM "scripts\hacerVisible.sqf";
	[] execVM "scripts\initBriefing.sqf";
	[] execVM "scripts\terceraPersona.sqf";
	 

}] call BIS_fnc_addStackedEventHandler;

// Evento de muerto, para restar puntos cada vez que un jugador muera -- MOVIDO A onPlayerKilled.sqf
_player addMPEventHandler ["MPKilled", 
{
	if ( west countSide allPlayers isEqualTo 0 ) then 
	{
    	if(driver (vehicle player) != player && vehicle player in FAM_vehiculosBlufor)then{
			vehAliadoFinal = vehAliadoFinal + 1;
			["fallo", ["Se ha perdido un vehículo", '¡Restan: <t color="#ff0000">-2</t> pts!']] call BIS_fnc_showNotification; 
		};
		if(!isServer) exitWith{};

		[] execVM "scripts\todosMuertos.sqf";
	};
	
}];



/************************************ Fin manejadores ************************************************************************************ */
missionNamespace getVariable "tiempoFinal";
missionNamespace getVariable "tiempoComienzoReal";

if (isNil "tiempoFinal") then {waitUntil {!isNil "tiempoFinal"}};
if (isNil "tiempoComienzoReal") then {waitUntil !isNil "tiempoComienzoReal"};
[tiempoFinal, tiempoComienzoReal] spawn FAM_fnc_cronometro;
