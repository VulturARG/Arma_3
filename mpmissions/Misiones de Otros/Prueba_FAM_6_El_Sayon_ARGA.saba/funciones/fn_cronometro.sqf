params["_tiempoFinal", "_tiempoComienzoReal"];

FAM_posX = (safeZoneX + safeZoneW) * 0.4825;
FAM_posY = safeZoneY * 0.726;

while {true} do 
{
	_tiempoActual = _tiempoFinal - serverTime;

	while {_tiempoActual > 10} do 
	{
		_tiempoActual = _tiempoFinal - serverTime;
		if(detenerTiempo) exitWith 
		{
			while {true} do 
			{
			
				["<t font = 'PuristaMedium'><t size = '1'><t color = '#00ffd8'>" + timedisplay + "</t>",-1,0.10,10,0,0,789] spawn BIS_fnc_dynamicText;
				uiSleep 10;
			};
		};
		_timeStamp = _tiempoActual/3600;
		timedisplay = [_timeStamp, "HH:MM:SS"] call BIS_fnc_timeToString;
		["<t font = 'PuristaMedium'><t size = '1'>" + timedisplay + "</t>",FAM_posX,FAM_posY,1,0] spawn BIS_fnc_dynamicText;
	};

	while {_tiempoActual <= 10 && _tiempoActual > 1} do
	{
		playSound "time";
		_tiempoActual = _tiempoFinal - serverTime;
		_timeStamp = _tiempoActual/3600;
		timedisplay = [_timeStamp, "HH:MM:SS"] call BIS_fnc_timeToString;
		["<t font = 'PuristaMedium'><t size = '1'><t color = '#FF0000'>" + timedisplay + "</t>",FAM_posX,FAM_posY,1,0] spawn BIS_fnc_dynamicText;
		uiSleep 1;
	};

	if(_tiempoActual >= 0) exitWith
	{
		_fin = [_tiempoActual, "HH:MM:SS"] call BIS_fnc_timeToString;
		["<t font = 'PuristaMedium'><t size = '1'><t color = '#FF0000'>" + "00:00:00" + "</t>",FAM_posX,FAM_posY,10,1,0,789] spawn BIS_fnc_dynamicText;	

		if(!isServer) exitWith {}; 

		publicTimerOver = true;
		publicVariable "publicTimerOver";
		[2] call FAM_fnc_contador;
		sleep 20;
		["sinTiempo"] remoteExecCall ["BIS_fnc_endMissionServer"];


	};
};