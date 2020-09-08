private ["_grid"];

while {true} do
{
	if (!(SAT_SatelliteActive)) exitWith {};
	
	_grid = SAT_SatelliteTarget call BIS_fnc_posToGrid;

	ctrlSetText [1002,format ["LON.: %1",_grid select 0]];
	ctrlSetText [1003,format ["LAT.: %1",_grid select 1]];

	sleep 0.1;
};