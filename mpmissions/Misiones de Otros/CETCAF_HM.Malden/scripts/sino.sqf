_sinoArray = _this;

{
	_x addAction ["TOCAR SINO", "call fnc_tocar",[_x],1,false,true,"","player distance _target < 4"];
} forEach _sinoArray;

fnc_tocar = {
	_arguments=(_this select 3);
	_sino = _arguments select 0;
	private _soundLoc = [str missionConfigFile, 0, -15] call BIS_fnc_trimString;
	private _soundPlay = _soundLoc + "core\sounds\bell.wav";
	playSound3d [_soundPlay, _sino, false, getPosASL _sino, 5, 1, 100];
};