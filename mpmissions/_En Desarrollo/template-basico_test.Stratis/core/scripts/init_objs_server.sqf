/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

if (!isServer) exitWith { };

private _allStands = ["Land_InfoStand_V1_F"] call MANDI_fnc_getObjects_server;

[[_allStands], "core\scripts\handle_stands.sqf"] remoteExec ["BIS_fnc_execVM", 0, true];

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/