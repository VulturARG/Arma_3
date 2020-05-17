// Iniciando espectador para los jueces
esEspectador = player getVariable "esEspectador";

if(!isNil "esEspectador") then 
{
	//Empezar el modo espectador
	["Initialize", [player, 
	[blufor], //bando espectable
	false, //puede el jugador espectar IA?
	false, //Cámara libre?
	false, //tercera persona?
	false, //Mostrar info?
	false, //mostrar los botones para cambiar cámara?
	false, //mostrar la ayuda de teclas?
	false,  //mostrar el header?
	true] //mostrar ubicaciones de entidades?
	] call BIS_fnc_EGSpectator;
};

