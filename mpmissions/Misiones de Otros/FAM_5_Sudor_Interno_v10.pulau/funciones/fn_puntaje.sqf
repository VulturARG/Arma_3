/*
	FAM_fnc_puntaje
	
	Descripción:
	Maneja y transmite el puntaje cada vez que se logra un objetivo. La idea es que el editor cree su 
	activador para detectar cuándo su objetivo se cumplió para llamar a esta función.

	Parámetros:
		0:
			INTEGER - cantidad de puntos a otorgar.
		1:
			INTEGER - Tipo de objetivo, 1 para primarios, 2 para secundarios y 3 para tareas.

	Retorna:
	--
*/

params["_puntos", "_tipo"]; 

//Separa el caso para cada tipo

switch _tipo do 
{
  case 1: 
  {
	objetivoPrimario = objetivoPrimario + _puntos;
	publicVariable "objetivoPrimario";
	["objetivocumplido", ["¡Objetivo Primario cumplido!", format['¡Suman: <t color="#7CFC00">+%1</t> pts!', _puntos]]] remoteExecCall ["BIS_fnc_showNotification"];
	
  };
  case 2: 
  {
	objetivoSecundario = objetivoSecundario + _puntos;
	publicVariable "objetivoSecundario";
	["objetivocumplido", ["¡Objetivo Secundario cumplido!", format['¡Suman: <t color="#7CFC00">+%1</t> pts!', _puntos]]] remoteExecCall ["BIS_fnc_showNotification"];
  };
  case 3:
  {
	objetivoTarea = objetivoTarea + _puntos;
	publicVariable "objetivoTarea";
	["objetivocumplido", ["¡Tarea cumplida!", format['¡Suman: <t color="#7CFC00">+%1</t> pts!', _puntos]]] remoteExecCall ["BIS_fnc_showNotification"];
  };
};