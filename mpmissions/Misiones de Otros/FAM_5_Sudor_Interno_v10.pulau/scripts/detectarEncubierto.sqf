allUnits apply{
    if (side _x isEqualTo opfor) then{
        _x addEventHandler ["FiredNear", {
            params ["_unit", "_firer", "_distance"];
            if (!captive _firer) exitWith {};
            if(isPlayer _firer AND _distance < 30) then{
                [] remoteExecCall ["FAM_fnc_decubierto",0,true];
            };
        }];
    };
};