/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params["_mod"];
private _isPresent = false;

for "_i" from 0 to (count (configFile / "CfgPatches") - 1) do {
    scopeName "search";
	_cfg_entry = (configFile / "CfgPatches") select _i;
    if (isClass _cfg_entry) then {
		_isPresent = [_mod, str _cfg_entry] call BIS_fnc_inString;
		if (_isPresent) then {
			breakOut "search";
		};
    };
};
_isPresent