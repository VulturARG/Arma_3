fn_estadoEncubierto = {
    systemChat "Comprobando mi vestimenta...";
    sleep 4;
    if(captive player) then{
        systemChat "No tendrían por qué dudar de mi identidad";
    }else{
        systemChat "Ya no estoy en modo encubierto";
        sleep 3;
        systemChat "Debo recordar usar uniforme enemigo, no tener chaleco y cubrirme la cara con cualquier cosa";
    };
};

player addAction 
[
    "Comprobar estado encubierto", 
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [] spawn fn_estadoEncubierto;
    },
    [],
    9, 
    false, 
    true, 
    "",
    "true", // _target, _this, _originalTarget
    -1,
    false,
    "",
    ""
];