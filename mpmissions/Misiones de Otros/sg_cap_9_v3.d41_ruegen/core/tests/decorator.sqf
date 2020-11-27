/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/

params ["_tests", "_function"];

private _errors = [];

private ["_result"];
_function = format ["core\functions\%1.sqf", _function];

{
	_x params ["_input", "_expectedResult"];
	_result = _input call compile preprocessFileLineNumbers _function;
	if (_result != _expectedResult) then {
		_errors pushBack format ["Error, expected: %1, got: %2, input: %3", str _expectedResult, str _result, str _input];
	};
} forEach _tests;

if (count _errors == 0) then {
	["TEST PASSED:", _function] call MIV_fnc_log;
} else {
	["TEST FAILED: fnc_removeAccentMark", _function] call MIV_fnc_log;
	{
		_x call MIV_fnc_log;
	} forEach _errors;
};

count _errors == 0;

/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/
