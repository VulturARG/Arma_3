// skyFlares.sqf
// startFlares = 1; null = [<max distance>, <base delay>, <max added delay>, <base height>, <random added or subtracted height>, <color>, <speed (must be negative)>, <object pos>] execVM "skyFlares.sqf";

// declare a few variables we need and make _sign randomly negative
_sign = 1;
_random = false;
if (floor random 10 > 4) then { _sign = -1 };
_flareArray = ["WHITE", "RED", "GREEN", "YELLOW", "IR"];

// organize our arguments
_flareDist = _this select 0;
_delay = _this select 1;
_delayRandom = _this select 2;
_flareHeight = _this select 3;
_flareHeightRandom = _this select 4;
_flareType = _this select 5;
_flareSpeed = _this select 6;
_flarePos = _this select 7;

// create loop for spawning flares
while { startFlares == 1 } do
{
	// check if random
	if (_flareType == "RANDOM") then { _flareType = _flareArray call BIS_fnc_selectRandom; _random = true };
	// assign colors
	switch (_flareType) do
	{
		case "WHITE": 	{ _flareType = "F_40mm_White" };
		case "RED": 	{ _flareType = "F_40mm_Red" };
		case "GREEN": 	{ _flareType = "F_40mm_Green" };
		case "YELLOW": 	{ _flareType = "F_40mm_Yellow" };
		case "IR": 	{ _flareType = "F_40mm_CIR" };
	};
	// get a random spot around the target
	_pos = [_flarePos, random _flareDist, random 360] call BIS_fnc_relPos;
	_pos = [_pos select 0, _pos select 1, _flareHeight + (random _flareHeightRandom * _sign)];
	// make the flare at that spot
	_flare = _flareType createVehicle _pos;
	// set its speed
	_flare setVelocity [0, 0, _flareSpeed];
	// delay plus random delay
	sleep _delay + random _delayRandom;
	// reset random if it was there before
	if (_random) then { _flareType = "RANDOM" };
};