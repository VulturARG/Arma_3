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
//_jugadores = 212;
//hint format["%1",_jugadores];
if (_jugadores <= 10) then {
  null = [[_marker],[5,2],[0,0],[0],[0,0],[5,1,EAST,TRUE],[30,_waves,300,FALSE,FALSE],[_angle]] call Bastion_Spawn;
};
if (_jugadores > 10 && _jugadores <= 15) then {
  null = [[_marker],[10,2],[0,0],[0],[0,0],[5,1,EAST,TRUE],[300,_waves,300,FALSE,FALSE],[_angle]] call Bastion_Spawn;
};
if (_jugadores > 15 && _jugadores <= 20) then {
  null = [[_marker],[10,3],[0,0],[0],[0,0],[5,1,EAST,TRUE],[300,_waves,300,FALSE,FALSE],[_angle]] call Bastion_Spawn;
};
if (_jugadores > 20 && _jugadores <= 25) then {
  null = [[_marker],[12,3],[0,0],[0],[0,0],[5,1,EAST,TRUE],[300,_waves,300,FALSE,FALSE],[_angle]] call Bastion_Spawn;
};
if (_jugadores > 25) then {
  null = [[_marker],[10,4],[0,0],[0],[0,0],[5,1,EAST,TRUE],[300,_waves,300,FALSE,FALSE],[_angle]] call Bastion_Spawn;
};

//////////////////////////////////////////////////////////////////
