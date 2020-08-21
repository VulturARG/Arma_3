addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];
    [_unit, false] remoteExec ["allowDamage", owner _unit, false];
    [_unit, true] remoteExec ["setCaptive", owner _unit, false];
    [_unit, "ALL"] remoteExec ["disableAI", owner _unit, false];
	[_unit, ["SwitchWeapon", _unit, _unit, 100]] remoteExec ["action", owner _unit, false];
    true;
}];

while {true} do {
	{
		format ["[Time Log] player: %1 owner: %2",_x, owner _x ] call BIS_fnc_log;
	} forEach allPlayers;
	sleep 5;
};