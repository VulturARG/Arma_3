/* EOS 1.98 by BangaBob
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS],[angulo]] call Bastion_Spawn;
*/

//////////////////////////////////////////////////////////////////
///////////      Modificado por |ArgA|Vultur|Sdo¹    /////////////
//////////////////////////////////////////////////////////////////
_marker = (_this select 0);    //Nombre del marker a activar
_angle = (_this select 1);     //Ángulo del arco de ataque
_jugadores = (_this select 2); //Número de jugadores
_waves = (_this select 3);     //Número de oleadas
//////////////////////////////////////////////////////////////////
EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";
null=[] execVM "eos\core\spawn_fnc.sqf";
onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};

VictoryColor="colorBLUFOR";	// Colour of marker after completion
hostileColor="colorOPFOR";	// Default colour when enemies active
bastionColor="colorBLUFOR";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=FALSE;		// Counts killed units


//////////////////////////////////////////////////////////////////
///////////      Modificado por |ArgA|Vultur|Sdo¹    /////////////
//////////////////////////////////////////////////////////////////
//null = [[_marker],[1,1],[0,0],[0],[0,0],[5,0,EAST,TRUE],[30,2,60,FALSE,TRUE],[_angle]] call Bastion_Spawn;
//PLAYER SIDECHAT (format ["Marker: %1, Angulo: %2, Nº Jug.: %3, Oleadas: %4",_marker,_angle,_jugadores,_waves]);
//_jugadores  = { alive _x} count  allPlayers;
//_jugadores = 27;
//hint format["%1",_jugadores];

/*null=
[["M1","M2","M3"],
[PATROL GROUPS,SIZE OF GROUPS,DISTANCIA APARICION],
[LIGHT VEHICLES,SIZE OF CARGO,DISTANCIA APARICION],
[ARMOURED VEHICLES,DISTANCIA APARICION],
[HELICOPTERS,SIZE OF HELICOPTER CARGO,DISTANCIA APARICION], //Si SIZE OF HELICOPTER es cero aparecen helis de ataque
[PARACAIDISTAS,SIZE OF HELICOPTER CARGO,DISTANCIA APARICION,ALTURA SALTO],
[HALO,SIZE OF GROUPS,DISTANCIA APARICION,ALTURA SALTO],
[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],
[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS],
[angulo]] call Bastion_Spawn;*/
private _EOS_FACCION = EAST;

//_waves = 1;// Borrar

if (_jugadores <= 10) then {
  //Asalto inicial
  null = [[_marker],[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[6,1,400,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[600,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas impares
  null = [[_marker],[3,1,1000],[4,1,1000],[0,1500],[0,1,1500],[4,1,1500,600],[0,3,200,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1200,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas pares
  null = [[_marker],[3,1,1000],[0,3,1000],[0,1500],[4,1,1500],[0,0,1500,600],[0,3,200,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1500,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Última ola
  null = [[_marker],[0,2,1000],[5,1,1000],[3,1500],[0,1,1500],[5,1,1500,600],[1,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[7500,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Apaches
  null = [[_marker],[0,1,1000],[0,2,1000],[0,1500],[2,0,3000],[0,4,1500,600],[0,3,200,5000],[1,0,WEST,FALSE,FALSE],[7800,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
};
if (_jugadores > 10 && _jugadores <= 15) then {
  null = [[_marker],[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[6,2,400,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[600,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas impares
  null = [[_marker],[3,2,1000],[3,2,1000],[0,1500],[0,1,1500],[3,2,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1200,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas pares
  null = [[_marker],[3,2,1000],[0,3,1000],[1,1500],[3,2,1500],[0,0,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1500,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Última ola
  null = [[_marker],[0,2,1000],[5,2,1000],[4,1500],[0,1,1500],[5,2,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[7500,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Apaches
  null = [[_marker],[0,1,1000],[0,2,1000],[0,1500],[3,0,3000],[0,4,1500,600],[0,3,300,5000],[1,0,WEST,FALSE,FALSE],[7800,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
};
if (_jugadores > 15 && _jugadores <= 20) then {
  null = [[_marker],[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[6,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[600,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas impares
  null = [[_marker],[4,2,1000],[4,2,1000],[0,1500],[0,1,1500],[4,2,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1200,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas pares
  null = [[_marker],[4,2,1000],[0,3,1000],[2,1500],[4,2,1500],[0,0,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1500,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Última ola
  null = [[_marker],[0,2,1000],[5,2,1000],[4,1500],[0,1,1500],[5,3,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[7500,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Apaches
  null = [[_marker],[0,1,1000],[0,2,1000],[0,1500],[3,0,3000],[0,4,1500,600],[0,3,300,5000],[1,0,WEST,FALSE,FALSE],[7800,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
};
if (_jugadores > 20 && _jugadores <= 25) then {
  null = [[_marker],[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[6,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[600,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas impares
  null = [[_marker],[3,3,1000],[4,2,1000],[0,1500],[0,1,1500],[4,3,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1200,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas pares
  null = [[_marker],[3,3,1000],[0,3,1000],[2,1500],[4,3,1500],[0,0,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1500,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Última ola
  null = [[_marker],[0,2,1000],[6,2,1000],[5,1500],[0,1,1500],[5,3,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[7500,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Apaches
  null = [[_marker],[0,1,1000],[0,2,1000],[0,1500],[4,0,3000],[0,4,1500,600],[0,3,300,5000],[1,0,WEST,FALSE,FALSE],[7800,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
};
if (_jugadores > 25 && _jugadores <= 30) then {
  //Asalto inicial
  null = [[_marker],[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[7,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[600,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas impares
  null = [[_marker],[4,3,1000],[3,3,1000],[0,1500],[0,1,1500],[4,3,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1200,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas pares
  null = [[_marker],[4,3,1000],[0,3,1000],[3,1500],[4,3,1500],[0,0,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1500,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Última ola
  null = [[_marker],[0,2,1000],[7,2,1000],[5,1500],[0,1,1500],[5,4,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[7500,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Apaches
  null = [[_marker],[0,1,1000],[0,2,1000],[0,1500],[4,0,3000],[0,4,1500,600],[0,3,300,5000],[1,0,WEST,FALSE,FALSE],[7800,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
};
if (_jugadores > 30) then {
  //Asalto inicial
  null = [[_marker],[0,2,1000],[0,3,1000],[0,1500],[0,1,1500],[0,0,1500,600],[8,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[600,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas impares
  null = [[_marker],[4,4,1000],[4,3,1000],[0,1500],[0,1,1500],[4,4,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1200,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  //Oleadas pares
  null = [[_marker],[4,4,1000],[0,3,1000],[3,1500],[4,4,1500],[0,0,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[1500,_waves,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Última ola
  null = [[_marker],[0,2,1000],[8,2,1000],[6,1500],[0,1,1500],[6,4,1500,600],[0,3,300,5000],[6,0,_EOS_FACCION,FALSE,FALSE],[7500,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
  // Apaches
  null = [[_marker],[0,1,1000],[0,2,1000],[0,1500],[4,0,3000],[0,4,1500,600],[0,3,300,5000],[1,0,WEST,FALSE,FALSE],[7800,1,600,FALSE,FALSE],[_angle]] call Bastion_Spawn;
};

//////////////////////////////////////////////////////////////////
