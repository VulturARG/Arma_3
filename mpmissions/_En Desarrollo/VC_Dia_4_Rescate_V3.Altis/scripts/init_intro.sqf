/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params [["_intro", 3]];

call compile format ["addMissionEventHandler ['PreloadFinished', {[] execVM 'scripts\intro_%1.sqf';removeMissionEventHandler ['PreloadFinished', 0];}];", _intro];

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/