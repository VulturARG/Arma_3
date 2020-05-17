private _player = param[0];

{_x allowDamage false;} forEach allPlayers;

/*
{_x addEventHandler ["GetOut", {
		params ["_vehicle", "_role", "_unit", "_turret"];
		{_x allowDamage true;} forEach allPlayers;
	}]
} forEach [V1,V2];
*/
