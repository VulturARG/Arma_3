/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

private _enableShowFpsMap = getMissionConfigValue ["FPS_MAP", 1] == 1;
private _enableShowFpsLog = getMissionConfigValue ["FPS_LOG", 1] == 1;
private _enableShowFpsDB  = getMissionConfigValue ["FPS_DB",  1] == 1;
private _fpsIdleTime      = getMissionConfigValue ["FPS_IDLE_TIME",  30];

if (!_enableShowFpsMap && !_enableShowFpsLog) exitWith { };

private _sourcestr = "Server";
private _position = 0;
private _hcData = [];

waitUntil {time > _fpsIdleTime};

if (!isServer) then {
	_hcData = call MIV_fnc_HCData;
	if (!isNil "_hcData" ) then {
		_sourcestr = _hcData select 0;
		_position  = _hcData select 1;
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
	private _localunits = {local _x && !(isPlayer _x)} count (allUnits select {simulationEnabled _x});
	private _headlessClients = entities "HeadlessClient_F";
	private _humanPlayers = count (allPlayers - _headlessClients);
	private _totalunits = count (allUnits select {simulationEnabled _x}) - _humanPlayers;
	private _playerText = "player";
	if (_humanPlayers > 1) then { _playerText = "players"};

	if (_enableShowFpsMap) then {
		_myfpsmarker setMarkerColor "ColorGREEN";
		if (_myfps < 30) then {_myfpsmarker setMarkerColor "ColorYELLOW";};
		if (_myfps < 20) then {_myfpsmarker setMarkerColor "ColorORANGE";};
		if (_myfps < 10) then {_myfpsmarker setMarkerColor "ColorRED";};
	};

	private _fps        = round _myfps;
	private _text       = format ["%1: %2 fps, %3 local groups, %4 local units, %5 %6", _sourcestr, _fps, _localgroups, _localunits,_humanPlayers,_playerText];
	private _textForCSV = format [",%1,%2,%3,%4,%5,%6", _sourcestr, _fps, _localgroups, _localunits,_totalunits,_humanPlayers];

	if (_enableShowFpsLog) then {
		["FPS_DEBUG_CSV", _textForCSV] call MIV_fnc_log;
	};

	if (_enableShowFpsMap) then {
		_myfpsmarker setMarkerText _text;
	};

	if (_enableShowFpsDB) then {
		if (isServer) then {
			["info", _sourcestr, _fps, _localgroups, _localunits,_totalunits,_humanPlayers] execVM "core\scripts\db\querys\write_fps.sqf";
		} else {
			["info", _sourcestr, _fps, _localgroups, _localunits,_totalunits,_humanPlayers] call MIV_fnc_log;
			[["info", _sourcestr, _fps, _localgroups, _localunits,_totalunits,_humanPlayers],"core\scripts\db\querys\write_fps.sqf"] remoteExec ["BIS_fnc_execVM", 2, false];
		};
		
	};

	sleep 15;
};

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/