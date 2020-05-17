params [["_nuevosWP",""],["_redirigidos",["",0,""]],["_lado",EAST]];

_todos = allGroups select {side _x isEqualTo _lado};//returns all groups of _lado

_coincidentes = [];
_listaApoyo = [];
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
        {
          doStop _x;
        }forEach units _x;
        _azarMarker = _nuevosWP call BIS_fnc_selectRandom;
        _mPos = markerpos _azarMarker;
        _mkrX=getMarkerSize _azarMarker select 0;
        _mkrY=getMarkerSize _azarMarker select 1;
        _mkrSize = 0;
        if (_mkrX > _mkrY) then {
            _mkrSize = _mkrY;
        } else {
            _mkrSize = _mkrX;
        };
        _getToMarker = _x addWaypoint [_mPos, 0];
    		_getToMarker setWaypointType "SAD";
    		_getToMarker setWaypointSpeed "LIMITED";
    		_getToMarker setWaypointBehaviour (["COMBAT","AWARE"] call BIS_fnc_selectRandom);
        _getToMarker setWaypointFormation "NO CHANGE";
    		_getToMarker setWaypointCompletionRadius _mkrSize;
    		_getToMarker setWaypointCombatMode "RED";
        units _x doFollow leader _x;
      }else{
        if (count _secundarioWP > 0) then {
          _mPos = markerpos _secundarioWP;
          _mkrX=getMarkerSize _secundarioWP select 0;
          _mkrY=getMarkerSize _secundarioWP select 1;
          _mkrSize = 0;
          if (_mkrX > _mkrY) then {
              _mkrSize = _mkrY;
          } else {
              _mkrSize = _mkrX;
          };
          _getToMarker = _x addWaypoint [_mPos, 0];
          _getToMarker setWaypointType "SAD";
          _getToMarker setWaypointSpeed "LIMITED";
          _getToMarker setWaypointBehaviour "COMBAT";
          _getToMarker setWaypointFormation "NO CHANGE";
          _getToMarker setWaypointCompletionRadius _mkrSize;
          _getToMarker setWaypointCombatMode "RED";
        };
      };
  } forEach _escuadronIA; // */
}forEach _redirigidos;

// Borro los wp de las unidades libres y los redirijo
{
  _nombreGrupo = groupId _x;
  _comparo = _listaApoyo select {[_nombreGrupo, groupId _x] call BIS_fnc_inString};
  if (count _comparo == 0) then {
  //if (_comparo isEqualTo []) then {
    for "_i" from count waypoints _x - 1 to 0 step -1 do{
      deleteWaypoint [_x, _i];
    };
    {
      doStop _x;
    }forEach units _x;

    _azarMarker = _nuevosWP call BIS_fnc_selectRandom;
    _mPos = markerpos _azarMarker;
    _mkrX=getMarkerSize _azarMarker select 0;
    _mkrY=getMarkerSize _azarMarker select 1;
    //systemChat (format ["_mkrX: %1 _mkrY: %2", _mkrX,_mkrY]);
    _mkrSize = 0;
    if (_mkrX > _mkrY) then {
        _mkrSize = _mkrY;
    } else {
        _mkrSize = _mkrX;
    };
    _getToMarker = _x addWaypoint [_mPos, 0];
		_getToMarker setWaypointType "SAD";
		_getToMarker setWaypointSpeed "LIMITED";
		_getToMarker setWaypointBehaviour (["AWARE","COMBAT","AWARE"] call BIS_fnc_selectRandom);
    _getToMarker setWaypointFormation "NO CHANGE";
		_getToMarker setWaypointCompletionRadius _mkrSize;
		_getToMarker setWaypointCombatMode "RED";
    units _x doFollow leader _x;
  };// fin if
}forEach _todos;


[format ["_todos: %1", _todos]] call BIS_fnc_logFormat;
[format ["_listaApoyo: %1", _listaApoyo]] call BIS_fnc_logFormat;
[format ["_coincidentes: %1", _coincidentes]] call BIS_fnc_logFormat;

// */
