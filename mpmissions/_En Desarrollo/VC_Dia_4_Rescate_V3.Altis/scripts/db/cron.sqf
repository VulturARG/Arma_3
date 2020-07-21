/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

if (!(call MIV_fnc_isLogSystemEnabled)) exitWith { };

private _count = 0;

while { _count < 5000} do {
	[allPlayers, "info"] execVM "scripts\db\querys\write_log.sqf";
	_count = _count + 1;
	sleep 120;
};

execVM "scripts\db\cron.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/