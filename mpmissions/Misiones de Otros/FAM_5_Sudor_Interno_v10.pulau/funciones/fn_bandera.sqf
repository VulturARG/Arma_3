/*
	FAM_fnc_bandera
	
	Descripción:
	Agrega a la bandera FAM la capacidad de izarla para acabar el tiempo y terminar la misión.

	Parámetros:
		--

	Retorna:
	--
*/

[banderaFAM, //Nombre del objeto
"Terminar Partida", // Titulu de la acción
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", //El icono que se mostrara en pantalla (chequeara descripcion para este icono)
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", // Icono de progreso mostrado en pantalla (cambios de icono cuando inicia la accion)
"player distance banderaFAM < 5", // La condicion para la accion a mostrar
"player distance banderaFAM < 5", // La condicion para la accion en progreso
{	
	_altura = flagAnimationPhase banderaFAM;
	while {_altura < 1} do 
	
	{
		banderaFAM setFlagAnimationPhase _altura;
		_altura = _altura + 0.1;
		sleep 0.2
	};
}, // El codigo ejecutado cuando la accion inicia (esto no sera usado por el momento)
{}, // El codigo ejecutado en todo el tick del progreso (eso no sera usado por ahora)
{
	detenerTiempo = true; 
	publicVariable "detenerTiempo";
	[2] remoteExecCall ["FAM_fnc_contador", 2];
	sleep 20;

	if(publicTimerOver) then 
	{
		["sinTiempo"] remoteExecCall ["BIS_fnc_endMissionServer"];
	}; 
	
	if (!publicTimerOver) then
	{
		["EveryoneWon"] remoteExecCall ["BIS_fnc_endMissionServer"]; 
	};
	
}, //El codigo ejecutado para completar
{hint "Manten Presionado para finalizar la misión"},  //El codigo ejecutado cuando el jugador es interrumpido (jugador le va por la key)
[], // Argumentos pasados al Script (eso no sera usado por el momento)
1, // la duracion (como sera de largo el proceso de accion para completar en segundos)
0, // prioridad (seguro sobre dejar esto en 0)
true, // Elimina la accion cuando la misma ya ha sido completada (true o false)
false // Muestra en estado inconciente (tener seguro dejar esto en false para que trabaje)
] remoteExec ["BIS_fnc_holdActionAdd", [0,-2] select isDedicated, true]; //Esto permite el trabajo en el server!
