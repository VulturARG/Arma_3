// update marker as long as map is open (works for uav stations as well)
J_myGPSEH = addMissionEventHandler ["Map", {
  params ["_mapIsOpened", "_mapIsForced"];

  if (_mapIsOpened) then {
    ((uiNamespace getVariable "BIS_UAV_DISPLAY") displayCtrl 112410) mapCenterOnCamera true;
    //hint format["%1",mapGridPosition  player];
    _markerstr = createMarkerLocal ["markername",player];
    _markerstr setMarkerShapeLocal "ICON";
    _markerstr setMarkerTypeLocal "mil_start";
    //_markerstr setMarkerTypeLocal "a3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa";
    _markerstr setMarkerDirLocal getDir player;
    switch (side player) do {
        case west:{ _markerstr setMarkerColorLocal "ColorWEST";};
        case east:{ _markerstr setMarkerColorLocal "ColorEAST";};
        case civ:{ _markerstr setMarkerColorLocal "ColorCIV";};
        case Independent:{ _markerstr setMarkerColorLocal "colorIndependent";};
    };
    _markerstr setMarkerTextLocal format["%1",mapGridPosition  player];

    // no sheduled environment -> create one
    /* Triggered when map is opened or closed either by user action or script command openMap. */
  /*  [] spawn {
      waitUntil{
        hint format["%1",mapGridPosition  soldado];
      };
    };// */
  } else{
    hint "";
    deleteMarkerLocal "markername";
  } ;
}];
