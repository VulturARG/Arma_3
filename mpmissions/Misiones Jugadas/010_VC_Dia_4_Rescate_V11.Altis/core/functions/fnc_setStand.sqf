/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params [["_stand", objNull], ["_rol", ""]];

if(!isNull _stand) then {

	private _img = format ["core\imgs\%1.paa", _rol];
	private _var = "";
	private _value = "";
	private _notFound = false;

	switch ((toLower _rol)) do {
		case "ingeniero": {
			_var = "ACE_IsEngineer";
			_value = 1;
		};
		case "medico": {
			_var = "ace_medical_medicClass";
			_value = 2;
		};
		case "piloto": {
			_var = "ACE_GForceCoef";
			_value = 0.4;
		 };
		default {
			_notFound = true;
		};
	};

	if (_notFound) exitWith { };

	_stand setObjectTexture [0, _img];

	_stand addAction ["<t color='#fcba03'>Hacer " + _rol + "</t>", {  
			params ["_target", "_caller", "_actionId", "_arguments"]; 
			_arguments params ["_rol", "_var", "_value"];
			_caller setVariable [_var, _value, true];
			if ((toLower _rol) == "ingeniero") then {
				_caller setVariable ["ACE_isEOD", true, true];
			};
			hint format ["Ahora sos %1!", _arguments select 0]; 
			}, [_rol, _var, _value], 1.5, true, true, "", "true", 4, false, "", "" 
	];

	_stand addAction ["Cancelar especialidades", {  
			params ["_target", "_caller", "_actionId", "_arguments"];  
			_caller setVariable ["ACE_IsEngineer", 0, true]; 
			_caller setVariable ["ACE_isEOD", false, true]; 
			_caller setVariable ["ace_medical_medicClass", 0, true]; 
			_caller setVariable ["ACE_GForceCoef", 1]; 
			[_caller,"arga_ing_arga"] call BIS_fnc_setUnitInsignia; 
			hint "Cancelaste tus especialidades!"; 
			}, [], 1.5, true, true, "", "true", 4, false, "", ""  
	];
};

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/