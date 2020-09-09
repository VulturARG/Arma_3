/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/

private _tests = [
	"fnc_removeAccentMark",
	"fnc_replaceInString"
];

private ["_result"];

{
	_result = call compile preprocessFileLineNumbers format ["core\tests\test_%1.sqf", _x];
	["TEST ENDED:", _result] call MIV_fnc_log;
	systemChat format ["TEST ENDED: %1", _result];
} forEach _tests;

/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/
