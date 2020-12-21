/*******************************************************************************
                            Modify by |ArgA|Vultur|Sgt
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
Bastion_Spawn = compile preprocessfilelinenumbers "scripts\eos\core\b_launch.sqf";
//Bastion_Redirect_WP = compile preprocessfilelinenumbers "scripts\eos\core\b_redirijoUnidades.sqf";
null=[] execVM "scripts\eos\core\spawn_fnc.sqf";

onplayerConnected {[] execVM "scripts\eos\Functions\EOS_Markers.sqf";};

IsVCOM_MOD = false;
publicVariable "IsVCOM_MOD";

VictoryColor="colorBLUFOR";	// Colour of marker after completion
hostileColor="colorOPFOR";	// Default colour when enemies active
bastionColor="colorBLUFOR";	// Colour for bastion marker

EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=false;		// Counts killed units

// Facciones
// 5: OPFOR
// 6: Independientes
// 7: Civiles

private _activationDistanceFew = 700;
private _activationDistancePower = 600;
private _activationDistancePatrol = 700;

// Potencia
private _powerMarkers         = ["Potencia_1" ,"Potencia_2" ,"Potencia_3" ,"Potencia_4" ,"Potencia_5" ,"Potencia_6" ,"Potencia_7" ,"Potencia_8" ,"Potencia_9" ,"Potencia_10"];
_powerMarkers = _powerMarkers + ["Potencia_11"/*,"Potencia_12","Potencia_13","Potencia_14","Potencia_15","Potencia_16","Potencia_17","Potencia_18","Potencia_19","Potencia_20"*/];

[_powerMarkers,[2,3,100],[4,3,100],[0,0,0],[0,0],[0],[0,0,00],[6,1,_activationDistancePower,independent,false]] call EOS_Spawn;

private _powerPatrol          = ["Potenciapatrol_1" ,"Potenciapatrol_2" ,"Potenciapatrol_3" ,"Potenciapatrol_4" ,"Potenciapatrol_5" ,"Potenciapatrol_6" ,"Potenciapatrol_7" /*,"Potenciapatrol_8" ,"Potenciapatrol_9" ,"Potenciapatrol_10"*/];
//_powerPatrol = _powerPatrol   + ["Potenciapatrol_11","Potenciapatrol_12"/*,"Potenciapatrol_13","Potenciapatrol_14","Potenciapatrol_15","Potenciapatrol_16","Potenciapatrol_17","Potenciapatrol_18","Potenciapatrol_19","Potenciapatrol_20"*/];

[_powerPatrol,[0,4,100],[6,3,100],[0,0,0],[0,0],[0],[0,0,00],[6,1,_activationDistancePatrol,independent,false]] call EOS_Spawn;

private _potenciafew          = ["Potenciafew_1" ,"Potenciafew_2" ,"Potenciafew_3" ,"Potenciafew_4" ,"Potenciafew_5" /*,"Potenciafew_6" ,"Potenciafew_7" ,"Potenciafew_8" ,"Potenciafew_9" ,"Potenciafew_10"*/];
//_potenciafew   = _potenciafew + ["Potenciafew_11","Potenciafew_12","Potenciafew_13","Potenciafew_14","Potenciafew_15","Potenciafew_16"/*,"Potenciafew_17","Potenciafew_18","Potenciafew_19","Potenciafew_20"*/];

[_potenciafew,[0,0,100],[6,2,100],[0,0,0],[0,0],[0],[0,0,00],[6,1,_activationDistanceFew,independent,false]] call EOS_Spawn;

/*******************************************************************************
                            Modify by |ArgA|Vultur|Sgt
*******************************************************************************/
//["MARKER:", _x,"SIDE:",_randomSide] call MIV_fnc_log;
