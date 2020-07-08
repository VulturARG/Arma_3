/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params [["_intro", 2]];

MANDI_INTRO_PLAYED = false;

call compile format ["addMissionEventHandler ['PreloadFinished', {if(!MANDI_INTRO_PLAYED)then{[] execVM 'scripts\intro_%1.sqf'; MANDI_INTRO_PLAYED = true;};}];", _intro];

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/