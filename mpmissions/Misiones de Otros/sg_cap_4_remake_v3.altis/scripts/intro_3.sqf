/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

private _mission = getMissionConfigValue ["onLoadName", ""];
private _location = getMissionConfigValue ["UBICACION", ""];
private _time = getMissionConfigValue ["HORARIO", ""];
private _isCampaign = getMissionConfigValue ["ES_CAMPANIA", 0];
private _campaignName = getMissionConfigValue ["NOMBRE_CAMPANIA", ""];
private _author = getMissionConfigValue ["author", "ArgA"];

titleCut ["", "BLACK FADED", 999];

playSound "effect_intro";

sleep 1;

if(_isCampaign == 1) then {
    ["<t font = 'PuristaSemiBold' size='2' color='#fff'>"+_campaignName+"",0,0.4,1,2,0.0] spawn bis_fnc_dynamictext;
};

sleep 5;

["<t size='1.3' color='#00B3FF'>CLAN ARGA<t font = 'PuristaSemiBold' size='1.0' color='#FFFFFF'><br/>"+_mission+"</t></t><br/><t size='0.9' color='#cccccc' font='PuristaSemiBold'>by "+_author+"</t>",0,0.3,4,2,0.0] spawn bis_fnc_dynamictext;

sleep 2;

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 5;
titleCut ["", "BLACK IN", 5];

[_mission, _location, _time] spawn BIS_fnc_infoText;

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/