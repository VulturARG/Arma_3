params["_morter","_playerGroup","_typeRound","_density","_isAuto","_minimunDistance","_maximunDistance"];
//Mortar2

private ["_position"];

if (_isAuto) then {
	_position = "auto";
} else {
	private _centerPos = [0,0,0];

	//-- Add all player positions
	{
		_centerPos = _centerPos vectorAdd (getPos _x);
	} forEach _playerGroup; // array of players

	//-- Divide sums by count of players
	_centerPos = _centerPos vectorMultiply (1 / count _playerGroup); 
	_position = _centerPos;
	_position = [_centerPos, random[30,45,60], _centerPos getDir (position _morter)] call BIS_fnc_relPos;	
};

null = [_morter, east, _typeRound, _density, [_position, 80],_minimunDistance,_maximunDistance,20] execVM "scripts\NEKY_Mortars\NEKY_Mortars.sqf";

// Examples
//null = ["OffMap", east, "Sporadic", "light", [_posToFireAt, 50]] execVM "scripts\NEKY_Mortars\NEKY_Mortars.sqf";
//null = [Mortar1, east, "Precise", "light", [_posToFireAt, 100],100,500,20] execVM "Scripts\NEKY_Mortars\NEKY_Mortars.sqf";
//null = [Mortar2, east, "safe", "light", [_position, 50],100,500,20] execVM "Scripts\NEKY_Mortars\NEKY_Mortars.sqf";
//null = [Mortar2, east, "guided", "Medium", ["auto", 80],100,250,20] execVM "Scripts\NEKY_Mortars\NEKY_Mortars.sqf";


// In trigger
//[mortero_1, thisList, "guided", "Medium", true, 100, 250] execVM "scripts\mortero.sqf";
//[mortero_2, thisList, "safe", "light", false, 200, 380] execVM "scripts\mortero.sqf";

