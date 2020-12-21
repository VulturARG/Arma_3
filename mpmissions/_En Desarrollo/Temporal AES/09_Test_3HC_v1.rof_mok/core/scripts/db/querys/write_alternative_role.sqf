/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params [["_units", allPlayers]];

if (!(call MIV_fnc_isLogSystemEnabled)) exitWith { };

private ["_query", "_description", "_newValue"];
private _values =  " ";
_query = "INSERT INTO role_alternative_name (`name`) VALUES";

{
	_description = roleDescription _x;  
	
	if (_description != "") then {
		_description = (roleDescription _x splitString "@") select 0;
		_newValue = format ["('%1')", (_description call MANDI_fnc_trim)];
			if (_forEachIndex ==  0) then {
			_values = [_values, _newValue] joinString " ";
		} else {
			_values = [_values, _newValue] joinString ",";
		};
	};	
} forEach _units;

_values = _values + ";";

_query = [_query, _values] joinString " ";

_query execVM "core\scripts\db\connect_db.sqf";


/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

