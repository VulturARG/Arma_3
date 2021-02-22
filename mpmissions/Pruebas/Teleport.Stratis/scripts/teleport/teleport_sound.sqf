/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/

if(isDedicated || !hasInterface ) exitWith {};

params["_startTrigger"];

if (count ([player] inAreaArray _startTrigger) > 0) then {
    playSound "VUL_CHOPPER";
}

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/