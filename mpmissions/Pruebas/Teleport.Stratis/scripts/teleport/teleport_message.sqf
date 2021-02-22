/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/

if(isDedicated || !hasInterface ) exitWith {};

params["_startTrigger"];

if (count ([player] inAreaArray _startTrigger) > 0) then {

    titleCut ["", "BLACK FADED", 100];

    sleep 2;
    ["<t size='2' color='#00B3FF'>Unas horas mas tarde...</t>",0,0.4,1,2,0.0] spawn bis_fnc_dynamictext;
    sleep 10;

    "dynamicBlur" ppEffectEnable true;
    "dynamicBlur" ppEffectAdjust [6];
    "dynamicBlur" ppEffectCommit 0;
    "dynamicBlur" ppEffectAdjust [0.0];
    "dynamicBlur" ppEffectCommit 5;
    titleCut ["", "BLACK IN", 5];

};
 

//[_mission, _location, _time] spawn BIS_fnc_infoText;

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/

