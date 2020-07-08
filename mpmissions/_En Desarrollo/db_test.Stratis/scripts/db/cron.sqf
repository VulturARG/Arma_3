/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

private _count = 0;

while { _count < 5000} do {
	// call compile preprocessFileLineNumbers "scripts\db\querys\delete_info.sqf";
	[allPlayers, "info"] execVM "scripts\db\querys\write_log.sqf";
	_count = _count + 1;
	sleep 120;
};

execVM "scripts\db\cron.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/