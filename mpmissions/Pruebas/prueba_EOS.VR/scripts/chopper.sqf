/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

params ["_spawnPosition","_endPosition"];

_VUL_GET_POSITION = {
    params ["_node"];
    private _position = [0,0,0];
    switch (typeName _node) do {
        case "STRING": { 
            _position = getMarkerPos _node;
        };
        case "OBJECT": { 
            _position = getPos _node;
        };
    };
    _position;
};

private _spawnPosition = [_spawnPosition] call _VUL_GET_POSITION;
private _endPosition   = [_endPosition]   call _VUL_GET_POSITION;
private _side          = independent;
private _faction       = 6;
private _vehType       = 4;

_spawnPosition = [_spawnPosition select 0, _spawnPosition select 1, 100];

private _fGroup=[_spawnPosition,_side,_faction,_vehType,"fly"] call EOS_fnc_spawnvehicle;

_wp1 = (_fGroup select 2) addWaypoint [_endPosition, 0];
_wp1 setWaypointSpeed "NORMAL";
_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointCombatMode "BLUE";
_wp1 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle this) + [vehicle this];"];

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/