/*******************************************************************************
                            Modify by |ArgA|Vultur|Cbo¹
*******************************************************************************/
/* EOS 1.98 by BangaBob
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,1,10],[1,1,250,WEST]] call EOS_Spawn;
 
 null=
 [["M1","M2","M3"],
 [HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],
 [PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],
 [LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],
 [ARMOURED VEHICLES,PROBABILITY],
 [STATIC VEHICLES,PROBABILITY],
 [HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],
 [FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,hint_DEBUG,BIS_fnc_logFormat_DEBUG]] call EOS_Spawn;

//EXAMPLE CALL - BASTION
null=
[["M1","M2","M3"],
[PATROL GROUPS,SIZE OF GROUPS,DISTANCIA APARICION],
[LIGHT VEHICLES,SIZE OF CARGO,DISTANCIA APARICION],
[ARMOURED VEHICLES,DISTANCIA APARICION],
[HELICOPTERS,SIZE OF HELICOPTER CARGO,DISTANCIA APARICION], //Si SIZE OF HELICOPTER es cero aparecen helis de ataque
[PARACAIDISTAS,SIZE OF HELICOPTER CARGO,DISTANCIA APARICION,ALTURA SALTO],
[HALO,SIZE OF GROUPS,DISTANCIA APARICION,ALTURA SALTO],
[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,hint_DEBUG,BIS_fnc_logFormat_DEBUG],
[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS],
[angulo]] call Bastion_Spawn;

//EXAMPLE CALL - REDIRECT WP BASTION
//Borra todos los WP de las unidades del bando y luego crea otros

[["M1","M2","M3"], //Marcadores _angle donde redirigir las unidades
[["E1",% redirigido,"ND"],["E2",% redirigido,"ND"]],  // ["E1"] -> Nombre de las unidades parcialmente redirigidas. Puede ser vacio
                                                      // % redirigido [0 _angle 100] -> % del grupo que se redirige al nuevo WP
                                                      // ["ND"] -> Nombre del marcador que será el nuevo destino de las unidades remanentes (opcional)
[Bando]                                               // Bando
] call Redirect_WP_Bastion_Spawn;

*/
params ["_marker",["_waves",0],["_jugadores",1],["_angle",360]];
//_marker: Nombre del marker _angle activar
//_waves: Número de oleadas
//_jugadores: Número de jugadores
//_angle: Ángulo del arco de ataque

//systemChat format ["_marker %1 _waves  %2 _jugadores %3 _angle %4",_marker,_waves,_jugadores,_angle];
/////////////////////////////////////////////////////////////////*/

EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";
Bastion_Redirect_WP=compile preprocessfilelinenumbers "eos\core\b_redirijoUnidades.sqf";
null=[] execVM "eos\core\spawn_fnc.sqf";

onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};

IsVCOM_MOD = true;
publicVariable "IsVCOM_MOD";

VictoryColor="colorBLUFOR";	// Colour of marker after completion
hostileColor="colorOPFOR";	// Default colour when enemies active
bastionColor="colorBLUFOR";	// Colour for bastion marker

EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=FALSE;		// Counts killed units

//_jugadores = 31; // TODO Comentar
//hint format["%1",_jugadores];

private _esperaInicial = 0;   //Segundos
private _esperaImpares = 300; //Segundos
private _esperaPares = 600;   //Segundos
private _intervalo = 600;     //Segundos
private _ataqueFinal = 6600;  //Segundos
private _ataqueAliados = 6900;//Segundos

//_waves = 3;// Borrar // TODO Comentar
private _EOS_FACCION = EAST;

// TODO Defensores IA Comentar
//null = [["defensa"],[4,3,15],[0,2,800],[0,500],[0,2,800],[0,2,800,200],[0,3,300,500], [1,1,WEST,FALSE,FALSE,true,true],[0,_waves+2,_intervalo,false,false],_angle] call Bastion_Spawn;

null = [_marker,[0,0,8],[0,0,200],[0,100],[1,1,300],[0,0,800,200],[0,1,300,5000],[0,1,_EOS_FACCION,FALSE,FALSE,true],[0,1,30,FALSE,FALSE],_angle] call Bastion_Spawn;

