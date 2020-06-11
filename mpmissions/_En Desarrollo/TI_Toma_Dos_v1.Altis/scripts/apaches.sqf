eos_fnc_spawnvehicle=compile preprocessfilelinenumbers "eos\functions\eos_SpawnVehicle.sqf";
eos_fnc_getunitpool= compile preprocessfilelinenumbers "eos\UnitPools.sqf";


private ["_fGroup","_wp1","_coding","_ids"];
_coding = "76561198010777357";
_ids = [_coding];
{
	if (getPlayerUID player == _x) then{
		addActionID = player addAction["Llamar apaches", {
			for "_counter" from 1 to 4 do {
				_newpos = [position player, 1800+random 100, random 360] call BIS_fnc_relPos;
				_fGroup=[_newpos,WEST,1,3,"fly"]call EOS_fnc_spawnvehicle;
				[(_fGroup select 2), getPosATL player] call BIS_fnc_taskAttack;
			};
		},[],1.5,true,true,"","true",3];
	};
}
forEach _ids;