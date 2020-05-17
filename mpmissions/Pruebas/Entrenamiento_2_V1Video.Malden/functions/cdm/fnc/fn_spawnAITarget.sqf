/*
	Pops up all targets in trigger radious (trigger A axis).
    
    Parameters:
    
        trigger or array of triggers
*/

if (!isServer) exitWith { true };

private ["_spawnGroupId", "_spawnGroup", "_tempUnits", "_classNames", "_markers", "_wp", "_origin", "_destination", "_direction", "_vehicle", "_group"];

_spawnGroupId = _this select 0;
_classNames = _this select 1;
_markers = _this select 2;

// prevent flooding
if (CDM_SPAWNED_TIME + 15 > time)  exitWith { true };
CDM_SPAWNED_TIME = time;

#define PUSH(A,B) A set [count (A),B];

// create global
if ( isNil format ["CDM_SPAWNED_AI_%1", _spawnGroupId] ) then {
    call compile format ["CDM_SPAWNED_AI_%1 = [];", _spawnGroupId];
};

_spawnGroup = call compile format ["CDM_SPAWNED_AI_%1", _spawnGroupId];

// clear old AI
{
    deleteVehicle _x;
} forEach _spawnGroup;

_origin = getMarkerPos (_markers select 0);
_direction = markerDir (_markers select 0);
_destination = getMarkerPos (_markers select 1);

{
    _vehicle = _x createVehicle _origin;
    _vehicle setDir _direction; //Set the vehicles direction the same as the marker.

    createVehicleCrew _vehicle;
    
    {
        PUSH(_spawnGroup, _x)
    } forEach crew _vehicle;
    
    PUSH(_spawnGroup, _vehicle)
    
    _vehicle allowDamage true;

} forEach _classNames;

_group = createGroup east;
_spawnGroup joinSilent _group;

_group setBehaviour "CARELESS";
_group setFormation "COLUMN";
_group addWaypoint [_destination, 40];
_group addWaypoint [_origin, 40];
_wp = _group addWaypoint [_origin, 0];
_wp setWaypointType "CYCLE";


true;