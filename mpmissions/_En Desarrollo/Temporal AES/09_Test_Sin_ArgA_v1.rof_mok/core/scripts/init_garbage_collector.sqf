/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/

if (getMissionConfigValue ["RECOLECTOR_BASURA",  1] == 0) exitWith {};

private _unitIA = [];
private _waitingTimeName = ["RB_TIEMPO_ESPERA_VEHICULOS","RB_TIEMPO_ESPERA_BLINDADOS", "RB_TIEMPO_ESPERA_AEREOS"];
private _enemyUnitType   = ["CAR","TANK","AIR"];

if (getMissionConfigValue ["RB_TIEMPO_ESPERA_HOMBRES", 0] != 0) then {
    _unitIA append (allUnits select {!isPlayer _x});
    // _unitIA append (allUnits-allPlayers);
};

{
    if (getMissionConfigValue [_x, 0] != 0) then {
        _unitIA append vehicles select {_x isKindOf _enemyUnitType select _foreachIndex};
    };    
    
} forEach _waitingTimeName;

{
    _x addeventhandler ["Killed", {_this execVM "core\scripts\garbage_collector.sqf"}];
} forEach _unitIA;

/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/
//[_unitIA] call MIV_fnc_log;
