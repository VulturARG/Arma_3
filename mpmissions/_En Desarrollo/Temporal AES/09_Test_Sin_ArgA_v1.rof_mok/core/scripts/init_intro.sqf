/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

if (!hasInterface) exitWith { };

private _intro = getMissionConfigValue ["INTRO", 2];
private _playIntro = (str getMissionConfigValue ["INTRO", 2]) != "0";
private _introPersonalizada = getMissionConfigValue ["INTRO_PERSONALIZADA", 0] == 1;

if (!_playIntro) exitWith { };

private _path = if (_introPersonalizada) then { _intro; } else { format ["core\scripts\intro_%1.sqf", _intro] };
call compile format ["addMissionEventHandler ['PreloadFinished', {[] execVM '%1'; removeMissionEventHandler ['PreloadFinished', 0];}];", _path];

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/