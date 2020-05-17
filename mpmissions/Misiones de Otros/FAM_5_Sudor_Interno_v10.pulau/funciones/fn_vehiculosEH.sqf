/*
	FAM_fnc_vehiculosEH
	
	Descripción:
	Agrega un eventHandler a todos los vehículos definidos en la misión como BLUFOR u OPFOR para
	manejar de forma automática el agregar o quitar puntajes al momento de su destrucción.

	Para que el sistema considere vehículos BLUFOR, deben nombrarse: bluforVeh_x donde X es un número cualquiera.
	Para que el sistema considere vehículos OPFOR, deben nombrarse: opforVeh_x donde X es un número cualquiera.

	Parámetros:
		--
	Retorna:
	--
*/

FAM_vehiculosBlufor = allVariables missionNamespace select {_x find "bluforveh" == 0};
FAM_vehiculosBlufor = FAM_vehiculosBlufor apply {missionNameSpace getVariable _x};
publicVariable "FAM_vehiculosBlufor";

FAM_vehiculosOpfor = allVariables missionNamespace select {_x find "opforveh" == 0};
FAM_vehiculosOpfor = FAM_vehiculosOpfor apply {missionNameSpace getVariable _x};
publicVariable "FAM_vehiculosOpfor";

FAM_vehiculosBlufor apply{
	_x addMPEventHandler ["mpkilled", {
		vehAliadoFinal = vehAliadoFinal + 1; 
		//["fallo", ["Se ha perdido un vehículo", '¡Restan: <t color="#ff0000">-2</t> pts!']] remoteExecCall ["BIS_fnc_showNotification"];
		["fallo", ["Se ha perdido un vehículo", '¡Restan: <t color="#ff0000">-2</t> pts!']] call BIS_fnc_showNotification;
	}];
};

FAM_vehiculosOpfor apply{
	_x addMPEventHandler ["mpkilled", {
		vehEnemigoFinal = vehEnemigoFinal + 1; 
		//["fallo", ["Se ha perdido un vehículo", '¡Restan: <t color="#ff0000">-2</t> pts!']] remoteExecCall ["BIS_fnc_showNotification"];
		["objetivoCumplido", ["Se ha destruído un vehículo enemigo", '¡Suman: <t color="#7CFC00">+2</t> pts!']] call BIS_fnc_showNotification;
	}];
};
