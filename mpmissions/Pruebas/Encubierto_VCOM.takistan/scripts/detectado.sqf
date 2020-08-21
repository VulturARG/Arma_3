//scripts\detectado.sqf

_unit addEventHandler ["FiredMan",{
	params ["_unit", "_weapon"];

	if (_vervose) then { systemChat _weapon; };
	_verbose = true;
	private _range = 300;
	_enemiesAtRange = allUnits select {side _x == EAST && _x iskindof "Man" && (_unit distance _x) < _range};

	if (count(_enemiesAtRange) > 0) then {
		if (_weapon != "rhsusf_weap_glock17g4") then {
			_unit setCaptive false;
			if (_vervose) then { systemChat "Si escucharon ese disparo perdimos la cobertura"; };
			[] spawn {
				_radiusPlayerDetected = ["RadiusDetected",50] call BIS_fnc_getParamValue;  //Radio de detección en metros
				_detectedTimeLimit = ["TimeToCallInContact",20] call BIS_fnc_getParamValue;//Tiempo de reacción en segundos

				_run = true;
				_timePlayerDetected = 0;
				_startTime = 0;
				_playerDetected = false;
				_playerNotified = false;

				while {_run && (stealthStatus == "undetected") } do {
					//if (_vervose) then { systemChat "_run"};
					//hint format["CP %1", !(captive _unit)];
					if (alive _unit) then {
						_playerDetected = false;
						_listEntitiesNear = (getPos _unit) nearEntities _radiusPlayerDetected;
						_listEnemiesNear = _listEntitiesNear select {side _x == east};

						{
							if ((_x knowsAbout _unit) > 1.4 && !(_playerDetected)) exitWith
							{
								_playerDetected = true;
								if (_vervose) then { systemChat "Algo sabe el enemigo"};
							};
						} forEach _listEnemiesNear;
						_startTime = diag_tickTime;
						call {
							if (_playerDetected && !(_playerNotified)) exitWith {
								_timePlayerDetected = diag_tickTime;
								if (_vervose) then { systemChat "Los enemigos sospechan que estamos cerca (>1.4)" };
								//hint "DETECTADOS";
								_playerNotified = true;
							};
							if (_playerDetected && _playerNotified && (_startTime >= _timePlayerDetected + _detectedTimeLimit)) exitWith {
								_run = false;
								if (_vervose) then { systemChat "Hemos sido descubiertos. Ya no estamos encubiertos" };
								//hint "DESCUBIERTOS";
								_unit setCaptive false;
								stealthStatus = "detected";
								publicVariable "stealthStatus";
							};
							if (!(_playerDetected) && _playerNotified) exitWith {
								_playerNotified = false;
								_timePlayerDetected = 0;
								if (_vervose) then { systemChat "SEGUROS" };
								//hint "SEGUROS";
								_unit setCaptive true;
								_run = false;
							};
						};
					} else {
						_run = false;
					};
					uiSleep 2;
				};
			};
		} else {
			private _rangePistol = 5;
			private _rangeVert = 3;
			_enemiesAtRange = allUnits select {side _x == EAST && _x iskindof "Man" && (_unit distance2D _x) < _rangePistol};
			{
				_dist2D = _unit distance2d arriba; 
				_dist = _unit distance arriba; 
				_distVer = sqrt(_dist*_dist - _dist2D*_dist2D );
				if (_distVer <= _rangeVert) exitWith { _unit setCaptive false; };
			} forEach _enemiesAtRange;
			uiSleep 15;
		}; 
	} else {
		_unit setCaptive true;
	};


}];

