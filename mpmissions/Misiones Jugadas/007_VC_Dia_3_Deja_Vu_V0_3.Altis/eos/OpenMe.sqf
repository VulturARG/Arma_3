EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";
null=[] execVM "eos\core\spawn_fnc.sqf";
onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};
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
VictoryColor="colorBLUFOR";	// Colour of marker after completion
hostileColor="colorOPFOR";	// Default colour when enemies active
bastionColor="colorBLUFOR";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=FALSE;		// Counts killed units
/*
null = [["EOSinf_1","EOSinf_2"],[3,1],[2,3,75],[0,0],[0],[0],[0,0],[0,0,350,EAST,TRUE]] call EOS_Spawn;
null = [["EOSmot_1","EOSmot_2"],[0,0],[0,0],[3,1,90],[2,60],[0],[1,0,90],[0,0,350,EAST,FALSE]] call EOS_Spawn;
null = [["BAS_zone_1"],[0,1],[0,2],[0],[1,2],[0,0,EAST,TRUE],[0,2,120,TRUE,FALSE]] call Bastion_Spawn;
*/
null = [["Bloqueo_Norte","Bloqueo_Sur","Base_Temporal"],[10,1],[0,0],[0],[0,0],[5,0,EAST,TRUE],[300,2,900,FALSE,TRUE],[210]] call Bastion_Spawn;
/*
_jugadores  = { alive _x} count  allPlayers;
//_jugadores = 26;
//hint format["%1",_jugadores];
if (_jugadores <= 10) then {
  null = [["M_Panagia_EOS"],[15,0,100],[7,1,100],[0,0],[0],[0],[0,0],[5,1,300,EAST,FALSE]] call EOS_Spawn;
};
if (_jugadores > 10 && _jugadores <= 15) then {
  null = [["M_Panagia_EOS"],[15,0,100],[6,2,100],[0,0],[0],[0],[0,0],[5,1,300,EAST,FALSE]] call EOS_Spawn;
};
if (_jugadores > 15 && _jugadores <= 20) then {
  null = [["M_Panagia_EOS"],[15,0,100],[8,2,100],[0,0],[0],[0],[0,0],[5,1,300,EAST,FALSE]] call EOS_Spawn;
};
if (_jugadores > 20 && _jugadores <= 25) then {
  null = [["M_Panagia_EOS"],[15,1,100],[7,3,100],[0,0],[0],[0],[0,0],[5,1,300,EAST,FALSE]] call EOS_Spawn;
};
if (_jugadores > 25) then {
  null = [["M_Panagia_EOS"],[15,1,100],[9,3,100],[0,0],[0],[0],[0,0],[5,1,300,EAST,FALSE]] call EOS_Spawn;
};
*/
