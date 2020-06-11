/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

params [["_unit", player], "_rol", ["_uniform", "arga_u_mbosque"], ["_helmet", "arga_cas_mbosque"], ["_vest", "arga_c_mbosque"], ["_backPack", "arga_m_mbosque_p"], ["_backPackLittle", "arga_m_mbosque_a"]];

if (!local _unit) exitWith {};

_unit call MANDI_fnc_clearEquipment;

_unit forceAddUniform _uniform;
_unit addVest _vest;

if (! isNil "_rol") then {
    [_unit, _helmet, _backPack, _backPackLittle] execVM _rol;
};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/