missionStatus = "inProgress";
publicVariable "missionStatus";
reachwp1 = "inProgress";
publicVariable "reachwp1";
reachwp2 = "inProgress";
publicVariable "reachwp2";
reachwp3 = "inProgress";
publicVariable "reachwp3";
vipStatus = "withEnemy";
publicVariable "vipStatus";
stealthStatus = "undetected";
publicVariable "stealthStatus";
extractionStatus = "inProgress";
publicVariable "extractionStatus";

["Initialize", [true]] call BIS_fnc_dynamicGroups;
//add units to zeus loop
[] spawn {_run = true; _x = nil; while {_run} do {zeusModule addCuratorEditableObjects [allUnits]; sleep 30;};};
