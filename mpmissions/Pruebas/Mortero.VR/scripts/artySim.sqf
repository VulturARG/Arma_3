//Arty Incoming

//	2014/04/26

//Trigger, Count, Distance, Type
params["_theTrigger","_shellCount",["_safeDistance",62],["_shellType","Sh_82mm_AMOS"]];
//params["_theTrigger","_shellCount",["_safeDistance",62],["_shellType","G_40mm_SmokeRed"]];
systemChat format["%1",!isServer];
//if (!isServer) exitWith {};

//_theTrigger = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_theTriggerPos = getPos _theTrigger;
_theTriggerRadius = (triggerArea _theTrigger) select 0;
//_shellCount = [_this, 1, 1, [0]] call BIS_fnc_param;
//_safeDistance = [_this, 2, 62, [0]] call BIS_fnc_param;
//_shellType = [_this, 3, "Sh_82mm_AMOS", [""]] call BIS_fnc_param;

_safeDistance = 35;

systemChat format["%1",_safeDistance];

for "_index" from 1 to _shellCount do {
	_posToFireAt = [];
	while {(count _posToFireAt) == 0} do {
		_posToFireAt = [_theTriggerPos, (random _theTriggerRadius), (random 360)] call BIS_fnc_relPos;
		{
			if ((_x distance _posToFireAt) < _safeDistance) exitWith {_posToFireAt = [];};
		} forEach allUnits;
	};
	
	_posToFireAt set [2, 200];
	_shell = _shellType createVehicle _posToFireAt;
	_shell setPos _posToFireAt;
	_shell setVelocity [0,0,-200];
	

	systemChat format ["Restantes: %1 Distancia [%2 m]", _shellCount-_index+1, (player distance2D _posToFireAt)];

	sleep 5;
	/*if ((_index % 4) == 3) then {
		sleep (3 + (random 1) / 4);
	} else {
		sleep random 0.1;
	};*/

};
systemChat 'Terminado';
