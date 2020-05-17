///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

_contador = 0;
{
    if ((getMarkerType _x) == "mil_dot")then
    {
        deleteMarker _x;
    };

}forEach allMapMarkers;

{
    private _marcador = createMarker [toString [_contador], (getPos _x)];
    _marcador setMarkerType "mil_dot";
    _marcador setMarkerColor "ColorOpfor";
    _contador = _contador + 1;
    hint format["%1", _contador];
}forEach allUnits;

sleep 0.6;

if (m)then
{
    null = [] execVM "scripts\testeo.sqf";
}

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
