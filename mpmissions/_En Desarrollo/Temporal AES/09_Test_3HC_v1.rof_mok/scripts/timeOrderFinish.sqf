/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

waitUntil { time > 9900};

private _alivePlayers  = call MIV_fnc_countAlivePlayers;
private _playersInBase = ["Base_ArgA"] call compile preprocessFileLineNumbers "scripts\countPlayerInMarker.sqf";

if (_playersInBase <= _alivePlayers * 0.4) then {
  ["scripts\screenOrderFinish.sqf"] remoteExec ["BIS_fnc_execVM", 0, false];  
};

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/