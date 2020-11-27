/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: TFAR communication detection
Author: Whiztler
Script version: 1.19

File: fn_commDetect.sqf
**********************************************************************************
ABOUT
This function is executed by the TFAR_fnc_addEventHandler. The function reveals
position of players that can be heard communication by enemy ai's. The level of
knowledge of a player by an enemy unit depends on distance, loudness and the 
amount of information that the enemy already has about player units.

INSTRUCTIONS:
Execute via the TFAR event handler:
["MyID", "OnSpeak", {[_this select 0] call ADF_fnc_commDetect}, player] call TFAR_fnc_addEventHandler;

REQUIRED PARAMETERS:
0. Player:      The player the TFAR EH gets loaded onto

OPTIONAL PARAMETERS:
N/A     

EXAMPLES USAGE IN SCRIPT:
N/A

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
N/A

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_commDetect"};

// Let's check if we need to execute this function. If no TFAR is active then terminate.
if !(hasInterface) exitWith {["ADF_fnc_commDetect - Wrong client. Should only run on _u clients."] call ADF_fnc_log; false}; 
if !(ADF_mod_TFAR) exitWith {["ADF_fnc_commDetect - No TFAR present. Exiting"] call ADF_fnc_log; false}; 

// Init
params [
	["_u", player, [objNull]]
];

// Vars check
if !(_u isKindOf "CAManBase" || isPlayer _u || alive _u) exitWith {[format ["ADF_fnc_commDetect - passed object does not seem to be a playable unit: '%1' (%2). Exiting", _u, typeOf _u], true] call ADF_fnc_log; false};

// Exit if the unit is isolated from traffic
if ((vehicle _u) call TFAR_fnc_isVehicleIsolated) exitWith {if (ADF_debug) then {["ADF_fnc_commDetect - Isolated client. Exiting"] call ADF_fnc_log;}};

private _a = _u nearEntities [["CAManBase", "Man"], (TF_speak_volume_meters * 1.45) - 3.5]; // minus 3.5 to compensate for whisper mode ADF 2.02
_a = _a - (playableUnits + switchableUnits + entities "HeadlessClient_F");
if (ADF_debug) then {private _m = format ["ADF_fnc_commDetect - Enemies close to %1: %2", name _u, _a]; systemChat _m; _m call ADF_fnc_log;};

{
	if !([side _x, side _u] call BIS_fnc_sideIsEnemy) exitWith {if (ADF_debug) then {["ADF_fnc_commDetect - Only friendly sides detected. Exiting"] call ADF_fnc_log;}};
	if (_x knowsAbout _u > 2.95) exitWith {if (ADF_debug) then {private _m = format ["ADF_fnc_commDetect - Enemy (%1) is already aware of player (%2). Exiting", _x, _u]; systemChat _m; _m call ADF_fnc_log;}};
	if ((alive _x) && (_x knowsAbout _u < 2.45)) then {		

		private _i = 1;
		private _e = _x;
		if (ADF_debug) then {private _m = format ["ADF_fnc_commDetect - %1 knows about %2 (%3)", _e, name _u, _e knowsAbout _u]; systemChat _m; _m call ADF_fnc_log;};

		//Check if the AI has a radio
		if ([_e] call TFAR_fnc_haveSWRadio) then {_i = _i + 1};
		
		// If the AI knows about the player and has a radio then increase knowledge
		{if ((_e knowsAbout _x > 1.5) && ([_e] call TFAR_fnc_haveSWRadio)) then {_i = _i + 1}} forEach playableUnits + switchableUnits; 		

		// Is the AI able to alert others? If so increase knowledge
		if (!isNull ((leader (group _e)) findNearestEnemy (getPos leader (group _e)))) then { 
			private _l = (leader (group _e)) findNearestEnemy (getPos leader (group _e));
			if (_l distance _e < 1500) then {_i = _i + 1};					
		};
		
		// Debug
		if (ADF_debug) then {private _m = format["'%1' is revealed to '%2' at level: %3 (%4).",name _u, _x, _x knowsAbout _u, _i]; [_m] call ADF_fnc_log; systemChat _m;};
		
		// Reveal the location of the speaker on the machine that owns the AI and instruct the AI to investigate if he knows the location of the speaker source.
		private _o = groupOwner (group _e);
		[_e, [_u, _i]] remoteExec ["reveal", _o];
		if ((_e knowsAbout _x > 2) && (canMove _e) && (isNull objectParent _e)) then {
			[group _e, getPosWorld _u, 20, "MOVE", "AWARE", "WHITE", "FULL", "DIAMOND", 5, "foot", false] remoteExec ["ADF_fnc_addWaypoint", _o];			
		};
	};
} forEach _a;

// Result: 0.690131 ms // Cycles: 1449/10000 // Code: this call ADF_fnc_commDetect

true