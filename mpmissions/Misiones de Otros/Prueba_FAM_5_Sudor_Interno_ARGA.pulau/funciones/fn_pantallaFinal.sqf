/*
	FAM_fnc_pantallaFinal
	
	Descripción:
	Llama y escribe los datos que aparecen en la pantalla de resultado final.

	Parámetros:
	--
	Retorna:
	--
*/

["LeadTrack01_F_Malden",2,1] call BIS_fnc_playMusic; //Canción elegante

if(isNil "PuntajeFinal") then {waitUntil {!isNil "PuntajeFinal"}};

createDialog "FAM_pantallaFinal";
//Bonos
ctrlSetText [123401, format ["Objetivos Primarios: %1", objetivoPrimario]];
ctrlSetText [123402, format ["Objetivos Secundarios: %1", objetivoSecundario]];
ctrlSetText [123403, format ["Tareas: %1", objetivoTarea]];
ctrlSetText [123404, format ["Vehículos Neutralizados: %1", vehEnemigoFinal]];
ctrlSetText [123405, format ["Bono Bandera: %1", bonoBandera]];
//Penas
ctrlSetText [123406, format ["Bajas Aliadas: %1", jugadoresFinal]];
ctrlSetText [123407, format ["Bajas Civiles: %1", civilesFinal]];
ctrlSetText [123408, format ["Vehículos Perdidos: %1", vehAliadoFinal]];
ctrlSetText [123409, format ["Penalización Tiempo: %1", penaTiempo]];
//Puntaje final 
ctrlSetText [123410, format ["Puntaje Final: %1", PuntajeFinal]];

//////////////////////////////////////////////////////////////////////////////
/* Por alguna razón esto no funciona para terminar la misión :S 

while {true} do 
{
	if(!dialog) then 
	{
		["EveryoneWon"] remoteExecCall ["BIS_fnc_endMissionServer", player, true] 
	};
};

*/////////////////////////////////////////////////////////////////////////////

/* AYUDA MEMORIA

123401 = OBJETIVOS PRIMARIOS 
123402 = OBJETIVOS SECUNDARIOS 
123403 = TAREAS 
123404 = VEHICULOS NEUTRALIZADOS (+2 x cada 1)
123405 = BONO BANDERA (+5 si todos en la bandera)

123406 = BAJAS ALIADAS (-1)
123407 = BAJAS CIVILES (-2 x cada 1)
123408 = VEHICULOS PERDIDOS (-2 x cada 1)
123409 = PENALIZACIÓN TIEMPO (-10)

123410 = PUNTAJE FINAL (sumatoria bonos - penalizaciones)
*/ 
