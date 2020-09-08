SAT_SatelliteCamera camPrepareTarget
[
	((getPos SAT_SatelliteTarget) select 0),
	((getPos SAT_SatelliteTarget) select 1) + 1,
	(getPos SAT_SatelliteTarget) select 2
];
SAT_SatelliteCamera camSetPos
[
	(getPos SAT_SatelliteTarget) select 0,
	(getPos SAT_SatelliteTarget) select 1,
	((getPos SAT_SatelliteTarget) select 2) + SAT_SatelliteInitialHeight
];
SAT_SatelliteCamera camPrepareFov SAT_SatelliteFOV;
SAT_SatelliteCamera camCommitPrepared 0;