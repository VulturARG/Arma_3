if (isServer)then
{
    _comparacion = _this select 0;
    _marcador = _this select 1;
    _marcador setMarkerAlpha 0;
    {//////// Oculta las unidades
        if (((((getPos(_x)) distance2D (getMarkerPos (_marcador)) )< _comparacion)&&(!isObjectHidden _x)))then
        {
            _x enableSimulationGlobal false;
            _x hideObjectGlobal true;
        };
    }forEach vehicles;
    {
        if (((((getPos(_x)) distance2D (getMarkerPos (_marcador)) )< _comparacion)&&(!isPlayer _x)&&(!isObjectHidden _x)))then
        {
            _x enableSimulationGlobal false;
            _x hideObjectGlobal true;
        };
    }forEach allunits;
};
