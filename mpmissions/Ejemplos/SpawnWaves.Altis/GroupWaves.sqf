// Simple Wave Spawn Demo, by big_wilk: https://www.youtube.com/watch?v=33cWZPP9qdo&feature=youtu.be

if !isServer exitWith {}; // End Script Here if not server.

for '_i' from 0 to 9 do { 
	_spawnPos = [player, 300, (RANDOM 360)] call BIS_fnc_relPos; 
	_spawnPos = [_spawnPos, 1, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos; 
	_grp = [_spawnPos, EAST, 10] call BIS_fnc_spawnGroup; 
	_wp = _grp addWaypoint [position player, 0]; 
	sleep 5;  
}; 
