/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

call compile preprocessFile "core\events\initPlayerLocal.sqf";

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/
// Quito el DARG y el microDARG del inventario de los jugadores
//player removeItem "ACE_DAGR";
//player removeItem "ACE_microDAGR";


// GPS en Mapa
nul = [] execVM 'scripts\GPS_II.sqf';
