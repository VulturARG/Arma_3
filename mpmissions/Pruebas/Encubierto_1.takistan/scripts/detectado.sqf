//scripts\detectado.sqf

player addEventHandler ["FiredMan",{
  params ["_unit", "_weapon"];

//systemChat _weapon;

	if (_weapon != "rhsusf_weap_glock17g4") then {
	  player setCaptive false;
	  systemChat "Si escucharon ese disparo perdimos la cobertura";

	  [] spawn {
		_radiusPlayerDetected = ["RadiusDetected",50] call BIS_fnc_getParamValue; //Radio de detección en metros
		_detectedTimeLimit = ["TimeToCallInContact",20] call BIS_fnc_getParamValue;//Tiempo de reacción en segundos

		_run = true;
		_timePlayerDetected = 0;
		_tiempo = 0;
		_playerDetected = false;
		_playerNotified = false;

		while {_run && (stealthStatus == "undetected") } do {
		  //systemChat "_run";
		  //hint format["CP %1", !(captive player)];
		  if (alive player) then {

			_playerDetected = false;
			_listEntitiesNear = (getPos player) nearEntities _radiusPlayerDetected;
			_listEnemiesNear = _listEntitiesNear select {side _x == east};

			{
			  if ((_x knowsAbout player) > 1.4 && !(_playerDetected)) exitWith
			  {
				_playerDetected = true;
				systemChat "Algo sabe el enemigo";
			  };
			} forEach _listEnemiesNear;
			_tiempo = diag_tickTime;
			call {
			  if (_playerDetected && !(_playerNotified)) exitWith {
				_timePlayerDetected = diag_tickTime;
				systemChat "Los enemigos sospechan que estamos cerca (>1.4)";
				//hint "DETECTADOS";
				_playerNotified = true;
			  };
			  if (_playerDetected && _playerNotified && (_tiempo >= _timePlayerDetected + _detectedTimeLimit)) exitWith {
				_run = false;
				systemChat "Hemos sido descubiertos. Ya no estamos encubiertos";
				//hint "DESCUBIERTOS";
				player setCaptive false;
				stealthStatus = "detected";
					publicVariable "stealthStatus";
			  };
			  if (!(_playerDetected) && _playerNotified) exitWith {
				_playerNotified = false;
				_timePlayerDetected = 0;
				systemChat "SEGUROS";
				//hint "SEGUROS";
				player setCaptive true;
				_run = false;
			  };
			};
		  } else {
			_run = false;
		  };
		  uiSleep 2;
		};
	  };

	}; //if
  
}];