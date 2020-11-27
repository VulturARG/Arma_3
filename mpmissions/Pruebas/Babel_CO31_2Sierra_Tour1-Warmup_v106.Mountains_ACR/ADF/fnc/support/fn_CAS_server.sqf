/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_CAS_server
Author: Whiztler
Script version: 1.02

File: fn_CAS_server.sqf
**********************************************************************************
This function is exclusively used by the Create CAS module

INSTRUCTIONS:
Spawn from script on server

REQUIRED PARAMETERS:
n/a

OPTIONAL PARAMETERS:
n/a

EXAMPLE
[] spawn ADF_fnc_CAS_server;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_CAS_server"};

// init
private _mc = "";
private _vc = "";

waitUntil {sleep 1; ADF_CAS_marker}; // wait till the CAS request action was executed

diag_log	"-----------------------------------------------------";
diag_log "ADF RPT: CAS (server) activated";
diag_log	"-----------------------------------------------------";

// Create the CAS circle marker
switch ADF_CAS_side do {
	case west		: {_mc = "ColorWEST"; _vc = "B_Heli_Attack_01_F"};
	case east		: {_mc = "ColorEAST"; _vc = "O_Heli_Attack_02_black_F"};
	case independent	: {_mc = "ColorGUER"; _vc = "I_Heli_light_03_F"};
};	

private _m = createMarker ["mCAS_SAD", ADF_CAS_pos];
_m setMarkerSize [500, 500];
_m setMarkerShape "ELLIPSE";
_m setMarkerBrush "Border";
_m setMarkerColor _mc;
_m setMarkerDir 0;

// Create the CAS AO triggerActivated
tCAS = createTrigger ["EmptyDetector", ADF_CAS_pos];
tCAS setTriggerActivation [str ADF_CAS_side, "PRESENT", true];
tCAS setTriggerArea [ADF_CAS_aoTriggerRad, ADF_CAS_aoTriggerRad, 0, false];
tCAS setTriggerStatements ["(vehicle ADF_vCAS in thisList && ((getPosATL ADF_vCAS) select 2) > 25)", "", ""];

waitUntil {sleep 1; ADF_CAS_active}; // wait till the 9-liners are finished and CAS-delay timer is 0. 

// Create CAS aircraft
private _c = createGroup ADF_CAS_side;
_c setGroupIdGlobal [format ["%1", ADF_CAS_callSign]];
private _v = [ADF_CAS_spawn, 90, _vc, _c] call ADF_fnc_createCrewedVehicle;
ADF_vCAS = _v select 0; publicVariable "ADF_vCAS";
ADF_vCAS allowDamage false;

// Add an EH to the CAS aircraft. If the aircraft is killed/shot down it will trigger a CAS KIA message and exit the script
ADF_vCAS addEventHandler ["killed", "ADF_CAS_bingoFuel = true; publicVariable 'ADF_CAS_bingoFuel';ADF_CAS_kia = true;"];

// Attach marker to CAS aircraft
[ADF_vCAS] spawn {	
	private _m = createMarker ["mCasIcon", getPosASL ADF_vCAS];
	_m setMarkerSize [.8, .8];
	_m setMarkerShape "ICON";
	_m setMarkerType "b_air";
	_m setMarkerColor "Colorwest";
	_m setMarkerText format [" %1", ADF_CAS_callSign];
	while {alive ADF_vCAS} do {"mCasIcon" setMarkerPos (getPosASL ADF_vCAS); sleep .5};
	_m setMarkerColor "ColorGrey"; // CAS aircraft is no more...
};

// Create waypoints for CAS aircraft based on appraoch vectors
private _wp = _c addWaypoint [ADF_CAS_vector, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "FULL";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointCompletionRadius 250;

private _wp = _c addWaypoint [ADF_CAS_pos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointCombatMode "RED";

waitUntil {triggerActivated tCAS}; // Let CAS aircraft reach the AO

ADF_vCAS flyInHeight (25 + (random 10));

if (ADF_CAS_kia) exitWith {call ADF_fnc_CAS_destroyVars};
sleep ADF_CAS_onSite; // Limited time in AO
if (ADF_CAS_kia) exitWith {call ADF_fnc_CAS_destroyVars};

// RTB Bingo Fuel
deleteMarker "mCAS_SAD";
{[_x] call ADF_fnc_heliPilotAI} forEach units _c;
[_c] call ADF_fnc_delWaypoint; 
ADF_CAS_bingoFuel = true; publicVariable "ADF_CAS_bingoFuel";
ADF_vCAS setFuel 0.3;	

private _wp = _c addWaypoint [ADF_CAS_vector, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "FULL";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointCompletionRadius 350;

private _wp = _c addWaypoint [ADF_CAS_spawn, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "FULL";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointCompletionRadius 350;
ADF_vCAS flyInHeight 100;
waitUntil {if (ADF_CAS_kia) exitWith {call ADF_fnc_CAS_destroyVars};(currentWaypoint (_wp select 0)) > (_wp select 1)};

// Delete CAS heli and its crew
if !(ADF_CAS_kia) then {[ADF_vCAS] call ADF_fnc_delete;};
deleteMarker "mCasIcon";

call ADF_fnc_CAS_destroyVars;
