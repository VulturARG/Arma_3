/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

private _disableGroupIA = getMissionConfigValue ["DESACTIVAR_IA_DE_GRUPO", 1];
private _disableBluforIA = getMissionConfigValue ["DESACTIVAR_TODO_BLUFOR", 0];
private _standMedico = getMissionConfigValue ["STAND_MEDICO", objNull];
private _standIngeniero = getMissionConfigValue ["STAND_INGENIERO", objNull];
private _standPiloto = getMissionConfigValue ["STAND_PILOTO", objNull];
_standMedico = missionNamespace getVariable [_standMedico, objNull];
_standIngeniero = missionNamespace getVariable [_standIngeniero, objNull];
_standPiloto = missionNamespace getVariable [_standPiloto, objNull];

setTerrainGrid 25;

[] execVM "scripts\civiles.sqf";

[] execVM "scripts\setBriefing.sqf";

if(! isNil "roles") then {
  [roles] execVM "scripts\init_roles.sqf";
};

[_standMedico, _standIngeniero, _standPiloto] execVM "scripts\init_stands.sqf";

[] execVM "scripts\init_vcom_driving.sqf";

player disableAI "MOVE";
player action ["SwitchWeapon", player, player, 100];
player setUnitPos "middle";

// Deshabilita el movimiento de la IA para todas las IA que
// esten en el mismo grupo que un jugador humano
if(_disableGroupIA == 1)then{
  private _units = units (group player);
  {
    if(local _x) then {
      _x disableAI "MOVE";
      _x action ["SwitchWeapon", _x, _x, 100];
      _x setUnitPos "middle";
    };
  }foreach _units;
};

if(_disableBluforIA == 1) then {
  {
    if(side _x == west && local _x) then {
      _x disableAI "MOVE";
      _x action ["SwitchWeapon", _x, _x, 100];
      _x setUnitPos "middle";
    };
  }foreach allUnits;
};

/*******************************************************************************
                        Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/
//Agrega al mapa las estructuras adicionales
if (isServer) then {

  ////Find marker and get the size

  _mkr= "mapa";
  _mkr setmarkerAlpha 0;
  _pos=markerpos _mkr;
  _mkrY= getmarkerSize _mkr select 0;
  _mkrX= getmarkerSize _mkr select 1;
  _distance= _mkrX;
  if (_mkrY > _mkrX) then {
    _distance=_mkrY;
  };

  ////Create New House Markers
  _HouseArray = ["Building","House"];
  _nearestBuildings = nearestObjects [_pos, _HouseArray, _distance];
  {
    _x setVectorUp [0,0,1];
    _x enableSimulation false;

    _boundingBox = boundingBox _x;
    _dir = getDir _x;
    _position = getPosATL _x;

    _size = _boundingBox select 1;
    _size resize 1.5;
    _markername = "marker" + str(floor(random 500)) + str(floor(random 500));
    //Marker creation
    createMarker [_markername, _position];
    _markername setMarkerShape "RECTANGLE";
    _markername setMarkerSize _size;
    _markername setMarkerBrush "SolidFull";
    _markername setMarkerColor "ColorGrey";
    _markername setMarkerDir _dir;
  } forEach _nearestBuildings;
};



// Lista de marcadores
//marcadores = ["M_Aerodoromo","M_Aeropuerto","M_Anthrakia","M_Base_Pyrgos","M_Chalkeia","M_Charkia","M_Dorida","M_Feres","M_Kalochori","M_Panagia","M_Paros","M_Pyrgos","M_Rodopoli","M_Selakano"];
marcadores = ["M_Aerodoromo","M_Base_Pyrgos","M_Chalkeia","M_Charkia","M_Dorida","M_Feres","M_Panagia","M_Pyrgos","M_Selakano"];
