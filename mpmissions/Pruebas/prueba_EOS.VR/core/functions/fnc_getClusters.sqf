/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

/*
    Recibe un set de puntos en el espacio (o posiciones) y las agrupa por distancia.
*/

params [["_points", []], ["_threshold", 200]];

_MIV_BFS_GET_DISTANCE = {
    params ["_node1", "_node2"];
    private _distance = 999999;
    switch (typeName _node1) do {
        case "ARRAY": { 
            _distance = _node1 distance _node2;
        };
        case "STRING": { 
            _distance = (getMarkerPos _node1) distance (getMarkerPos _node2);
        };
        case "OBJECT": { 
            _distance = _node1 distance _node2;
        };
        default { 
            _distance = _node1 distance _node2;
        };
    };
    _distance;
};

if (typeName _points != "ARRAY") exitWith { [] };
if (count _points == 0) exitWith { [] };

private _clusters = [];

private ["_neighbours", "_point", "_queue", "_queuePoint", "_cluster"];

while { count _points > 0 } do {
    _point = _points select 0;
    _cluster = [_point];
    _points = _points - [_point];
    _queue = _points select { [_x, _point] call _MIV_BFS_GET_DISTANCE <= _threshold };

    while { count _queue > 0} do {
        _queuePoint = _queue select 0;
        _cluster pushBack _queuePoint;
        _queue = _queue - [_queuePoint];
        _points = _points - [_queuePoint];
        _queue append (_points select { [_x, _queuePoint] call _MIV_BFS_GET_DISTANCE <= _threshold });
    };

    _clusters pushBack _cluster;
};

_clusters;

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/