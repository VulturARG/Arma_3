/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params ["_yak"];

if (!isServer) exitWith { };

private _DISCOVER_DISTANCE = 3000;

waitUntil {  sleep 5; (true in (allPlayers apply { _x distance2D _yak <= _DISCOVER_DISTANCE })) };

private _group = group _yak;

_group setBehaviour "COMBAT";

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/