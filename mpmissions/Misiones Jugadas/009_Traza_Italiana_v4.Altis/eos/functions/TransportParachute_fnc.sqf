//Realizado por Vultur
//TransportUnload_fnc.sqf modificado para largar paracaidas

private ["_pad","_getToMarker","_cargoGrp","_vehicle"];
_mkr=(_this select 0); _mPos=getMarkerPos _mkr;
_veh=(_this select 1);
_counter=(_this select 2);
_PTAltSalto=(_this select 3);

_debug=false;
_vehicle = _veh select 0;
_grp = _veh select 2;
_cargoGrp= _veh select 3;

_dir_atk= _mPos getDir _vehicle;
_minDist = 200;
_Place=(_minDist + random 200);
_pos = [_mPos, _Place, _dir_atk] call BIS_fnc_relPos;
_pos = [ _pos select 0, _pos select 1, (_pos select 2) + _PTAltSalto];
//PLAYER SIDECHAT (format ["_Pos0: %1, _Pos1: %2, _Pos2: %3",_pos select 0,_pos select 1,_pos select 2]);

if (_debug) then {0= [_mkr,_counter,"Lanzamiento Paracaidas", _pos] call EOS_debug;};

{_x allowFleeing 0} forEach units _grp;
{_x allowFleeing 0} forEach units _cargoGrp;

//PLAYER SIDECHAT (format ["_mPos: %1, getVariable: %2",_mPos, missionNamespace getVariable "_mPos"]);

_wp1 = _grp addWaypoint [_pos, 0];
_wp1 setWaypointSpeed "FULL";
_wp1 setWaypointType "MOVE";
_wp1 setWaypointStatements ["true", "0 = [(vehicle this),150] execvm 'eos\functions\eject_paratrooper.sqf'"];

//waituntil {_vehicle distance _pos < 30};
//_cargoGrp leaveVehicle _vehicle;

//waitUntil{sleep 0.2; {_x in _vehicle} count units _cargoGrp == 0};
if (_debug) then {hint "Transport unloaded";};

//_cargoGrp = [_vehicle,150] execvm "eos\functions\eject_paratrooper.sqf";
/*
_getToMarker = _cargoGrp addWaypoint [_mPos, 0];
_getToMarker setWaypointType "SAD";
_getToMarker setWaypointSpeed "LIMITED";
_getToMarker setWaypointBehaviour "COMBAT";
_getToMarker setWaypointFormation (["STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "DIAMOND", "LINE"] call BIS_fnc_selectRandom);
_getToMarker setWaypointCompletionRadius 15;
////////////////////////////////////////////////////////////////////////////////*/
_dir_atk=random 360;
_Place= 2300;
_newpos = [_Pos, _Place, _dir_atk] call BIS_fnc_relPos;
_wp2 = _grp addWaypoint [_newpos, 0];
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle this) + [vehicle this];"];
