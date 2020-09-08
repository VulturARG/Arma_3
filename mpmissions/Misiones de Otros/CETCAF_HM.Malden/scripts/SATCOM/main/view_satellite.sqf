//SATCOM camera

SAT_SatelliteActive = true; 

SAT_ViewDistance = viewDistance;
setViewDistance SAT_ViewDistanceNew;

SAT_SatelliteDialog = createDialog "SAT_RscSatellite";

[] spawn SAT_keyMain;
[] spawn SAT_timeView;
[] spawn SAT_coordinatesView;

SAT_SatelliteCamera = "camera" camCreate [0,0,0];
SAT_SatelliteCamera cameraEffect ["internal","back"];
call SAT_updateCamera;

showCinemaBorder false;

ppEffectDestroy SAT_ppColor;
ppEffectDestroy SAT_ppInversion;
ppEffectDestroy SAT_ppGrain;

SAT_ppGrain = ppEffectCreate ["filmGrain",2005];
SAT_ppGrain ppEffectEnable true;
SAT_ppGrain ppEffectAdjust [0.02,1,1,0,1];
SAT_ppGrain ppEffectCommit 0;
