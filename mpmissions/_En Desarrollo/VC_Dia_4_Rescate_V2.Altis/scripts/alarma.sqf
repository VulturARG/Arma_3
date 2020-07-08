/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/
sleep 30; 
for "_i" from 1 to 3 do {
  playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss",altavoces, false, getPosATL altavoces, 5, 1, 750];
  playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss",altavoces_1, false, getPosATL altavoces_1, 5, 1, 750];
  sleep 10;
};
sleep 15;
{
    _x setCaptive false;
} forEach units encubiertos;
