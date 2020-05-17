/*
	init.sqf
	
	Descripción:
	Este script de evento corre en todas las máquinas al momento de entrar a la pantalla de briefing.

	Parámetros:
	--

	Retorna:
	--
*/

// Primera llamada a contar de parte del servidor.
if(isServer) then 
{
	[1] call FAM_fnc_contador;
};

if(isServer && isNil "init_done") then 
{
	_skillsUnits = [] call FAM_fnc_IAskill;
	[] spawn FAM_fnc_initCronometro;
	init_done = true;
    [] execVM "scripts\detectarEncubierto.sqf";
};

