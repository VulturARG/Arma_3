///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _vision = _this select 0;
private _nueva = _this select 1;
private _color = "Vacio";
private _contador = 0;

try
{
    if (getMarkerType "vision" == "Empty")then
    {
       _color = (getMarkerColor "vision");
    }
    else
    {
        if (isServer)then
        {
            systemChat "No se encontro marcador con color de ejemplo. El mismo deberia llevar de nombre de variable: vision. Ademas debe ser tipo Empty";
        };
    };
}
catch
{

};

{
    if ((getMarkerType _x != "Empty")&&((getMarkerColor _x) == _color))then
    {
        private _tam = (getMarkerSize _x);
        if (markerAlpha _x !=0)then
        {
            _x setMarkerAlphaLocal 0;
        };
        if ((player distance2D (getMarkerPos _x)) <= (_tam select 0))then
        {
          private _pos = getPos player;
          if((_pos select 2) < 50)then{
            _contador = _contador + 1;
          };
        };
    };
} forEach allMapMarkers;

if (_contador > 0)then
{
   setViewDistance _nueva;
}
else
{
   if (viewDistance == _nueva)then
   {
        setViewDistance _vision;
   };
};

if (_color != "Vacio")then
{
    sleep 5;
    null = [_vision, _nueva] execVM "scripts\dist_vis.sqf";
};

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
