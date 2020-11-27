/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

if (!isServer) exitWith { };

freeze = [];

private _contador = 0;
private _artilleryType = ["O_Mortar_01_F", "rhssaf_army_d30", "B_MBT_01_arty_F", "rhssaf_army_m252", "LOP_TKA_Static_D30", "rhs_2b14_82mm_msv", "rhs_2s3_tv", "rhs_D30_msv"];

artilleria = [];
{
    if (typeOf _x  in _artilleryType ) then {
        artilleria = artilleria + [_x];
        freeze = freeze + [_x, -10000];
        _contador = _contador + 1;
    };
} forEach vehicles;

null = [] execVM "scripts\mortero.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/