_soldado = _this select 0;
_unit = group _soldado createUnit [typeOf _soldado, getPos _soldado, [], 0, "NONE"];
hint format ["%1  %2", _soldado, _unit];
