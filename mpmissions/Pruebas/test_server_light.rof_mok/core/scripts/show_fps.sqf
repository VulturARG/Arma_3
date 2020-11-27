/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

private _enableShowFpsMap = getMissionConfigValue ["FPS_MAP",  1] == 1;
private _enableShowFpsLog = getMissionConfigValue ["FPS_LOG",  1] == 1;

if (!_enableShowFpsMap && !_enableShowFpsLog) exitWith { };

private _sourcestr = "Server";
private _position = 0;

if (!isServer) then {
	if (!isNil "HC1") then {
		if (!isNull HC1) then {
			if (local HC1) then {
				_sourcestr = "HC1";
				_position = 1;
			};
		};
	};

	if (!isNil "HC2") then {
		if (!isNull HC2) then {
			if (local HC2) then {
				_sourcestr = "HC2";
				_position = 2;
			};
		};
	};

	if (!isNil "HC3") then {
		if (!isNull HC3) then {
			if (local HC3) then {
				_sourcestr = "HC3";
				_position = 3;
			};
		};
	};

	if (!isNil "hc") then {
		if (!isNull hc) then {
			if (local hc) then {
				_sourcestr = "hc";
				_position = 1;
			};
		};
	};

	if (!isNil "hc1") then {
		if (!isNull hc1) then {
			if (local hc1) then {
				_sourcestr = "hc1";
				_position = 1;
			};
		};
	};

	if (!isNil "hc2") then {
		if (!isNull hc2) then {
			if (local hc2) then {
				_sourcestr = "hc2";
				_position = 2;
			};
		};
	};

	if (!isNil "hc3") then {
		if (!isNull hc3) then {
			if (local hc3) then {
				_sourcestr = "hc3";
				_position = 3;
			};
		};
	};
};

private ["_myfpsmarker"];

if (_enableShowFpsMap) then {
	
	_myfpsmarker = createMarker [format ["fpsmarker%1", _sourcestr], [0, -500 - (500 * _position)]];
	_myfpsmarker setMarkerType "mil_start";
	_myfpsmarker setMarkerSize [0.7, 0.7];
};

while {true} do {
	private _myfps = diag_fps;
	private _localgroups = {local _x} count allGroups;
	private _localunits = {local _x} count (allUnits select {simulationEnabled _x});
	private _headlessClients = entities "HeadlessClient_F";
	private _humanPlayers = count (allPlayers - _headlessClients);
	private _playerText = "player";
	if (_humanPlayers > 1) then { _playerText = "players"};

	if (_enableShowFpsMap) then {
		_myfpsmarker setMarkerColor "ColorGREEN";
		if (_myfps < 30) then {_myfpsmarker setMarkerColor "ColorYELLOW";};
		if (_myfps < 20) then {_myfpsmarker setMarkerColor "ColorORANGE";};
		if (_myfps < 10) then {_myfpsmarker setMarkerColor "ColorRED";};
	};

	private _text = format ["%1: %2 fps, %3 local groups, %4 local units, %5 %6", _sourcestr, (round (_myfps * 100.0)) / 100.0, _localgroups, _localunits,_humanPlayers,_playerText];
	private _textForCSV = format [",%1,%2,%3,%4,%5", _sourcestr, (round (_myfps * 100.0)) / 100.0, _localgroups, _localunits,_humanPlayers];

	if (_enableShowFpsLog) then {
		//["FPS_DEBUG_COUNT", _text] call MIV_fnc_log;
		["FPS_DEBUG_CSV", _textForCSV] call MIV_fnc_log;
	};

	if (_enableShowFpsMap) then {
		_myfpsmarker setMarkerText _text;
	};

	sleep 15;
};

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/