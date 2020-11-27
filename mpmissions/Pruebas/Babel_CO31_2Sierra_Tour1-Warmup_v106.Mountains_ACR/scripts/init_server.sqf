diag_log "ADF RPT: Init - executing scripts\init_server.sqf"; // Reporting. Do NOT edit/remove
if !(isMultiplayer) then {systemChat "NOTICE: The campaign missions have been designed for multiplayer / COOP game-play. Certain aspects might not work as they should in single player mode or local host mode.";};

// ADF_mod_ACT
ADF_ACT_vehiclesMax 			= 2;
ADF_ACT_vehiclesRadiusSpawn 	= 1250;
ADF_ACT_vehiclesRadiusTerm 	= 1500;
ADF_ACT_manMax 				= 3;
ADF_ACT_manRadiusTerm 			= 500;
ACT_debug 					= false;
execVM "ADF\fnc\ambient\ADF_fnc_ACT.sqf";

{_x setMarkerBrush "SolidFull"; _x setMarkerColor "ColorRed"; _x setMarkerAlpha 0.1;} forEach ["mRed_1", "mRed_2", "mRed_3", "mRed_4", "mRed_5"];

// Load vehicle Supplies
[MRAP_2PC] execVM "mission\loadout\vehicles\ADF_vCargo_B_Car.sqf";
[medTruck] execVM "mission\loadout\vehicles\ADF_vCargo_B_TruckMedi.sqf"; 
{[_x] execVM "mission\loadout\vehicles\ADF_vCargo_B_CarSQD.sqf"} forEach [MRAP_2_1_SQUAD, MRAP_2_2_SQUAD];
{[_x] execVM "mission\loadout\vehicles\ADF_vCargo_B_CarIFT.sqf"} forEach [MRAP_2_1_ALPHA, MRAP_2_1_BRAVO, MRAP_2_2_ALPHA, MRAP_2_2_BRAVO];
{[_x] execVM "mission\loadout\vehicles\ADF_vCargo_B_CarIWT.sqf"} forEach [MRAP_2_3_WT1, MRAP_2_3_WT2];

// Object markers
[["Land_HBarrierWall6_F", "Land_HBarrier_5_F", "Land_Radar", "US_WarfareBBarracks_Base_EP1", "Fort_Barracks_USMC", "US_WarfareBFieldhHospital_Base_EP1"], uSpawn, 150] call ADF_fnc_objectMarkerArray;
{[_x] call ADF_fnc_reMarker} forEach ["respawn_west", "mVehRepair"];

// Create random IED's
private _a = ["mIED_1", "mIED_2", "mIED_3", "mIED_4", "mIED_5", "mIED_6", "mIED_7", "mIED_8", "mIED_9", "mIED_10", "mIED_11", "mIED_12", "mIED_13", "mIED_14", "mIED_15", "mIED_16", "mIED_17", "mIED_18", "mIED_19", "mIED_20", "mIED_21", "mIED_22", "mIED_23", "mIED_24", "mIED_25"];
for "_i" from 1 to 13 do {
	private _p	= selectRandom _a;
	_a	= _a - [_p]; 
	[_p] call ADF_fnc_createIED;
};

// Track zones
ADF_SOD_zonesTracker = {
	// init
	params ["_t", "_m"];
	
	// Set marker to active AO
	_m setMarkerColor "ColorOPFOR";
	_m setMarkerAlpha 0.3;
	
	waitUntil {
		sleep 5;				
		private _a = (getPos _t) nearEntities ["Man", 1000];
		private _c = {side _x == east} count _a;
		_c < 5;
	};

	_m setMarkerColor "ColorBLUFOR";
	_m setMarkerAlpha 0.2;
	
	ADF_clearedZones = ADF_clearedZones + 1;
	if (ADF_clearedZones == 5) then {ADF_endMission = true; publicVariable "ADF_endMission"};
	[ADF_clearedZones] remoteExec ["ADF_msg_clearedAO", -2, true];
};

// ADF_fnc_sitRep timer function. Aprrox 1 per hour.
[] spawn {
	sleep 600;
	waitUntil {
		sleep ((40 * 60) + ((random (10 * 60)) + (random (10 * 60))));
		if (ADF_endMission) exitWith {};
		remoteExec ["ADF_fnc_sitRep", -2, false];
		ADF_endMission
	};
};

// Add AO units to the curator
[] spawn {
	waitUntil {sleep 1; ADF_init_AO};

	waitUntil {
		{GMmod_1 addCuratorEditableObjects [[_x], true]} forEach allUnits + vehicles;
		sleep 10;
		(isNil "GMmod_1")
	};
};