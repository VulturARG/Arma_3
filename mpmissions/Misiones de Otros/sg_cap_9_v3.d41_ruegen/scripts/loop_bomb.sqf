/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params ["_time"];

if (!isServer) exitWith { };

if (isServer && !isDedicated) then {
    [_time] call MIV_fnc_log;
    systemChat str _time;
};

waitUntil { time > _time };

if (!MANDI_BOMBA_DESACTIVADA) then {
	execVM "scripts\detonate_bomb.sqf";	
};

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/