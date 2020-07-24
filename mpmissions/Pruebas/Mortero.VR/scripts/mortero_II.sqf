params["_morter"];
//Mortar2

private _centerPos = [0,0,0];

_playerGroup = allPlayers;

//-- Add all player positions
{
	_centerPos = _centerPos vectorAdd (getPos _x);
} forEach _playerGroup; // array of players

//-- Divide sums by count of players
_centerPos = _centerPos vectorMultiply (1 / count _playerGroup); 
private _position = _centerPos;
private _position = [_centerPos, random[30,45,60], _centerPos getDir Mortar2] call BIS_fnc_relPos;


//null = ["OffMap", east, "Sporadic", "light", [_posToFireAt, 50]] execVM "scripts\NEKY_Mortars\NEKY_Mortars.sqf";
//null = [Mortar1, east, "Precise", "light", [_posToFireAt, 100],100,500,20] execVM "Scripts\NEKY_Mortars\NEKY_Mortars.sqf";
//null = [Mortar2, east, "safe", "light", [_position, 50],100,500,20] execVM "Scripts\NEKY_Mortars\NEKY_Mortars.sqf";
null = [Mortar2, east, "guided", "Medium", ["auto", 80],100,250,20] execVM "Scripts\NEKY_Mortars\NEKY_Mortars.sqf";

/*

*/