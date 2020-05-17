//Llamado en cada frame para comprobar que el jugador siga encubierto

if (FAM_descubierto OR captive player) exitWith {};

if !((uniform player)  isEqualTo FAM_uniformeBLUFOR AND (headgear player) isEqualTo FAM_cascoBLUFOR) then{
    player setCaptive true;
    systemChat "Estamos encubierto";
} else {
    player setCaptive false;
};