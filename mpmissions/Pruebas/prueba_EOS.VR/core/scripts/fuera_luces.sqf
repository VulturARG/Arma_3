/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

params [["_state", 0], ["_marker", "LIGHTSOURCE"], ["_distance", 800], ["_types", ["Lamps_Base_F","PowerLines_base_F","Land_PowerPoleWooden_L_F"]]];
private _countTypes = (count _types);
private _lamps = "";

{
	_lamps = getMarkerPos _marker nearObjects [_x, _distance];
	sleep 1;
	{ 
		_x setDamage _state;
	} forEach _lamps;
} forEach _types;

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/