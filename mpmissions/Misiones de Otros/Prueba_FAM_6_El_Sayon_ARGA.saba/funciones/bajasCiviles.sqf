/*
	bajasCiviles.sqf
	
	Descripción:
	crea un manejador de eventos extendido para que incluso los civiles creados de forma aleatoria 
	sumen a la penalización en caso de resultar muertos durante el tiroteo.

	Parámetros:
		0:
			_unit 
					OBJETO - Representa a el objeto del civil que fallece.

	Retorna:
	--
*/

params ["_unit"];

if ((side _unit == civilian) AND (!isPlayer _unit)) then 
{
	_unit addEventHandler ["killed", 
	{
		params["_name"];
		["fallo", ["¡Un civil ha muerto en el fuego cruzado!", 'Cada baja civil resta: <t color="#ff0000">-2</t> pts']] remoteExecCall ["BIS_fnc_showNotification", 0, false];
		civilesFinal = civilesFinal + 1;
		publicVariable "civilesFinal";

	}];
};
