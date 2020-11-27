/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

if (!isServer) exitWith { };

private _MANDI_ARTILLERY_DISTANCIA = 175;
private _MANDI_ARTILLERY_DISPERSION = 75;
private _MANDI_SECURE_AREA = 100;

// Artilleria pesada
private _MANDI_ARTILLERY_DISCOVER_DISTANCE = 2000;
private _MANDI_ARILLERY_RELOAD_TIME = 60;

// Mortero
private _MANDI_ARTILLERY_MORTER_DISCOVER_DISTANCE = 1000;
private _MANDI_ARILLERY_MORTER_RELOAD_TIME = 60;

private _MANDI_ROUNDS_PER_WAVE = 4; // Rondas por orden

private _MANDI_ARTILLERY_TYPE = ["rhssaf_army_d30", "B_MBT_01_arty_F", "LOP_TKA_Static_D30", "rhs_2s3_tv", "rhs_D30_msv"];
private _MANDI_MORTER_TYPE = ["O_Mortar_01_F", "rhs_2b14_82mm_msv", "rhssaf_army_m252"];

IS_EMPTY_POSITION = 
{   
    params ["_x", "_y", "_z"];
    private _position = [_x, _y, _z];
    private _return = true;
    {
        if ((getPos _x) inArea [_position, _MANDI_SECURE_AREA, _MANDI_SECURE_AREA, 0, false]) then {
            _return = false;
        }
        
    } forEach allPlayers;
    _return;
};

Posicion =
{  
    private _pjs = [];
    {
        if ((_x distance2D (_this select 0)) <= (_this select 1) && (getPos _x) select 2 < 100) then {
            _pjs = _pjs + [_x];
        };
    }forEach allPlayers;
    private _pos = [];
    if (count _pjs > 0) then {
        private _player = selectRandom  _pjs;
        _pos = [
            [[position _player, _MANDI_ARTILLERY_DISTANCIA + _MANDI_ARTILLERY_DISPERSION]], 
            [[position _player, _MANDI_ARTILLERY_DISTANCIA - _MANDI_ARTILLERY_DISPERSION]],
            IS_EMPTY_POSITION
        ] call BIS_fnc_randomPos;
    };
    
    _pos;
};

Disparar =
{
    private _recibidos = _this select 0;
    private _procesado = [];
    private _pos = [];
    {
        if (typeName _x isKindOf "OBJECT") then {
            _procesado = _procesado + [_x];
        };
    }forEach _recibidos;

    for [{private _i = 0;}, {_i <= _MANDI_ROUNDS_PER_WAVE;}, {_i = _i + 1;}] do {
        private _tiempo = 0;
        private _cuenta2 = 0;
        {
            _pos = ([(_x), (_recibidos select ((_cuenta2 * 2) + 1))] call Posicion);
            if (count _pos > 0) then {
                _x commandArtilleryFire [_pos, getArtilleryAmmo [_x] select 0, 1];
            };
            _cuenta2 = _cuenta2 + 1;
            sleep 0.2;
        }forEach _procesado;
        sleep 12;
    };
    listos = [];
};

listos = [];

{
    private _x2 = _x;
    private _suma = 0;
    private _comparacion = 0;
    if (typeOf _x2 in _MANDI_ARTILLERY_TYPE) then {
        _comparacion = _MANDI_ARTILLERY_DISCOVER_DISTANCE;
    };
    if (typeOf _x2 in _MANDI_MORTER_TYPE) then {
        _comparacion = _MANDI_ARTILLERY_MORTER_DISCOVER_DISTANCE;
    };

    {
        if ((_x distance2D _x2) <= _comparacion)then
        {
            _suma = _suma + 1;
        };
    }forEach allPlayers;

    if (_suma > 0)then
    {
        private _cuenta = 0;
        private _comptiempo = 0;
        if (typeOf _x2 in _MANDI_ARTILLERY_TYPE) then {
            _comptiempo = _MANDI_ARILLERY_RELOAD_TIME;
        }; 
        if (typeOf _x2 in _MANDI_MORTER_TYPE) then {
            _comptiempo = _MANDI_ARILLERY_MORTER_RELOAD_TIME;
        };
        {
            if ((typeName _x) isKindOf (typeName _x2))then
            {
                if (_x == _x2)then
                {
                    if ((time - (freeze select (_cuenta + 1))) >= _comptiempo)then
                    {
                        freeze set [_cuenta, _x2];
                        freeze set [_cuenta + 1, time];
                        publicVariable "freeze";
                        listos = listos + [_x2, _comparacion];
                        //[_x2, _comparacion] call Disparar;
                    };
                };
            };
            _cuenta = _cuenta + 1;
        }forEach freeze;
    };
    sleep 1;
}forEach artilleria;

[listos] call Disparar;

sleep 5;

null = [] execVM "scripts\mortero.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/