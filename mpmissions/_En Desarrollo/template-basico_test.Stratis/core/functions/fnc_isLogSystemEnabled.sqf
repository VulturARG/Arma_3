/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

private _enableLogSystem = getMissionConfigValue ["LOG_SYSTEM", 0] == 1;
private _enableLogSystemOnlyDedicated = getMissionConfigValue ["LOG_SYSTEM_ONLY_DEDICATED", 0] == 1;

(_enableLogSystem && (!_enableLogSystemOnlyDedicated || isDedicated && _enableLogSystemOnlyDedicated));

/*["_enableLogSystem: ", _enableLogSystem] call MIV_fnc_log;
["_enableLogSystemOnlyDedicated: ", _enableLogSystemOnlyDedicated] call MIV_fnc_log;
["isDedicated: ", isDedicated] call MIV_fnc_log;
["logica: ", (_enableLogSystem && (!_enableLogSystemOnlyDedicated || isDedicated && _enableLogSystemOnlyDedicated))] call MIV_fnc_log;
*/
/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
