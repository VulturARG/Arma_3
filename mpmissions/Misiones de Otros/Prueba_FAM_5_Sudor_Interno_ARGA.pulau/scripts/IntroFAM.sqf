/*
	introFAM.sqf
	
	Descripción:
	Muestra una pequeña introducción con el logo de FAM y luego el título de misión que elija el editor.

	Esta función es llamada en initPlayerLocal.sqf y deben ponerse allí los atributos que pide.

	Parámetros:
		0:
			STRING - Primera línea de texto.
		1:
			STRING - Segunda línea de texto.

	Retorna:
	--
*/

params["_FAM_titulo1", "_FAM_titulo2"];

waitUntil {time > 0};
player enableSimulation false;
enableRadio false;
enableEnvironment false;

titleText ["","BLACK",0.01];

waitUntil {!isNull player && player == player};

2 cutRsc ["RscLogoB","BLACK",0.01];
titleText ["","BLACK IN",2];
sleep 3;
titleText ["","BLACK OUT",2];
sleep 1;
2 cutFadeOut 0;
titleText ["","BLACK IN",2];

enableEnvironment true;
enableRadio true;

//sleep 15;
["BIS_blackStart", false] call BIS_fnc_blackOut;

// Nombre de la misión
sleep 2;
any= [_FAM_titulo1,_FAM_titulo2] spawn BIS_fnc_infoText;
sleep 5;
["BIS_blackStart", true] call BIS_fnc_blackIn;
player enableSimulation true;

if(isNil "introDone") then
{
	introDone = true;
	publicVariableServer "introDone";
};
