
[] execVM "scripts\3rdView_Restrictions.sqf";  //Script para limitar 3era persona

//Chequear que el jugador esté contagiado, tenga protección.

profileNamespace setVariable ["tiempoMuerte", nil];

["contagioCheck", "onEachFrame", {[] execVM "scripts\estaContagiado.sqf"}] call BIS_fnc_addStackedEventHandler;


