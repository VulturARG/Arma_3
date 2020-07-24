// v.1.8
// If the vehicle is in the list, enable smart behaviour.
diag_log ("core\scripts\smart_tank\smart.sqf started, isServer: " + str isServer);

call compile preprocessFile "core\scripts\smart_tank\functions.sqf"; // contains calculations
rotate = compile preprocessFile "core\scripts\smart_tank\rotate.sqf"; // rotates the hull
scan = compile preprocessFile "core\scripts\smart_tank\scan.sqf"; // scan the horizon

_vehicles = []; // all vehicles array
_active = []; // vehicles already running script
_inactive = []; // vehicles to be removed from array

if (!isServer) then {
  "msg" addPublicVariableEventHandler {
    player commandChat msg;
  };
};

while {true} do {
	_vehicles = vehicles;
	{
		if ((true in ([_x] call list_weapons)) AND !(_x in _active) AND alive _x)
		then {
			if (local _x) then {
			  [_x] execVM "core\scripts\smart_tank\setup.sqf";
			}
			else {
			  _x addEventHandler ["Local", {
			    if (_this select 1) then {
				  [_this select 0] execVM "core\scripts\smart_tank\setup.sqf";
				};
			  }];
			};
			_active = _active + [_x];
		}
	} foreach _vehicles;
	
	_inactive = [];
	{
		if (!(alive _x)) then {
			_inactive = _inactive + [_x];
		}
	} foreach _active;
	_active = _active - _inactive;
	sleep 30;
}
