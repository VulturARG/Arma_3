disableSerialization;

setViewDistance SAT_ViewDistance;

[1] call SAT_adjustCamera;

(findDisplay 1000) displayRemoveEventHandler ["KeyDown",SAT_keyEventHandler];
(findDisplay 1000) displayRemoveEventHandler ["MouseZChanged",SAT_mouseWheelEventHandler];

SAT_SatelliteCamera cameraEffect ["terminate","back"];

camDestroy SAT_SatelliteCamera;
closeDialog 1000;
deleteVehicle SAT_SatelliteTarget;

onMapSingleClick "";
openMap false;
SAT_SatelliteActive = false;