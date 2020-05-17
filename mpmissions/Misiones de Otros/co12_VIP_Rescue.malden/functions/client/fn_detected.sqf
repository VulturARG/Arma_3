_ourPlayer = _this select 0;
_radiusPlayerDetected = ["RadiusDetected",100] call BIS_fnc_getParamValue;
_detectedTimeLimit = ["TimeToCallInContact",20] call BIS_fnc_getParamValue;
_run = true;
_timePlayerDetected = 0;
_playerDetected = false;
_playerNotified = false;
_listEntitiesNear = [];
_listEnemiesNear = [];

firedHandler = player addEventHandler ["Fired",
	{if (_this select 2 == "rhsusf_throw_grenade" || _this select 2 == "rhs_throw_grenade" || _this select 2 == "rhsusf_throw_flash") then
	{
		[] spawn {sleep 10;
			"AN EXPLOSION HAS REVEALED OUR PRESENCE." remoteExec ["hint",0,false];  
			stealthStatus = "detected"; 
			publicVariable "stealthStatus";
		};
	};
	if (_this select 2 == "rhsusf_m112_muzzle" || _this select 2 == "rhsusf_m112x4_muzzle" || _this select 2 == "DirectionalMineRemoteMuzzle") then
	{
		_myChargePlanted = ((player nearObjects 2) select 1);
		[_myChargePlanted] spawn {
			_myChargePlanted = _this select 0;
			waitUntil {!alive _myChargePlanted};
			sleep 10;
			if (stealthStatus == "undetected") then {"AN EXPLOSION HAS REVEALED OUR PRESENCE." remoteExec ["hint",0,false];};
			stealthStatus = "detected"; 
			publicVariable "stealthStatus";
		};
	};
}];

while {_run} do
{
	if (alive player) then
	{
		_playerDetected = false;
		_listEntitiesNear = [];
		_listEnemiesNear = [];
		_listEntitiesNear = (getPos player) nearEntities _radiusPlayerDetected;
		{if (side _x == east && alive _x) then {_listEnemiesNear pushBack _x;};}forEach _listEntitiesNear;
		{if ((_x knowsAbout _ourPlayer) > 1.4 && !(_playerDetected)) then {_playerDetected = true;};}forEach _listEnemiesNear;
		
		if (_playerDetected && !(_playerNotified)) then
		{
			_timePlayerDetected = time;
			player groupChat "I think we may have been spotted.";
			_playerNotified = true;
		};
		
		if (_playerDetected && _playerNotified && (time >= _timePlayerDetected + _detectedTimeLimit)) then
		{
			_run = false;
			"YOUR TEAM HAS BEEN SPOTTED. PROCEED WITH HASTE." remoteExec ["hint",0,false];
			stealthStatus = "detected";
			publicVariable "stealthStatus";
		};
		
		if (!(_playerDetected) && _playerNotified) then
		{
			_playerNotified = false;
			_timePlayerDetected = 0;
		};
		
		if (vipStatus == "secured" || stealthStatus == "detected") then {_run = false;};
		
	};
	sleep 2;
};
