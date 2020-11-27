/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_statsReporting
Author: Whiztler
Script version: 1.05

File: fn_statsReporting.sqf
**********************************************************************************
ABOUT
Server/HC stats reporting. Executed on the server and all connected headless
clients. Stamps the following information in the RTP:

ADF RPT: Server PERF - Total players: 37 | Total local AI's: 197
ADF RPT: Server PERF - Elapsed time: 41:33 | SVR FPS: 42 | SVR Min FPS: 38 

REQUIRED PARAMETERS:
N/A

OPTIONAL PARAMETERS:
0. Number:      Default cycle time in seconds (default: 60)
1. String:      Full name of reporting entity (e.g. "Server" or "Headless Client")
                default: "Server"   
2. String:      Abbreviation of reporting entity (e.g. "Svr" or "HC")
                default: "svr"

EXAMPLES USAGE IN SCRIPT:
[60, "Headless Client", "HC"] spawn ADF_fnc_statsReporting;

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
[] spawn ADF_fnc_statsReporting;    

RETURNS:
Nothing
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_statsReporting"};

// Exits for playable clients in multiplayer mode. Runs in single player/local mode
if (hasInterface && isMultiplayer) exitWith {};

// Init
params [
	["_s", 60, [0]],
	["_n", "Server", [""]],
	["_c", "svr", [""]]
];

waitUntil {
	// Performance params and check umber of AI and player units
	private _f	= round (diag_fps);	
	private _h	= count (entities "HeadlessClient_F");
	private _u	= {alive _x} count allPlayers;
	private _a	= ({local _x} count allUnits) - (_u + _h);
	
	// Determine reporting cycle based on FPS
	if (_a < 0)  then {_a = 0};
	if (_f < 30) then {_s = 30};
	if (_f < 20) then {_s = 20};
	if (_f < 10) then {_s = 10};
	
	private _m1 = format ["ADF RPT: %1 PERF - Total players: %2 | Total local AI's: %3", _n, _u - _h, _a];
	private _m2 = format ["ADF RPT: %1 PERF - Elapsed time: %2 | %3 FPS: %4 | %3 Min FPS: %5", _n, [(round time)] call BIS_fnc_secondsToString, _c, _f, round (diag_fpsmin)];
	
	// Stamp the RPT
	diag_log "---------------------------------------------------------------------------------------------------------------------";
	diag_log _m1;
	diag_log _m2;
	diag_log "---------------------------------------------------------------------------------------------------------------------";
	
	// Display the performance data in system chat when the debug mode is on.
	if (ADF_Debug && (_n == "Server")) then {
		_m1 remoteExec ["systemChat", -2, false];
		_m2 remoteExec ["systemChat", -2, false];
	};
	
	// Pause the cycle
	uiSleep _s;
	false
};

