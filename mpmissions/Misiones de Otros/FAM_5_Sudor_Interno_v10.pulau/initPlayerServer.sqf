/*
	initPlayerServer.sqf
	
	Descripción:
	Este script de evento corre en el servidor cada vez que un cliente se conecta al mismo (antes de inicializar y 
	tener personaje).

	Parámetros:
		0:
			OBJETO - Representa el objeto con que se define el cliente que conecta.
		1:
			BOOLEAN - Es true si el cliente que conecta es JIP (conectó después de la pantalla de briefing).

	Retorna:
	--
*/

params["_player", "_didJip"];

if(time < 900) then 
{
	[1] call FAM_fnc_contador;
};

// Toma la ID del jugador que acaba de conectar y transmite el valor de las variables de sistema y misión
if (_didJip) then 
{
	_idPlayer = owner _player;

	_idPlayer publicVariableClient "objetivoPrimario";
	_idPlayer publicVariableClient "objetivoSecundario";
	_idPlayer publicVariableClient "objetivoTarea";
	_idPlayer publicVariableClient "vehEnemigoFinal";
	_idPlayer publicVariableClient "vehAliadoFinal";
	_idPlayer publicVariableClient "bonoBandera";
	_idPlayer publicVariableClient "triggerBandera";
	_idPlayer publicVariableClient "penaTiempo";
	_idPlayer publicVariableClient "jugadoresFinal";
	_idPlayer publicVariableClient "civilesFinal";
	_idPlayer publicVariableClient "detenerTiempo";
	_idPlayer publicVariableClient "tiempoComienzoReal";
	_idPlayer publicVariableClient "tiempoFinal";

	/* 
	***********************************************
			ESPACIO PARA VARIABLES DE MISIÓN
	************************************************
	*/
	_idPlayer publicVariableClient "FAM_descubierto";

	/* 
	***********************************************
			ESPACIO PARA VARIABLES DE MISIÓN
	************************************************
	*/
	_idPlayer publicVariableClient "variablesIniciadas";
};


