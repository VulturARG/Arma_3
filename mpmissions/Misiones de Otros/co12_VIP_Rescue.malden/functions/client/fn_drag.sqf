FAR_Player_Init = {		
	player addEventHandler 
	[
		"Killed",
		{
			// Remove dead body of player (for missions with respawn enabled)
			_body = _this select 0;
			
			[player, [missionnamespace, "VirtualInventory"]] call BIS_fnc_saveInventory;
			
			[_body] spawn 
			{			
				waitUntil { alive player };
				_body = _this select 0;
				deleteVehicle _body;
			}
		}
	];

	[player, [missionnamespace, "VirtualInventory"]] call BIS_fnc_loadInventory;	
};

[] spawn {
    waitUntil { !isNull player };
	
	[player, [missionnamespace, "VirtualInventory"]] call BIS_fnc_saveInventory;
	[] spawn FAR_Player_Init;

	// Event Handlers
	player addEventHandler 
	[
		"Respawn", 
		{			
			[] spawn FAR_Player_Init;
		}
	];
};