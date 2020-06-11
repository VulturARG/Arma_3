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

//_jugadores = 21; // TODO Comentar
//hint format["%1",_jugadores];
/*if (allowFunctionsLog != 1) then {
  hint "PUT allowFunctionsLog = 1; IN description.ext";
};*/


//_waves = 3;// Borrar // TODO Comentar
private _EOS_FACCION = EAST;
null = [["defensa"],[4,3,15],[0,2,800],[0,500],[0,2,1000],[0,2,1000,200],[0,3,300,500], [1,1,WEST,FALSE,FALSE,true,true],[10,_waves+2,90,false,false],_angle] call Bastion_Spawn;
if (_jugadores <= 10) then {
  //Asalto inicial
  null = [_marker,[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[6,1,400,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[600,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = ["impares",[3,1,1000],[4,1,1000],[0,1500],[0,1,1500],[4,1,1500,600],[0,3,200,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[1200,_waves,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = ["pares",[3,1,1000],[0,3,1000],[0,1500],[4,1,1500],[0,0,1500,600],[0,3,200,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[1500,_waves,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [_marker,[0,2,1000],[5,1,1000],[3,1500],[0,1,1500],[5,1,1500,600],[1,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[7500,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [_marker,[0,1,1000],[0,2,1000],[0,1500],[2,0,3000],[0,4,1500,600],[0,3,200,5000],[1,1,WEST,FALSE,FALSE,true],[7800,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
};
if (_jugadores > 10 && _jugadores <= 15) then {
  null = [_marker,[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[6,2,400,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[600,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = [_marker,[3,2,1000],[3,2,1000],[0,1500],[0,1,1500],[3,2,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[1200,_waves,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = [_marker,[3,2,1000],[0,3,1000],[1,1500],[3,2,1500],[0,0,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[1500,_waves,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [_marker,[0,2,1000],[5,2,1000],[4,1500],[0,1,1500],[5,2,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[7500,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [_marker,[0,1,1000],[0,2,1000],[0,1500],[3,0,3000],[0,4,1500,600],[0,3,300,5000],[1,1,WEST,FALSE,FALSE,true],[7800,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
};
if (_jugadores > 15 && _jugadores <= 20) then {
  null = [["inicial"],[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[6,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[60,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = [_marker,[4,2,1000],[4,2,1000],[0,1500],[0,1,1500],[4,2,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[240,_waves,180,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = [_marker,[4,2,1000],[0,3,1000],[2,1500],[4,2,1500],[0,0,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[420,_waves,180,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [["final"],[0,2,1000],[5,2,1000],[4,1500],[0,1,1500],[5,3,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[960,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [["final"],[0,1,1000],[0,2,1000],[0,1500],[4,0,3000],[0,4,1500,600],[0,3,300,5000],[1,1,WEST,FALSE,FALSE,true],[1080,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
};
if (_jugadores > 20 && _jugadores <= 25) then {
  null = [_marker,[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[6,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[600,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = [_marker,[3,3,1000],[4,2,1000],[0,1500],[0,1,1500],[4,3,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[30,_waves,180,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = [_marker,[3,3,1000],[0,3,1000],[2,1500],[4,3,1500],[0,0,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[120,_waves,180,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [_marker,[0,2,1000],[6,2,1000],[5,1500],[0,1,1500],[5,3,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[7500,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [_marker,[0,1,1000],[0,2,1000],[0,1500],[4,0,3000],[0,4,1500,600],[0,3,300,5000],[1,1,WEST,FALSE,FALSE,true],[7800,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;

};
if (_jugadores > 25 && _jugadores <= 30) then {
  //Asalto inicial
  null = [_marker,[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[7,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[600,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = [_marker,[4,3,1000],[3,3,1000],[0,1500],[0,1,1500],[4,3,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[1200,_waves,180,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = [_marker,[4,3,1000],[0,3,1000],[3,1500],[4,3,1500],[0,0,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[1500,_waves,180,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [_marker,[0,2,1000],[7,2,1000],[5,1500],[0,1,1500],[5,4,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[7500,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [_marker,[0,1,1000],[0,2,1000],[0,1500],[4,0,3000],[0,4,1500,600],[0,3,300,5000],[1,1,WEST,FALSE,FALSE,true],[7800,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
};
if (_jugadores > 30) then {
  //Asalto inicial
  null = [_marker,[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[8,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[600,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas impares
  null = [_marker,[4,4,1000],[4,3,1000],[0,1500],[0,1,1500],[4,4,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[1200,_waves,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  //Oleadas pares
  null = [_marker,[4,4,1000],[0,3,1000],[3,1500],[4,4,1500],[0,0,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[1500,_waves,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Última ola
  null = [_marker,[0,2,1000],[8,2,1000],[6,1500],[0,1,1500],[6,4,1500,600],[0,3,300,5000],[6,1,_EOS_FACCION,FALSE,FALSE,true],[7500,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
  // Apaches
  null = [_marker,[0,1,1000],[0,2,1000],[0,1500],[4,0,3000],[0,4,1500,600],[0,3,300,5000],[1,1,WEST,FALSE,FALSE,true],[7800,1,600,FALSE,FALSE],_angle] call Bastion_Spawn;
};