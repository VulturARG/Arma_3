/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

params[["_versionCode",""]];

if (_versionCode isEqualTo "") exitWith { -1 };

private _firstMultiplier    = 100000;
private _secondMultiplier   = 500;
private _versionCodeArray   = _versionCode splitString ".";
private _verificationNumber = parseNumber(_versionCodeArray select 0) * _firstMultiplier + parseNumber(_versionCodeArray select 1) * _secondMultiplier + parseNumber(_versionCodeArray select 2);

_verificationNumber

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/
//["_verificationNumber:", _verificationNumber] call MIV_fnc_log;