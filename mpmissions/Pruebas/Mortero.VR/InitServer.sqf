/*M1 addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	systemChat format ["_unit  %1 _weapon %2 _muzzle %3 _mode %4 _ammo %5 _magazine %6 _projectile %7 _gunner %8",_unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_gunner];
	deleteVehicle _projectile;
}];*/

[disparador, 10] execVM "scripts\artySim.sqf";

private _minX = 0;
private _minY = 0;
private _maxX = 0;
private _maxY = 0;
private _liderPos = []:
/*{
	
} forEach allGroups;
/*{
	
	
	_posX = (position _x) select 0;
	_posy = (position _x) select 1;
	if (_minX >_posX) then {
		_minX =_posX;
	};
	if (_miny >_posy) then {
		_miny =_posy;
	};
	if (_maxX <_posX) then {
		_maxX =_posX;
	};
	if (_maxY <_posY) then {
		_maxY =_posY;
	};
	
} forEach allGroups;*/

systemChat format ["%1 %2 %3 %4",_minX,_minY,_maxX,_maxY];