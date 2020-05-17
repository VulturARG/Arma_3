//////////////////////////////////////////////////////////////////
///////////      Realizado por |ArgA|Vultur|Sdo¹    //////////////
//////////////////////////////////////////////////////////////////
//
//[Nombre marcador,Color,Nombre simbolo] execVM "scripts\marcadores.sqf"
//
// Nombre marcador: Nombre del marcador a cambiar el Color
// Color: color a colocar
// Nombre simbolo: Genero un simbolo en la posición del marcador. Si esta vacio no se agrega.
//
//////////////////////////////////////////////////////////////////
_marcador = _this select 0;
_color = _this select 1;
_simbolo = _this select 2;

_marcador setMarkerColor _color;

//if (!isNil _simbolo) {
_marker_name = format ["sim_%1", _marcador];
_markerstr = createMarker [_marker_name, getMarkerPos _marcador];
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType _simbolo;
//}
