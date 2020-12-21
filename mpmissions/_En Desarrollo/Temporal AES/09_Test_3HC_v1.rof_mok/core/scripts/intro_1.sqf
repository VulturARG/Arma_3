/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

private _mission = getMissionConfigValue ["onLoadName", ""];
private _location = getMissionConfigValue ["UBICACION", ""];
private _time = getMissionConfigValue ["HORARIO", ""];
private _isCampaign = getMissionConfigValue ["ES_CAMPANIA", 0];
private _campaignName = getMissionConfigValue ["NOMBRE_CAMPANIA", ""];
private _author = getMissionConfigValue ["AUTHOR", "ArgA"];

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

if(_isCampaign == 1)then{
    ["<t size='3' color='#222222'>"+_campaignName+"",0,0.4,1,2,0.0] spawn bis_fnc_dynamictext;
};

_camera camPrepareTarget player;
_camera camPreparePos [_x1 + 0.4, _y1, 40]; 
_camera camPrepareFov 0.440;
_camera camCommitPrepared 5;

sleep 4;

["<t size='0.9' color='#FFFFFF'>"+_author+"",0,0.4,5,5,0.0] spawn bis_fnc_dynamictext;

titleCut [" ","BLACK OUT",2];
_camera cameraEffect ["terminate", "back"];
camDestroy _camera;
titleCut [" ","BLACK IN",2];

[_mission, _location, _time] spawn BIS_fnc_infoText;

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/
