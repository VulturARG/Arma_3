/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

private _enableAutomatiEnsign   = getMissionConfigValue ["INSIGNIA_AUTOMATICA",  1] == 1;
private _ensignIR               = getMissionConfigValue ["INSIGNIA_IR",  0] == 1;
private _availableInsigniaTypes = parseSimpleArray getMissionConfigValue ["AVAILABLE_INSIGNIA_TYPES", '[]'];

if (!_enableAutomatiEnsign) exitWith {};

params [["_unit", player]];

private _isMedic = _unit getVariable ["ace_medical_medicClass", 0];
if (_isMedic > 0) exitWith { [_unit, 'arga_in_visible_medico'] call BIS_fnc_setUnitInsignia; };

private _group        = [_unit] call MIV_fnc_getGroup;
private _insignia     = if (_ensignIR) then {"arga_in_ir_"} else {"arga_in_visible_"};
private _insigniaType = '';

_insigniaType = ( _availableInsigniaTypes select {_group isEqualTo _x} ) select 0;
_insigniaType = if (isNil "_insigniaType") then {'arga'} else {_insigniaType};
_insignia = format['%1%2',_insignia,_insigniaType];

[_unit, ""] call BIS_fnc_setUnitInsignia;

[_unit, _insignia] call BIS_fnc_setUnitInsignia;

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
//["Insignia/_platoon:", _group] call MIV_fnc_log;

/*
    INSIGNIA_AUTOMATICA = 1;    // Añadir a arga_settings
    INSIGNIA_IR = 0;                    // establece si las insignias son IR o normales

    Setee la insignia de condor o yaguar (revisar caso con y sil tilde), en caso de
    no corresponder ninguna escuadra cargar la insignia de arga.

    La insignia de médico tiene prioridad.

    arga_in_visible_arga
    arga_in_visible_condor
    arga_in_visible_yaguar
    arga_in_visible_medico

    arga_in_ir_arga
    arga_in_ir_yaguar
    arga_in_ir_condor

    Junto con esto crear una función get_group con la signatura Unit -> String
    donde los posibles resultados son ["condor", "yaguar", "", nombrePersonalizado]
*/