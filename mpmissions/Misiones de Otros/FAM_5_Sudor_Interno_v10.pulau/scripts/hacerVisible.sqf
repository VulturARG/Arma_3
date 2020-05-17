/*
	hacerVisible.sqf
	
	Descripción:
	Este script hace visible a los jugadores luego de una reconexión.

	Parámetros:
		0:
			OBJETO - Objeto que representa al jugador en el mundo. 

	Retorna:
	--
*/

params ["_jugador"];

//Esperando que el jugador esté definido en el mundo.
waitUntil { not isNull player };

[_jugador, false] remoteExec ["hideObjectGlobal", 2];
player allowDamage true;
diag_log format["%1 es ahora visible y perece al daño", name player];