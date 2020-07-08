/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

private ["_params"];
private _count = 0;

while { _count < 5000 } do {
	while { count MANDI_UNIT_DISCONNECTED > 0 } do {
		_params = MANDI_UNIT_DISCONNECTED select 0;
		_params execVM "scripts\db\querys\write_log.sqf";
		MANDI_UNIT_DISCONNECTED deleteAt 0;
	};
	sleep 2;
  	_count = _count + 1;
};

execVM "scripts\db\event_disconnect.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/