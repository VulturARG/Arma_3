
if (!isServer) exitWith { };

eos_fnc_spawnvehicle = compile preprocessfilelinenumbers "eos\functions\eos_SpawnVehicle.sqf";
eos_fnc_getunitpool = compile preprocessfilelinenumbers "eos\UnitPools.sqf";

private ["_fGroup","_wp1","_grupo","_coding","_ids"];

_newDir = random 360;
for "_counter" from 1 to 4 do {
	_newpos = [getMarkerPos "Traza_Italiana", 1500+_counter*75,_newDir+_counter*10] call BIS_fnc_relPos;
	_fGroup=[_newpos,WEST,1,3,"fly"] call EOS_fnc_spawnvehicle;
	_posArrival = [getMarkerPos "Traza_Italiana", 200,(_counter-1)*90] call BIS_fnc_relPos;
	[(_fGroup select 2), _posArrival] call BIS_fnc_taskAttack;
};