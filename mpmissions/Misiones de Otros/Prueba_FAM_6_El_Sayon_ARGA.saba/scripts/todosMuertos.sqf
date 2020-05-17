/*
	todosMuertos.sqf

	Descripción:
	Este script finaliza la misión cuando todos los jugadores han muerto.

	Parámetros:
		--
	Retorna:
	--
*/

todosMuertos = true;
publicVariable "todosMuertos";

[2] call FAM_fnc_contador;
sleep 20;
["todoMuertos"] remoteExecCall ["BIS_fnc_endMissionServer"];