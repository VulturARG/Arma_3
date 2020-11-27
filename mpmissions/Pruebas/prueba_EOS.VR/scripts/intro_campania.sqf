/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

private _mission      = getMissionConfigValue ["onLoadName", ""];
private _location     = getMissionConfigValue ["UBICACION", ""];
private _time         = getMissionConfigValue ["HORARIO", ""];
private _isCampaign   = getMissionConfigValue ["ES_CAMPANIA", 0];
private _campaignName = getMissionConfigValue ["NOMBRE_CAMPANIA", ""];
private _author       = getMissionConfigValue ["author", "ArgA"];

titleCut ["", "BLACK FADED", 999];

sleep 2;
playMusic "AmbientTrack02c_F_EXP";
sleep 4;
["<t size='3' color='#00B3FF'>CLAN ARGA</t>",0,0.4,1,2,0.0] spawn bis_fnc_dynamictext;
sleep 6;
if (_isCampaign == 1) then {    
    ["<t font = 'PuristaSemiBold' size='1.5' color='#FFFFFF'>Presenta</t>",0,0.4,1,2,0.0] spawn bis_fnc_dynamictext;
    sleep 5;  
    ["<t size='1' color='#FFFFFF'>Campaña<br/><t font = 'PuristaSemiBold' size='2' color='#00B3FF'>"+_campaignName+"</t>",0,0.4,1,2,0.0] spawn bis_fnc_dynamictext;
	sleep 5;
};
["<t size='1' color='#FFFFFF'>Misión<br/><t font = 'PuristaSemiBold' size='2' color='#00B3FF'>"+_mission+"</t></t>",0,0.4,1,2,0.0] spawn bis_fnc_dynamictext;
sleep 5;
["<t font = 'PuristaSemiBold' size='2.0' color='#00B3FF'>"+_author+"</t>",0,0.4,1,2,0.0] spawn bis_fnc_dynamictext;
sleep 5;

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 5;
titleCut ["", "BLACK IN", 5];

//[_mission, _location, _time] spawn BIS_fnc_infoText;

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

