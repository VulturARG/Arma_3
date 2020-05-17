//////////////////////////////////////////////////////////////////
///////////      Realizado por |ArgA|Vultur|Sdo¹    //////////////
//////////////////////////////////////////////////////////////////
// [_sourceObject] execVM "scripts\beepLocal.sqf";
_sourceObject = (_this select 0);
_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "sounds\Beeper2.ogg";
playSound3D [_soundToPlay, _sourceObject, false, getPos _sourceObject, 10, 1, 500];
//Volume db+10, volume drops off to 0 at 400 meters from _sourceObject
