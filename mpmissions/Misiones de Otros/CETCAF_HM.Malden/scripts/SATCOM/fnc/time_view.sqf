while {true} do
{
	if (!(SAT_SatelliteActive)) exitWith {};

	ctrlSetText [1001,format ["%1",call SAT_timeFunction]];

	sleep 0.1;
};