/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

params [["_standMedico", objNull], ["_standIngeniero", objNull], ["_standPiloto", objNull]];

// Stand ingeniero
if(!isNull _standIngeniero) then {
	_standIngeniero setObjectTexture [0, "imgs\ingeniero.paa"];

	_standIngeniero addAction ["<t color='#fcba03'>Hacer Ingeniero</t>", {  
			params ["_target", "_caller", "_actionId", "_arguments"];  
			_caller setVariable ["ace_medical_medicClass", 2, true]; 
			hint "Ahora sos ingeniero!"; 
			}, [], 1.5, true, true, "", "true", 4, false, "", "" 
	];

	_standIngeniero addAction ["Cancelar especialidades", {  
			params ["_target", "_caller", "_actionId", "_arguments"];  
			_caller setVariable ["ACE_IsEngineer", 0,true]; 
			_caller setVariable ["ACE_isEOD", false, true]; 
			_caller setVariable ["ace_medical_medicClass", 0, true]; 
			_caller setVariable ["ACE_GForceCoef", 1]; 
			[_caller,"arga_ing_arga"] call BIS_fnc_setUnitInsignia; 
			hint "Cancelaste tus especialidades!"; 
			}, [], 1.5, true, true, "", "true", 4, false, "", ""  
	];
};
////////////////////////////////////////////////////////////////////////////////

// Stand medico
if(!isNull _standMedico) then {
	_standMedico setObjectTexture [0, "imgs\medico.paa"];

	_standMedico addAction ["<t color='#f03f3c'>Hacer Médico</t>", {  
			params ["_target", "_caller", "_actionId", "_arguments"];  
			_caller setVariable ["ace_medical_medicClass", 2, true];
			[_caller,"arga_ing_medico"] call BIS_fnc_setUnitInsignia; 
			hint "Ahora sos médico!"; 
			}, [], 1.5, true, true, "", "true", 4, false, "", ""  
	];

	_standMedico addAction ["Cancelar especialidades", {  
			params ["_target", "_caller", "_actionId", "_arguments"];  
			_caller setVariable ["ACE_IsEngineer", 0,true]; 
			_caller setVariable ["ACE_isEOD", false, true]; 
			_caller setVariable ["ace_medical_medicClass", 0, true]; 
			_caller setVariable ["ACE_GForceCoef", 1]; 
			[_caller,"arga_ing_arga"] call BIS_fnc_setUnitInsignia; 
			hint "Cancelaste tus especialidades!"; 
			}, [], 1.5, true, true, "","true", 4, false, "", ""  
	];
};
////////////////////////////////////////////////////////////////////////////////

// Stand piloto
if(!isNull _standPiloto) then {
	_standPiloto setObjectTexture [0, "imgs\piloto.paa"];

	standPiloto addAction ["<t color='#55bef2'>Hacer Piloto</t>", { 
			params ["_target", "_caller", "_actionId", "_arguments"]; 
			_caller setVariable ["ACE_GForceCoef", 0]; 
			hint "Ahora sos piloto"
			}, [], 1.5, true, true, "", "true", 4, false, "", "" 
	];

	_standPiloto addAction ["Cancelar especialidades", {  
			params ["_target", "_caller", "_actionId", "_arguments"];  
			_caller setVariable ["ACE_IsEngineer", 0,true]; 
			_caller setVariable ["ACE_isEOD", false, true]; 
			_caller setVariable ["ace_medical_medicClass", 0, true]; 
			_caller setVariable ["ACE_GForceCoef", 1]; 
			[_caller,"arga_ing_arga"] call BIS_fnc_setUnitInsignia; 
			hint "Cancelaste tus especialidades!"; 
			}, [], 1.5, true, true, "", "true", 4, false, "", ""  
	];
};
////////////////////////////////////////////////////////////////////////////////

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/