/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params ["_marker", "_distancia"];

private _termino = false;

while {(true)}do
{
    {
        private _posicion = getPos _x;
        if ((_posicion distance2D (getMarkerPos _marker)) <= _distancia) exitWith
        {
            _termino = true;
        };
    }forEach allPlayers;
    if (_termino) exitWith{};
};
true;

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/
