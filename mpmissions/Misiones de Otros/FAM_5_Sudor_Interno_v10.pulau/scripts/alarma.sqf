params["_fuenteSonora", "_tiempo"];
private _tiempoActual = time;
private _tiempoFinal = _tiempoActual + _tiempo;

if(typeName _fuenteSonora isEqualTo "ARRAY") then{
	while {time< _tiempoFinal} do{
		{
			[_x, ["Alarm_OPFOR",500,1]] remoteEXEC ["say3D",0,true];
		}forEach _fuenteSonora;
		sleep 8;
	};
}else{
	while {time< _tiempoFinal} do{
		[_fuenteSonora, ["Alarm_OPFOR",500,1]] remoteExec ["say3D",0, true];
		sleep 8;
	};
};

