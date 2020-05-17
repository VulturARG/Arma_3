/*
	FAM_fnc_initCronometro
	
	Descripción:
	Inicializa el conteo de tiempo sincronizado utilizando serverTime como referencia.
	
	tiempoComienzoMision = momento exacto en que el primer jugador dejó de cargar y está en control de su personaje.
	tiempoFinal    = el momento en que la misión debería quedar sin tiempo.

	Parámetros:
	--
	Retorna:
	--
*/

TIEMPO_MISION = getMissionConfigValue ["TIEMPO_MISION", 7200];

if(isServer) then 
{
	comienzoMision = serverTime;
	waitUntil {!isNil "introDone"};

	tiempoComienzoReal = serverTime;
	publicVariable "tiempoComienzoReal";
	tiempoFinal = tiempoComienzoReal + TIEMPO_MISION;
	publicVariable "tiempoFinal";
	[tiempoFinal, tiempoComienzoReal] spawn FAM_fnc_cronometro;
};
