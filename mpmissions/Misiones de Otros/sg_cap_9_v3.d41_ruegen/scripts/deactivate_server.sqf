/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/
ADD_ACTION_SERVER =
{
	params ["_title", "_arguments"];
	private _params = [format ["<t color='#ffffff'>%1</t>", _title], {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_arguments execVM "scripts\exec_dialog.sqf";
	}, _arguments , 1.5, true, true, "", "true", 5, false, "", ""];
	[server, _params] remoteExec ["addAction", 0, true];
};

MENU_SERVER =
{
	server remoteExec ["removeAllActions", 0, true];
	["Guía de desactivación", "GUIA_DESACTIVACION"] call ADD_ACTION_SERVER;
	["Pasos cables", "PASOS_CABLES"] call ADD_ACTION_SERVER;
	["Pasos contraseña", "PASOS_PASSWORD"] call ADD_ACTION_SERVER;
	["Pasos código de desactivación", "PASOS_CODIGO"] call ADD_ACTION_SERVER;
};

/*******************************************************************************
								Obtener información
*******************************************************************************/

GUIA_DESACTIVACION =
{
	hint "Guía de desactivación:\n\nPuede acceder a esta guía cuantas veces le sea necesario.\n\nLa desactivación de la bomba cuenta de 3 pasos fundamentales. Estos se deben seguir al pie de la letra y en el orden especifico aqui comentado o el dispositivo detonará.\n\nPaso 1: Cortar el cable indicado.\nMenú 'Pasos cables'.\n\nPaso 2: Ingresar la contraseña.\nMenú 'Pasos contraseña'.\n\nPaso 3: Ingresar codigo de desactivación.\nMenú: 'Pasos código de desactivación'.\n\nLa comunicación con su compañero de desactivación es fundamental, pida y anote toda la información necesaria para poder indicarle correctamente como desactivar el dispositivo.\n\nUna vez que inicie el proceso, tendrá 20 minutos para completar los pasos o el dispositivo detonará.";
};

PASOS_CABLES =
{
	hint "El cable correcto a cortar dependerá de los cables que tenga el dispositivo.\n\n- Si hay 2 Cables rojos y 1 cable Blanco: Corte el cable negro.\n\n- Si hay 1 Cable amarillo, 1 cable Blanco y 2 negros: Corte el cable amarillo.\n\nSi hay 1 cable amarillo y 1 rojo: Corte el cable blanco.\n\nSi hay 1 cable amarillo, 1 rojo, 1 negro y 2 blancos: Corte el cable negro.";
};

PASOS_PASSWORD =
{
	hint "Para conseguir la contraseña correcta necesita el número de serie.\n\nSi el número de serie es 4JRY3L: La contraseña es: Lambda Kappa Chi Epsilon\n\nSi el número de serie es 4JFY3L: La contraseña es: Chi Kappa Epsilon Lambda\n\nSi el número de serie es 4JFY4L: Epsilon Kappa Lambda Chi.";
};

PASOS_CODIGO =
{
	hint "Para obtener el código de desactivación necesita el Código de recuperación.\n\nSi el código de recuperación es 8520672: El código de desactivación es: 1JV86\n\nSi el código de recuperación es 8610672: El código de desactivación es: APV84\n\nSi el código de recuperación es 8510672: El código de desactivación es: 2PB8M\n\nSi el código de recuperación es 8510673: El código de desactivación es: LGH3V";
};

/*******************************************************************************
								Ejecuciones 
*******************************************************************************/

call MENU_SERVER;

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/