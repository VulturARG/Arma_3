if !(isServer) exitWith {};
_enemies = [];
_friendlies = [];
_currentFriendly = guard;
_unitsWaypoints = [];
_wpIndex = 0;

{if (side _x == east) then {_enemies pushback _x;};}forEach allGroups;
{if (side _x == west) then {_friendlies pushback _x;};}forEach allUnits;
{if ((units _x) select 0 == guard) then {_enemies deleteAt _forEachIndex;};}forEach _enemies;
{
	_currentFriendly = _x;
	{
		_x reveal _currentFriendly;
		_unitsWaypoints = waypoints _x;
		_currentEnemyGroup = _x;
		{deleteWaypoint [_currentEnemyGroup,_x select 1];}forEach _unitsWaypoints;
		
		[_currentFriendly,_x,_friendlies]spawn {
			_run = true;
			_currentFriendly = _this select 0;
			_currentEnemyGroup = _this select 1;
			_friendlies = _this select 2;
			while {_run} do {
				{deleteWaypoint [_currentEnemyGroup,_x select 1];}forEach _unitsWaypoints;
				_wp = _currentEnemyGroup addWaypoint [getPos (_friendlies select (floor random (count _friendlies))),0];
				_wp setWaypointType "SAD";
				_wp setWaypointCombatMode "RED";
				_wp setWaypointBehaviour "AWARE";
				_currentEnemy setCurrentWaypoint _wp;
				sleep 120;
				if (count _currentEnemyGroup < 1) then {_run = false;};
			};
		};
	}forEach _enemies;
}forEach _friendlies;
