///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _posicion = getPos player;
private _x1 = _posicion select 0;
private _y1 = _posicion select 1;

titleCut ["","BLACK IN",999999999];
sleep 5;
titleCut ["","BLACK IN",5];
_camera = "camera" camCreate [_x1 +100, _y1 +100, 40];
_camera cameraEffect ["internal", "back"];

_camera camPrepareTarget player;
_camera camPreparePos [_x1 +100, _y1 +100, 40];
_camera camPrepareFov 0.440;
_camera camCommitPrepared 0;

sleep 1;

//["<t size='3' color='#222222'>Campaña",0,0.4,1,2,0.0] spawn bis_fnc_dynamictext; //Si existe, si no, comentar con // y no se ejecutara el comando.

_camera camPrepareTarget player;
_camera camPreparePos [_x1 + 0.4, _y1, 40];
_camera camPrepareFov 0.440;
_camera camCommitPrepared 5;

sleep 4;

titleCut [" ","BLACK OUT",2];
_camera cameraEffect ["terminate", "back"];
camDestroy _camera;
titleCut [" ","BLACK IN",2];

["<t size='0.8' color='#FFFFFF'>Volviendo a Casa",0,0.4,2,2,0.0] spawn bis_fnc_dynamictext;

any= ["Base Aeroclub",
"Altis",
"0700hs"
] spawn BIS_fnc_infoText;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
