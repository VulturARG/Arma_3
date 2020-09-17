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

EOS_Spawn = compile preprocessfilelinenumbers "scripts\eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "scripts\eos\core\b_launch.sqf";
Bastion_Redirect_WP=compile preprocessfilelinenumbers "scripts\eos\core\b_redirijoUnidades.sqf";
null=[] execVM "scripts\eos\core\spawn_fnc.sqf";

onplayerConnected {[] execVM "scripts\eos\Functions\EOS_Markers.sqf";};

IsVCOM_MOD = true;
publicVariable "IsVCOM_MOD";

VictoryColor="colorBLUFOR";	// Colour of marker after completion
hostileColor="colorOPFOR";	// Default colour when enemies active
bastionColor="colorBLUFOR";	// Colour for bastion marker

EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=FALSE;		// Counts killed units

private _EOS_FACCION = EAST;

null = [["patrullas_H"],[0,2,100],[10,1,100],[0,0,0],[0,0],[0],[0,0,00],[5,1,600,_EOS_FACCION,false]] call EOS_Spawn;
null = [["Hospital"],[10,0,100],[0,1,100],[0,0,0],[0,0],[0],[0,0,00],[5,1,600,_EOS_FACCION,false]] call EOS_Spawn;
null = [["ZM_1","ZM_2","ZM_3","ZM_4","ZM_5","ZM_6","ZM_7","ZM_8"],[4,3,500],[0,2,500],[0,1500],[0,1,1500],[0,3,1500,600],[0,3,300,5000],[5,1,_EOS_FACCION,FALSE,FALSE],[30,_waves,300,FALSE,FALSE],_angle] call Bastion_Spawn;


null = [[_marker],[0,2,100],[10,2,100],[0,0,0],[0,0],[0],[0,0,00],[5,1,750,_EOS_FACCION,false]] call EOS_Spawn;
//PLAYER SIDECHAT (format ["Marker %1",_marker]);
ZSU addEventHandler ["Killed", {
  null = [["ZM_1","ZM_2","ZM_3","ZM_4","ZM_5","ZM_6"],[["patrullas_H",50,"Hospital"],["Hospital",0,""]],EAST] call Bastion_Redirect_WP;//
  null = [["Hospital"],[5,2,150],[0,2,1000],[0,1500],[0,1,1500],[0,3,1500,600],[0,3,300,5000],[5,1,EAST,FALSE,FALSE],[90,5,300,FALSE,FALSE],360] call Bastion_Spawn;
}];



/*
if (_jugadores <= 10) then {
};

if (_jugadores > 10 && _jugadores <= 15) then {

};
if (_jugadores > 15 && _jugadores <= 20) then {

};
if (_jugadores > 20 && _jugadores <= 25) then {

};
if (_jugadores > 25 && _jugadores <= 30) then {

};
if (_jugadores > 30) then {

};
// */
//////////////////////////////////////////////////////////////////
// TODO 
// Ver que no se desactive la zona
