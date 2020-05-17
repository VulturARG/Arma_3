_movementdata = <mdata> ;
//_firingdata = <fdata> ;

_sequence = [C130_1, _movementdata] spawn BIS_fnc_UnitPlay;
//[VehicleName, _firingdata] spawn BIS_fnc_UnitPlayFiring;
waitUntil {scriptDone _sequence};
hint "Playback finished";
