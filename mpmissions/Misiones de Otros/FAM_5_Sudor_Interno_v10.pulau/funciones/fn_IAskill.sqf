/*
	FAM_fnc_IAskill
	
	Descripción:
	Fija la habilidad de la IA en el servidor.

	Parámetros:
		--

	Retorna:
	--
*/
{ 
	if (!(isPlayer _x))then { 
		_x setSkill ["aimingAccuracy",0.20]; 
		_x setSkill ["aimingShake",0.15]; 
		_x setSkill ["aimingSpeed",0.50]; 
		_x setSkill ["spotDistance",0.70]; 
		_x setSkill ["spotTime",0.50]; 
		_x setSkill ["courage",1]; 
		_x setSkill ["reloadSpeed",1]; 
		_x setSkill ["commanding",1]; 
	} 

} forEach allUnits;