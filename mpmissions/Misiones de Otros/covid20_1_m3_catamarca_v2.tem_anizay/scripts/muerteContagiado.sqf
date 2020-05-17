/*
	muerteContagiado.sqf
	
	Descripción:
    Mata al jugador cuando el tiempo de muerte por contagio se cumple.

	Parámetros:
        0 -- 
	Retorna:
	--
*/

params["_tiempoMuerte", "_primerAvisoContagio", "_segundoAvisoContagio"];

//Primer aviso
hintSilent "Me siento cansado. Creo que tengo fiebre";
[player, 0.1] call ace_medical_fnc_adjustPainLevel;
uiSleep _primerAvisoContagio;
[player, 0.2] call ACE_medical_fnc_adjustPainLevel;
player setDamage 0.5;

//Segundo aviso
hintSilent "Me duele mucho la garganta y el pecho";
[player, 1] call ACE_medical_fnc_adjustPainLevel;
uiSleep _segundoAvisoContagio;
[player, 1] call ACE_medical_fnc_adjustPainLevel;
uiSleep 50;
hintSilent "Me falta el aire, la cabeza me esta matando";
[player, 1] call ACE_medical_fnc_adjustPainLevel;

//Muerte
uiSleep _tiempoMuerte;

hintSilent "Creo que quiero descansar...";
player setDamage 0.8;