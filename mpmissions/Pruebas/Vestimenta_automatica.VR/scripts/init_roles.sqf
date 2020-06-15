/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

params ["_box"];

if(isNil "_box") exitWith {};

private _camo = parseSimpleArray getMissionConfigValue ["CAMUFLAJE", ["Bosque", "Multicam"]];
private _camoColor = toLower (_camo select 0);
private _camoType = toLower (_camo select 1);
private _uniform = "";
private _helmet = "";
private _vest = "";
private _backPack = "";
private _backPackLittle = "";

if (_camoColor == "personalizado") then {
    _uniform = getMissionConfigValue ["UNIFORME_PERSONALIZADO", "arga_u_mbosque"];
    _helmet = getMissionConfigValue ["CASCO_PERSONALIZADO", "arga_cas_mbosque"];
    _vest = getMissionConfigValue ["CHALECO_PERSONALIZADO", "arga_c_mbosque"];
    _backPack = getMissionConfigValue ["MOCHILA_PERSONALIZADO", "arga_m_mbosque_p"];
    _backPackLittle = getMissionConfigValue ["MOCHILA_CHICA_PERSONALIZADO", "arga_m_mbosque_A"];
};

if (_camoType == "multicam" && _camoColor != "personalizado") then {
    if (_camoColor == "desierto") then {
        _camoColor = "desert";
    };
    _uniform = format ["arga_u_m%1", _camoColor];
    _helmet = format ["arga_cas_m%1", _camoColor];
    _vest = format ["arga_c_m%1", _camoColor];
    _backPack = format ["arga_m_m%1_p", _camoColor];
    _backPackLittle = format ["arga_m_m%1_a", _camoColor];
};

if (_camoType == "marpat" && _camoColor != "personalizado") then {
    _camoColor = [_camoColor, 0, 0] call BIS_fnc_trimString;
    _uniform = format ["arga_u_%1marpat", _camoColor];
    _helmet = format ["arga_cas_%1marpat", _camoColor];
    _vest = format ["arga_c_%1marpat", _camoColor];
    _backPack = format ["arga_m_%1marpat_p", _camoColor];
    _backPackLittle = format ["arga_m_%1marpat_a", _camoColor];
};

private _equipment = [];

if (_camoColor != "no editar") then {
    _equipment = [_uniform, _helmet, _vest, _backPack, _backPackLittle];
};

if (typeName _box == "STRING") then {
     [player, _box,_uniform,_helmet,_vest,_backPack,_backPackLittle] execVM "roles\base.sqf";
} else {
    private _roles = [
        ["Ametrallador M240", "roles\ametrallador_m240.sqf"], 
        ["Ametrallador M249", "roles\ametrallador_m249.sqf"], 
        ["Capitán", "roles\capitan.sqf"],
        ["Enfermero", "roles\enfermero.sqf"], 
        ["Francotirador", "roles\francotirador.sqf"], 
        ["Fusilero", "roles\fusilero.sqf"],
        ["Fusilero RA", "roles\fusilero_ra.sqf"], 
        ["Granadero", "roles\granadero.sqf"],
        ["Granadero Bengalas", "roles\granadero_bengalas.sqf"], 
        ["Ingeniero", "roles\ingeniero.sqf"],  
        ["Lanzador AA", "roles\lanzador_aa.sqf"], 
        ["Lanzador AT", "roles\lanzador_at.sqf"],
        ["Líder", "roles\lider_peloton.sqf"], 
        ["Médico de Combate", "roles\medico_combate.sqf"], 
        ["Médico", "roles\medico.sqf"], 
        ["Observador", "roles\observador.sqf"], 
        ["Piloto", "roles\piloto.sqf"], 
        ["Radio Operador", "roles\radio_operador.sqf"],
        ["Teniente", "roles\teniente.sqf"],
        ["Tirador FAL", "roles\tirador_fal.sqf"],
        ["Tirador MK11", "roles\tirador_mk11.sqf"]
    ];

    removeAllActions _box;

    {
        _box addAction ["<t color='#ffffff'>" + (_x select 0) + "</t>", {  
                params ["_target", "_caller", "_actionId", "_arguments"];
                private _rol =  (_arguments select 0);
                private _params = [_caller, (_rol select 1)];
                _params append (_arguments select 1);
                _params execVM "roles\base.sqf";
                hint format ["Rol: %1", _rol select 0]; 
            }, [_x, _equipment], 1.5, true, true, "","true", 4, false, "", ""  
        ];
    } forEach _roles;   
};

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/