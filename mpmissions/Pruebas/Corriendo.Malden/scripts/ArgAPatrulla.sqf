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
//_pos = getPos player;
_pos = getPos tropa;
_units = [];
_sep_i = 5;
_sep_j = 10;

// Instructor o Mando
_unit = createGroup west createUnit ["arga_multicam_fusilero", _pos vectorAdd [2.5*_sep_i + (0.2 - random 0.4), 26-(7*_sep_j), 0], [], 0, "CAN_COLLIDE"];
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


for "_j" from 1 to 8 do //Número de filas
{
 for "_i" from 2 to 3 do  //Número de columnas
 {
  //_unit = createGroup west createUnit [selectRandom _classes, _pos vectorAdd [_i*2 + (0.2 - random 0.4), _j*4, 0], [], 0, "CAN_COLLIDE"];
	_unit = createGroup west createUnit ["arga_multicam_fusilero", _pos vectorAdd [_i*_sep_i+ (0.2 - random 0.4), 30-(_j*_sep_j), 0], [], 0, "CAN_COLLIDE"];
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
  _x playmove "amovpercmwlkslowwrfldf_ver2";
  _x addEventHandler ["AnimDone", {_this select 0 playMove "amovpercmwlkslowwrfldf_ver2"}];
 }
 forEach (_this call BIS_fnc_arrayShuffle);
};