/*
//if (_jugadores <= 15) then {
if (_jugadores <= 10) then {
  //Asalto inicial
  null = [_marker,[0,2,800],[0,3,800],[0,800],[0,1,800],[0,0,800,200],[6,1,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaInicial,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = [["impares"],[3,1,500],[4,1,800],[0,800],[0,1,800],[4,1,800,200],[0,3,200,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaImpares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = [["pares"],[3,1,500],[0,3,800],[0,800],[4,1,800],[0,0,800,200],[0,3,200,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaPares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [_marker,[0,2,800],[3,1,800],[2,800],[0,1,800],[5,1,800,200],[1,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_ataqueFinal,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [_marker,[0,1,800],[0,2,800],[0,800],[2,0,3000],[0,4,800,200],[0,3,200,5000],[1,1,WEST,FALSE,FALSE,true],[_ataqueAliados,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
};
//if (_jugadores > 15 && _jugadores <= 20) then {
if (_jugadores > 10 && _jugadores <= 15) then {
  null = [_marker,[0,2,800],[0,3,800],[0,800],[0,1,800],[0,0,800,200],[6,2,400,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaInicial,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = [["impares"],[3,2,500],[3,2,800],[0,800],[0,1,800],[3,2,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaImpares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = [["pares"],[3,2,500],[0,3,800],[1,800],[3,2,800],[0,0,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaPares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [_marker,[0,2,800],[3,2,800],[2,800],[0,1,800],[5,2,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_ataqueFinal,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [_marker,[0,1,800],[0,2,800],[0,800],[3,0,3000],[0,4,800,200],[0,3,300,5000],[1,1,WEST,FALSE,FALSE,true],[_ataqueAliados,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
};
//if (_jugadores > 20 && _jugadores <= 25) then {
if (_jugadores > 15 && _jugadores <= 20) then {
  null = [["inicial"],[0,2,800],[0,3,800],[0,800],[0,1,800],[0,0,800,200],[6,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaInicial,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = [["impares"],[4,2,500],[4,2,800],[0,800],[0,1,800],[4,2,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaImpares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = [["pares"],[4,2,500],[0,3,800],[2,800],[4,2,800],[0,0,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaPares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [[_marker],[0,2,800],[4,2,800],[3,800],[0,1,800],[5,3,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_ataqueFinal,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [[_marker],[0,1,800],[0,2,800],[0,800],[4,0,3000],[0,4,800,200],[0,3,300,5000],[1,1,WEST,FALSE,FALSE,true],[_ataqueAliados,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
};
//if (_jugadores > 25 && _jugadores <= 30) then {
if (_jugadores > 20 && _jugadores <= 25) then {
  null = [_marker,[0,2,800],[0,3,800],[0,800],[0,1,800],[0,0,800,200],[6,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaInicial,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = [["impares"],[3,3,500],[4,2,800],[0,800],[0,1,800],[4,3,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaImpares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = [["pares"],[3,3,500],[0,3,800],[2,800],[4,3,800],[0,0,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaPares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [_marker,[0,2,800],[5,2,800],[4,800],[0,1,800],[5,3,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_ataqueFinal,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [_marker,[0,1,800],[0,2,800],[0,800],[4,0,3000],[0,4,800,200],[0,3,300,5000],[1,1,WEST,FALSE,FALSE,true],[_ataqueAliados,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;

};
//if (_jugadores > 30) then {
if (_jugadores > 25 && _jugadores <= 30) then {
  //Asalto inicial
  null = [_marker,[0,2,800],[0,3,800],[0,800],[0,1,800],[0,0,800,200],[7,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaInicial,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = [["impares"],[4,3,500],[3,3,800],[0,800],[0,1,800],[4,3,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaImpares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = [["pares"],[4,3,500],[0,3,800],[3,800],[4,3,800],[0,0,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaPares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [_marker,[0,2,800],[7,2,800],[5,800],[0,1,800],[5,4,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_ataqueFinal,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [_marker,[0,1,800],[0,2,800],[0,800],[4,0,3000],[0,4,800,200],[0,3,300,5000],[1,1,WEST,FALSE,FALSE,true],[_ataqueAliados,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
};
if (_jugadores > 30) then {
  //Asalto inicial
  null = [_marker,[0,2,800],[0,3,800],[0,800],[0,1,800],[0,0,800,200],[8,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaInicial,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = [["impares"],[4,4,500],[4,3,800],[0,800],[0,1,800],[4,4,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaImpares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = [["pares"],[4,4,500],[0,3,800],[3,800],[4,4,800],[0,0,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_esperaPares,_waves,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [_marker,[0,2,800],[8,2,800],[6,800],[0,1,800],[6,4,800,200],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[_ataqueFinal,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [_marker,[0,1,800],[0,2,800],[0,800],[4,0,3000],[0,4,800,200],[0,3,300,5000],[1,1,WEST,FALSE,FALSE,true],[_ataqueAliados,1,_intervalo,FALSE,FALSE],_angle] call Bastion_Spawn;
};
// */