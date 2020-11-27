/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

if (isServer) exitWith {
    private _posGranade = [3713.93,6104.37,0.2];
    [target_arga_bomb, true] call MANDI_fnc_displayObject;
    0 setWindDir 350;
    {
        [_x, false] call MANDI_fnc_displayObject;
    } forEach allPlayers;
    "SmokeShellYellow" createVehicle _posGranade;

    [[], "scripts\camara_bomba_client.sqf"] remoteExec ["BIS_fnc_execVM", 0, true];

    "beep" remoteExec ["playSound", 0, false];

    sleep 7.2;

    [target_arga_bomb, ["tos", 20000]] remoteExec ["say3D", 0, false];

    sleep 5;

    [target_arga_bomb, false] call MANDI_fnc_displayObject;
};

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/