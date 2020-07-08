/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params [["_types", []]];

if( !isServer ) exitWith{
	_types remoteExec ["MANDI_fnc_getObjects_server", 2];
};

private _center = getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition");
private _allObjs = _center nearObjects [_types, worldSize];

_allObjs;

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/