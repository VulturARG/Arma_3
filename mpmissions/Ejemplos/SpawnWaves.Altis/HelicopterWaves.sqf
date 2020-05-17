// Simple Wave Spawn Demo, by big_wilk: https://www.youtube.com/watch?v=33cWZPP9qdo&feature=youtu.be

if !isServer exitWith {}; // End Script Here if not server.

for '_i' from 0 to 2 do { 
	 _spawnPos = [player, 500, (RANDOM 360)] call BIS_fnc_relPos; 
	 _spawnedVehicleArray = [_spawnPoS, 180, "B_Heli_Transport_01_F", EAST] call bis_fnc_spawnvehicle; 
	 _heli = _spawnedVehicleArray select 0; 
	 _heliCrewsGroup = _spawnedVehicleArray select 2; 
	 _heli doMove (position PLAYER); 
	 waitUntil {!alive _heli}; 
}; 
