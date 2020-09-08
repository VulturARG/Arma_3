call SAT_closeCamera;
waitUntil{!SAT_SatelliteActive};
_null = [] spawn SAT_startSatellite;