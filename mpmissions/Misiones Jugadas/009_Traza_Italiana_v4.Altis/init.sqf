/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

setTerrainGrid 40;

[] execVM "scripts\civiles.sqf";

[] execVM "scripts\setBriefing.sqf";

/*******************************************************************************
                          Realizado por |ArgA|Vultur
*******************************************************************************/
// Enciende las luces
_luces = [Luz_1,Luz_2,Luz_3,Luz_4,Luz_5,Luz_6,Luz_7];
{
    _x switchLight "ON";
} forEach _luces;

/*******************************************************************************/

//Agrega al mapa las estructuras adicionales
if (isServer) then {

////Find marker and get the size

  _mkr= "Traza_Italiana";
  _mkr setmarkerAlpha 0;
  _pos=markerpos _mkr;
  _mkrY= getmarkerSize _mkr select 0;
  _mkrX= getmarkerSize _mkr select 1;
  _distance= _mkrX;
  if (_mkrY > _mkrX)
  then {
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
/*******************************************************************************/
// FLARE FIX - recommended for vanilla missions and assets only, with mods you might have problems

// flare intensity, replace 30 with desired value
al_flare_intensity = 30;
publicvariable "al_flare_intensity";

// flare range, replace 500 with desired value
al_flare_range = 200;
publicvariable "al_flare_range";

al_mortar_flare_intensity = 70;
publicvariable "al_mortar_flare_intensity";

al_mortar_flare_range = 400;
publicvariable "al_mortar_flare_range";

// If you want to use FLARE FIX do not edit or remove lines bellow
player addEventHandler ["Fired",{private ["_al_flare"]; _al_flare = _this select 6;[[_al_flare],"AL_flare_fix\al_flare_enhance.sqf"] remoteExec ["execVM",0,true]}];

// FOR vanilla mortars place this line inside their init field.
// this addEventHandler ["Fired",{private ["_al_flare"]; _al_flare = _this select 6;[[_al_flare],"AL_flare_fix\al_flare_enhance.sqf"] remoteExec ["execVM",0,true]}];
