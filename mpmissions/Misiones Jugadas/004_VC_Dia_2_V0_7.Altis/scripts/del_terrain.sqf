///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _color = "Default";

try
{
    if (getMarkerType "eliminar" == "Empty")then
    {
       _color = (getMarkerColor "eliminar");
    }
    else
    {
        systemChat "No se encontro marcador con color de ejemplo. El mismo deberia llevar de nombre de variable: eliminar. Ademas debe ser tipo Empty";
    };
}
catch
{

};

{
    if (((getMarkerColor _x) == _color))then
    {
        private _location = (getMarkerPos _x);
        private _radius = (getMarkerSize _x);
        private _terrainobjects = nearestTerrainObjects [_location, [], _radius select 0];
        {_x hideObjectGlobal true; _x enableSimulationGlobal false; } forEach _terrainobjects;
        _x setMarkerAlpha 0;
    };
} forEach allMapMarkers;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
