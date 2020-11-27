// Prevent double accidental execution in the event the HC jip's or when the server and HC have both set 'ADF_HC_execute' to true
if (!isNil "init_AO_Exec") exitWith {diag_log "ADF RPT: Init - init_ao.sqf has already been executed! Terminating init_ao.sqf for this client."};
init_AO_Exec = true; publicVariable "init_AO_Exec";

diag_log "ADF RPT: Init - executing init_AO.sqf"; // Reporting. Do NOT edit/remove

///// MISSION BALANCER
waitUntil {time > 5};

// set defaults
ts_mb = 3;
private _mb = 3;

// count logged on players
private _pc = count (allPlayers - entities "HeadlessClient_F");
_mb = "ADF_mb" call BIS_fnc_getParamValue;

// Set balancer values
if (_mb == 0) then {
	ts_mb = switch true do {
		case (_pc < 16):				{1};
		case (_pc > 15 && _pc < 24):	{2};
		case (_pc > 23);
		default 						{3};
	};
	if (!isMultiplayer || ADF_debug) then {ts_mb = 3}; // testing
} else {
	ts_mb = _mb;
};
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["ADF RPT: Mission Balancer - param value: %1 - MB value (actual): %2", _mb,  ts_mb];
diag_log "--------------------------------------------------------------------------------------";

///// NRF MOB

// Foot patrols
private _mb = if (ts_mb == 3) then {2} else {if (ts_mb == 2) then {selectRandom [2,4]} else {4}};
private _g = [uSpawn, west, 2, false, 150, _mb, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true, "ADF_fnc_redressNRF"] call ADF_fnc_createFootPatrol;
_g setGroupIdGlobal ["5-1 ALPHA"];
private _g = [uSpawn, west, 2, false, 150, _mb, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true, "ADF_fnc_redressNRF"] call ADF_fnc_createFootPatrol;
_g setGroupIdGlobal ["5-1 BRAVO"];

// Static Defenses & Ambient Vehicles
private _g = createGroup west; 
{private _u = _g createUnit ["B_Soldier_F", getPos uSpawn, [], 0, "NONE"]; _u moveInGunner _x; _u call ADF_fnc_setTurretGunner; [_u] call ADF_fnc_redressNRF;} count [oStat_01, oStat_02];
_g setGroupIdGlobal ["5-1 CHARLIE"];

///// AO ZONES

ADF_SOD_zones = {
	// init
	params ["_t", "_m"];
	private _r	= ((triggerArea _t) select 0) / 2;
	
	_m	= "";
	private _pr	= _r / 1.2;
	private _dr	= 150;
	private _ps	= 0;
	private _pe	= 0;
	private _pev	= 0;

	switch _t do {
		case tRedZone_1 : {_ps = 10; _pe = 15; _pev = 13; _m = "mRed_1"};
		case tRedZone_2 : {_ps = 20; _pe = 25; _pev = 23; _m = "mRed_2"};
		case tRedZone_3 : {_ps = 50; _pe = 55; _pev = 53; _m = "mRed_3"};
		case tRedZone_4 : {_ps = 60; _pe = 65; _pev = 63; _m = "mRed_4"};
		case tRedZone_5 : {_ps = 70; _pe = 75; _pev = 73; _m = "mRed_5"};
	};
	
	// mission balance
	private _pc = count (allPlayers - entities "HeadlessClient_F");
	ts_mb = switch true do {
		case (_pc < 16):				{1};
		case (_pc > 15 && _pc < 24):	{2};
		case (_pc > 23);
		default 						{3};
	};
	if (!isMultiplayer || ADF_debug) then {ts_mb = 3}; // testing	
	
	// foot patrols
	for "_i" from _ps to _pe do {
		private _mb = if (ts_mb == 3) then {selectRandom [4,4,4,8]} else {if (ts_mb == 2) then {selectRandom [4,2,4]} else {selectRandom [4,2]}};
		[format ["mPaxPat_%1",_i], east, _mb, false, _pr, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true, "ADF_fnc_redressPashtun", ""] call ADF_fnc_createFootPatrol;
	};

	// Garrison groups
	for "_i" from _ps to _pe do {
		private _mb = if (ts_mb == 3) then {selectRandom [8,8,8,4]} else {if (ts_mb == 2) then {selectRandom [4,8]} else {selectRandom [4,8,4]}};
		[format ["mPaxDef_%1",_i], east, _mb, selectRandom [true, false], _dr, true, "ADF_fnc_redressPashtun"] call ADF_fnc_createGarrison;
	};

	for "_i" from _ps to (_ps + ts_mb) do {
		private _v = [format ["mVehPat_%1",_i], "", east, "O_G_Offroad_01_armed_F", 800, 4, "MOVE", "SAFE", "RED", "LIMITED", 25, "ADF_fnc_redressPashtun"] call ADF_fnc_createVehiclePatrol;
		(_v select 0) setVariable ["BIS_enableRandomization", false];
		[(_v select 0), "ADF_opforOffroad", nil] call BIS_fnc_initVehicle;
		[_v select 2] spawn ADF_fnc_waypointCombat;
	};
	
	[_t, _m] remoteExec ["ADF_SOD_zonesTracker", 2];
}; 

// Random long range Pashtun vehicle patrol
private _a = [tRedZone_1, tRedZone_2, tRedZone_3, tRedZone_4, tRedZone_5];
for "_i" from 1 to 3 do {
	private _p = selectRandom _a;
	_a = _a - [_p];
	private _v = [_p, "", east, "O_G_Offroad_01_armed_F", 3000, 6, "MOVE", "SAFE", "RED", "NORMAL", 25, "ADF_fnc_redressPashtun"] call ADF_fnc_createVehiclePatrol;
	(_v select 0) setVariable ["BIS_enableRandomization", false];
	[(_v select 0), "ADF_opforOffroad", nil] call BIS_fnc_initVehicle;
	[_v select 2] spawn ADF_fnc_waypointCombat;	
};

ADF_init_AO = true; publicVariable "ADF_init_AO";
