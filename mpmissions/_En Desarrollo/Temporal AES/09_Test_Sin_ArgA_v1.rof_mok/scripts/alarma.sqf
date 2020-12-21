/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

sleep 30; 

DETONADO = true;

west setFriend [resistance, 0];
resistance setFriend [west, 0];

for "_i" from 1 to 3 do {
  playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss",altavoces, false, getPosATL altavoces, 5, 1, 1000];
  playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss",altavoces_1, false, getPosATL altavoces_1, 5, 1, 1000];
  playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss",altavoces_2, false, getPosATL altavoces_2, 5, 1, 1000];
  playSound3D ["a3\data_f_curator\sound\cfgsounds\air_raid.wss",altavoces_3, false, getPosATL altavoces_3, 5, 1, 1000];
  sleep 10;
};
