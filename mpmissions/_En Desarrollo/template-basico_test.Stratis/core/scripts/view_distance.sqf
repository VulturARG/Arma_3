/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

private _defaultDistance = _this select 0;
private _inAreaDistance = _this select 1;
private _color = "Vacio";
private _inArea = false;
private _inAircraft = false;
private _maxDistance = 10000;
private _vehiclePlayer = false;

setViewDistance _defaultDistance;

if (getMarkerType "vision" != "Empty") exitWith {
    if (isServer) then  {
        systemChat "No se encontro marcador con color de ejemplo. El mismo deberia llevar de nombre de variable: vision. Ademas debe ser tipo Empty";
    };
};

 _color = (getMarkerColor "vision");

{
    if ((getMarkerType _x != "Empty") && ((getMarkerColor _x) == _color)) then {
        _x setMarkerAlphaLocal 0;
    };
} forEach allMapMarkers;

while {true} do {
    _inArea = false;
    _inAircraft = false;
    if( !(isNull objectParent player) && MANDI_ENABLE_DIST) then {
        _vehiclePlayer = vehicle player;
        _inAircraft = _vehiclePlayer isKindOf "Helicopter" || _vehiclePlayer isKindOf "Plane";
    };
    if (!_inAircraft && MANDI_ENABLE_DIST) then {
        {
            if ((getMarkerType _x != "Empty") && ((getMarkerColor _x) == _color) && !_inArea) then {
                if (player inArea _x)then{
                    _inArea = ((getPos player) select 2) < 20;
                };
            };
        } forEach allMapMarkers;

        if (viewDistance != _inAreaDistance && _inArea) then {
            setViewDistance _inAreaDistance;
        };

        if (viewDistance != _defaultDistance && !_inArea) then {
            setViewDistance _defaultDistance;
        };
    };
    if (viewDistance != _maxDistance && _inAircraft && MANDI_ENABLE_DIST && assignedVehicleRole player select 0 != "cargo") then {
        setViewDistance _maxDistance;
    };
    sleep 5;
};

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

//vehicle player isKindOf "helicopter" && assignedVehicleRole player select 0 != "cargo"
//https://forums.bohemia.net/forums/topic/222871-check-if-player-is-in-a-specific-turret/

//https://forums.bohemia.net/forums/topic/151732-b2-scripts/