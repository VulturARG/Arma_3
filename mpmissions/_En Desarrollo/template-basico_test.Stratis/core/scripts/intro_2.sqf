/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

private _mission = getMissionConfigValue ["onLoadName", ""];
private _location = getMissionConfigValue ["UBICACION", ""];
private _time = getMissionConfigValue ["HORARIO", ""];
private _isCampaign = getMissionConfigValue ["ES_CAMPANIA", 0];
private _campaignName = getMissionConfigValue ["NOMBRE_CAMPANIA", ""];
private _author = getMissionConfigValue ["AUTHOR", "ArgA"];

titleCut ["", "BLACK FADED", 999];

if(_isCampaign == 1)then{
    ["<t size='3' color='#222222'>"+_campaignName+"",0,0.4,1,2,0.0] spawn bis_fnc_dynamictext;
	sleep 3;
};
["<t size='0.9' color='#FFFFFF'>"+_author+"",0,0.4,5,5,0.0] spawn bis_fnc_dynamictext;

sleep 5;

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 5;
titleCut ["", "BLACK IN", 5];

[_mission, _location, _time] spawn BIS_fnc_infoText;

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/