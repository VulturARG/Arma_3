/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/
params [["_nuevosWP",""],["_redirigidos",["",0,""]],["_lado",EAST]];

private _todos = allGroups select {side _x isEqualTo _lado};//returns all groups of _lado

private _coincidentes = [];
private _listaApoyo = [];
private _remanentes = [];

FNC_newWaypoint =
	{
    params ["_marker"];
    
    _mPos = markerpos _marker;
    _mkrX=getMarkerSize _marker select 0;
    _mkrY=getMarkerSize _marker select 1;
    _mkrSize = 0;
    if (_mkrX > _mkrY) then {
        _mkrSize = _mkrY;
    } else {
        _mkrSize = _mkrX;
    };
		_pos = [_mPos, random _mkrSize, random 360] call BIS_fnc_relPos;
		while {(surfaceiswater _pos)} do {
			_pos = [_mPos, random _mkrSize, random 360] call BIS_fnc_relPos;
		};
    _getToMarker = _x addWaypoint [_mPos, 0];
    _getToMarker setWaypointType "SAD";
    _getToMarker setWaypointSpeed "LIMITED";
    if (vehicle (leader _x) != (leader _x)) then {
      _getToMarker setWaypointBehaviour "SAFE";
    } else {
      _getToMarker setWaypointBehaviour "AWARE";
    };
    _getToMarker setWaypointFormation "NO CHANGE";
    _getToMarker setWaypointCombatMode "RED";
	};

{
  _marker = _x select 0;
  _porcentaje = _x select 1;
  _secundarioWP = _x select 2;
  _escuadronIA = _todos select {[_marker, groupId _x] call BIS_fnc_inString};
  _nroEscuadrones = count _escuadronIA;
  _escRedirigidos = round (_nroEscuadrones * _porcentaje / 100);
  _coincidentes set [count _coincidentes,_escuadronIA];

  {
      _listaApoyo set [count _listaApoyo,_x]; //Guardo una lista con todas las unidades que coinciden con los _redirigidos
      if (_forEachIndex < _escRedirigidos) then {
        for "_i" from count waypoints _x - 1 to 0 step -1 do{
          deleteWaypoint [_x, _i];
        };
        /*{
          doStop _x;
        }forEach units _x;*/
        _azarMarker = _nuevosWP call BIS_fnc_selectRandom;
        _azarMarker call FNC_newWaypoint;
        //units _x doFollow leader _x;
      }else{
        if (count _secundarioWP > 0) then {
          [format ["count _secundarioWP: %1",count _secundarioWP]] call BIS_fnc_logFormat;
          _secundarioWP call FNC_newWaypoint;
        };
      };
  } forEach _escuadronIA; // */
}forEach _redirigidos;

// Borro los wp de las unidades libres y los redirijo
_remanentes = _todos - _listaApoyo;
{
  for "_i" from count waypoints _x - 1 to 0 step -1 do{
    deleteWaypoint [_x, _i];
  };
  /*{
    doStop _x;
  }forEach units _x;
  */
  _azarMarker = _nuevosWP call BIS_fnc_selectRandom;
  _azarMarker call FNC_newWaypoint;
  //units _x doFollow leader _x;
}forEach _remanentes;

/*
[format ["_todos: %1", _todos]] call BIS_fnc_logFormat;
[format ["_listaApoyo: %1", _listaApoyo]] call BIS_fnc_logFormat;
[format ["_coincidentes: %1", _coincidentes]] call BIS_fnc_logFormat;
[format ["_remanentes: %1",_remanentes]] call BIS_fnc_logFormat;

// */
