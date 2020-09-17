/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

private _camo      = parseSimpleArray getMissionConfigValue ["CAMUFLAJE", ["Bosque", "Multicam"]];
private _camoColor = toLower (_camo select 0);

if (_camoColor == "no editar") exitWith { [] };

private _camoType       = toLower (_camo select 1);
private _uniform        = "";
private _helmet         = "";
private _vest           = "";
private _backPack       = "";
private _backPackLittle = "";

if (_camoColor == "personalizado") then {
    _uniform        = getMissionConfigValue ["UNIFORME_PERSONALIZADO", "arga_u_gen3_bosque_marpat"];
    _helmet         = getMissionConfigValue ["CASCO_PERSONALIZADO", "arga_cas_combate_bosque_marpat"];
    _vest           = getMissionConfigValue ["CHALECO_PERSONALIZADO", "arga_c_pesado_bosque_marpat"];
    _backPack       = getMissionConfigValue ["MOCHILA_PERSONALIZADO", "arga_m_petate_bosque_marpat"];
    _backPackLittle = getMissionConfigValue ["MOCHILA_CHICA_PERSONALIZADO", "arga_m_asalto_bosque_marpat"];
};

if (_camoColor != "personalizado" && _camoColor != "no editar") then {
    _uniform = format ["arga_u_gen3_%1_%2", _camoColor, _camoType];
    if (_camoColor == "negro") then {
        _camoType = "liso";
    };
    _helmet         = format ["arga_cas_combate_%1_%2", _camoColor, _camoType];
    _vest           = format ["arga_c_pesado_%1_%2", _camoColor, _camoType];
    _backPack       = format ["arga_m_petate_%1_%2", _camoColor, _camoType];
    _backPackLittle = format ["arga_m_asalto_%1_%2", _camoColor, _camoType];
};

[_uniform, _helmet, _vest, _backPack, _backPackLittle];

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/