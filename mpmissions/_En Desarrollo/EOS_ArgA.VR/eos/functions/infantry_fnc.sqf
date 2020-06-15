params["_pos","_grpSize","_faction","_side"];

if (!isServer) exitWith {};
// SINGLE INFANTRY GROUP
private ["_grp","_unit","_pool"];

_grpSize params["_grpMin","_grpMax"];
_d=_grpMax-_grpMin;
_r=floor(random _d);
_grpSize=_r+_grpMin;

if (surfaceiswater _pos) then {
	_pool=[_faction,1] call eos_fnc_getunitpool;
}else{
	_pool=[_faction,0] call eos_fnc_getunitpool;
};

_grp=createGroup _side;

for "_x" from 1 to _grpSize do {
	_unitType=_pool select (floor(random(count _pool)));
	// Creación con init         [position, group, init, skill, rank]
	//_unitType createUnit [_pos,_grp, "_unit = this; this addeventhandler ['Killed', {_this execVM 'eos\functions\RemoveDead.sqf'}]"];
	// Creación original      [type, position, markers, placement, special]
	_unit = _grp createUnit [_unitType, _pos, [], 6, "FORM"];
	_unit addeventhandler ["Killed", {_this execVM "scripts\remove_dead.sqf"}];
	
	// Vultur /////////////////////////////////////////////////////
	// Remuevo las granadas de las unidadesm
	_unit removeMagazines "HandGrenade";
	_unit removeMagazines "MiniGrenade";
	// Vultur /////////////////////////////////////////////////////
	// Comment this line if you do not want to change the equipment of the AI
	// Comentar esta línea si no desea cambiar el equipamiento de la IA
	//_unit=[_unit,_unitType] call eos_fnc_infInv;
	///////////////////////////////////////////////////////////////
};

_grp
