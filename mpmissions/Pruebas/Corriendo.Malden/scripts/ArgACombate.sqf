////////////////////////////////////////////////////////////////////////////////
//////////////////////////// |ArgA|Vultur|Sdo¹ /////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

/// Fuente:
/// https://forums.bohemia.net/forums/topic/205667-soldiers-marching-home/?tab=comments#comment-3200359
/// ArgA scrits (Ignacio)

/*
amovpercmwlkslowwrfldf_ver2 //Simulacion caminata
AmovPercMrunSlowWrflDf

AmovPercMrunSnonWnonDf //Simulacion correr sin arma

/*
_classes = [
 "arga_multicam_fusilero"
];*/

////////////////// Borrar //////////////
tropa setDir 90;

_pos = getPos tropa;
_dir = getDir tropa;
_sen = sin direction tropa;
_cos = cos direction tropa;
_units = [];
_sep_i = 5;    // Separación en m entre columnas
_sep_j = 10;   // Separación en m entre soldados (filas)
_maxFilas = 4; // Número de soldados en cada columna
_maxCol = 2;   // Número de columnas
_inicio = _maxFilas * _sep_j + 5;



//Crear Tropa

// Instructor o Mando
_dis_i = 2.5*_sep_i + (0.2 - random 0.4);
_dis_j = _inicio - 4 - (3*_sep_j);
//_unit = createGroup west createUnit ["arga_multicam_fusilero", _pos vectorAdd [_dis_i+_sen*_dis_j, _dis_j*_cos + _dis_i*_cos , 0], [], 0, "CAN_COLLIDE"];
//_unit = createGroup west createUnit ["arga_multicam_fusilero", _pos vectorAdd [_dis_i, _dis_j , 0], [], 0, "CAN_COLLIDE"];
_unit = createGroup west createUnit ["arga_multicam_fusilero", _pos vectorAdd [_cos*_dis_i+_sen*_dis_j, _dis_j*_cos + _dis_i*_sen , 0], [], 0, "CAN_COLLIDE"];
_unit setDir _dir;

/*comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
comment "Add containers";
_unit forceAddUniform "arga_u_multicam";
_unit addHeadgear "arga_g_tan_pe";*/

_unit forcewalk true;
_units pushBack _unit;


for "_j" from 1 to _maxFilas do //Número de filas
{
 for "_i" from 2 to _maxCol + 1 do  //Número de columnas
 {
  //_unit = createGroup west createUnit [selectRandom _classes, _pos vectorAdd [_i*2 + (0.2 - random 0.4), _j*4, 0], [], 0, "CAN_COLLIDE"];
  _dis_i = _i*_sep_i + (0.2 - random 0.4);
  _dis_j = _inicio - (_j*_sep_j);// + (0.2 - random 0.4);
  //_unit = createGroup west createUnit ["arga_multicam_fusilero", _pos vectorAdd [_dis_i+_sen*_dis_j, _dis_j*_cos + _dis_i*_cos, 0], [], 0, "CAN_COLLIDE"];
  //_unit = createGroup west createUnit ["arga_multicam_fusilero", _pos vectorAdd [_dis_i, _dis_j, 0], [], 0, "CAN_COLLIDE"];
  _unit = createGroup west createUnit ["arga_multicam_fusilero", _pos vectorAdd [_cos*_dis_i+_sen*_dis_j, _dis_j*_cos + _dis_i*_sen , 0], [], 0, "CAN_COLLIDE"];
  _unit setDir _dir;
	comment "Remove existing items";
/*removeAllWeapons _unit;
 	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	comment "Add containers";
	_unit forceAddUniform "arga_u_oliva";
	_unit addHeadgear "arga_g_oliva";*/

	_unit forcewalk true;
	_units pushBack _unit;

 };
};

_units spawn
{
 {
	sleep random 0.01;
  _x playmove "AmovPercMwlkSrasWrflDf";
  _x addEventHandler ["AnimDone", {_this select 0 playMove "AmovPercMwlkSrasWrflDf"}];
 }
 forEach (_this call BIS_fnc_arrayShuffle);
};
/*
// Crear vehiculo

_vehiculo = "B_G_Offroad_01_F" createVehicle position tropa;
_vehiculo setDir _dir;
_vehiculo setPos _pos;

createVehicleCrew _vehiculo;
{
	diag_log [_x, faction _unit, side _unit, side group _unit];
} forEach crew _vehiculo;
*/
