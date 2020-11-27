/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Headless Client init
Author: Whiztler
Script version: 3.04

File: ADF_init_hc.sqf
************************************************************************************
INSTRUCTIONS::

To configure one or more HC's on the server please visit and read:
https://community.bistudio.com/wiki/Arma_3_Headless_Client

If you are not using the ADF template mission than name the headless lcients:
ADF_HC1, ADF_HC2, ADF_HC3

################## IN CASE OF 1 HC (ADF_HC1) ##################

In your scripts that you use to spawn objects/units, replace
if (!isserver) exitWith {};
with 
if (!ADF_HC_execute) exitWith {}; // Auto detect execute on server or HC. 

You can disable the HC load balancer in the mission params (slotting screen).

################## IN CASE OF MULTIPLE HC'S ##################

The ADF headless clients supports automatic load balancing (if enabled in mission
params). When using 2 or 3 HC's the script will distribute  newly spawned AI groups
across the available HC's every 60 seconds.

The loadbalancer is effective when at least 2 HC's are active. Note that it is
best to spawn the AI's on the server when multiple HC's are active. The
Loadbalancer kicks in after 2 minutes after mission start and will start
distributing the AI's across the HC's

With the load balancer enabled you can blacklist groups from being transferred to
the HC('s). To do this add the following to the leader of the group:
_grp = group this;
_grp setVariable ["ADF_noHC_trfr", true];

Note that waypoint information is retained when groups are transferred to a HC. 
Other information such as garrison orders, skill information, etc is not.
You need to store the information with setVariable and re-apply the instructions
after transfer to the hC. You may use the 'local' eventhandler for this.

The ADF_fnc_defendArea function (garrison) automatically reapplies garrison
directives after HC transfer.
********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt || time < 180) then {diag_log "ADF RPT: Init - executing: ADF_init_hc.sqf"};

// HC check
if (!isServer && !hasInterface) then {
	// init
	ADF_HC_connected 	= true; publicVariable "ADF_HC_connected";
	ADF_HC_execute 	= true;
	ADF_isHC 		= true;
	
	// Check which HC slot is occupied and count HC's
	if !(isNil "ADF_HC1") then {if (player == ADF_HC1) then {ADF_cntHC = ADF_cntHC + 1; publicVariable "ADF_cntHC"; ADF_isHC1 = true; diag_log "ADF RPT: HC - Headless Client connected: ADF_HC1";}};
	if !(isNil "ADF_HC2") then {if (player == ADF_HC2) then {ADF_cntHC = ADF_cntHC + 1; publicVariable "ADF_cntHC"; ADF_isHC2 = true; diag_log "ADF RPT: HC - Headless Client connected: ADF_HC2";}};
	if !(isNil "ADF_HC3") then {if (player == ADF_HC3) then {ADF_cntHC = ADF_cntHC + 1; publicVariable "ADF_cntHC"; ADF_isHC3 = true; diag_log "ADF RPT: HC - Headless Client connected: ADF_HC3";}};	
	
	// HC FPS reporting in RPT. The frequency of the reporting is based on HC performance.
	[60, "Headless Client", "HC"] spawn ADF_fnc_statsReporting;
} else {
	// Wait for HC to publicVar ADF_HC_connected (if a HC is present)
	sleep 3; 
	if (!ADF_HC_connected && isServer) then { 
		// No HC present. Disable ADF_HC_execute on all clients except the server
		ADF_HC_execute = true;
		if (ADF_debug) then {
			["HC - NO Headless Client detected, using server", false] call ADF_fnc_log
		} else {
			diag_log "ADF RPT: HC - NO Headless Client detected, using server"
		};
	} else { 
		// HC is connected. Disable ADF_HC_execute on the server so that the HC runs scripts
		if (isServer || isDedicated) then {
			ADF_HC_execute = false;
			ADF_HC_connected = true;
		};
		diag_log "ADF RPT: HC - Headless Client detected. Using HC for ADF_HC_execute"
	};
};

// Run the HC load balancer on the server or exit it the LB was disabled in the mission params
if (!ADF_HCLB) exitWith {};
if (!isServer) exitWith {};

[] spawn {
	// Reporting. Do NOT edit/remove
	diag_log "ADF RPT: Init - executing HC LoadBalancing";

	if (!ADF_HC_connected) exitWith {["ADF_init_hc.sqf - ERROR!. NO HC detected. Terminating LoadBalancing", true] call ADF_fnc_log;};
	
	waitUntil {time > 60};

	HC1_ID		= -1; // Client ID of HC
	HC2_ID		= -1; // Client ID of HC2
	HC3_ID		= -1; // Client ID of HC3
	private _cg	= 0; // initialize group count
	private _s	= 60; // Pass through sleep	

	[format ["ADF_init_hc.sqf - LoadBalancing pass through starting in %1 seconds", _s]] call ADF_fnc_log;

	while {ADF_HC_connected} do {
		// Init.
		sleep _s;
		private _dt	= diag_tickTime;
		private _lb	= false;
		private _rr	= false;
		private _ht	= true;
		private _hc	= 0;
		private _id	= 0;
		private _ng	= count allGroups;
		private _t	= 0;	
		
		///// Let's see which ADF_HC slot is populated with a HC client. If the slot is not populated the HC variable (e.g. ADF_HC2) will be ObjNull
		
		// Get ADF_HC1 Client ID else set variables to null // v1.40B01 
		if (!isNil "ADF_HC1") then {
			HC1_ID = owner ADF_HC1;
			if (HC1_ID > 2 && ADF_debug) then {[format ["ADF_init_hc.sqf - HC1 with clientID %1 detected", HC1_ID]] call ADF_fnc_log;};
		} else {	 // NO ADF_HC1 connected
			ADF_HC1 = objNull;
			HC1_ID = -1;
			if (ADF_debug) then {["ADF_init_hc.sqf - ADF_HC1 is NOT connected"] call ADF_fnc_log};
		};
	
		// Get ADF_HC2 Client ID else set variables to null // v1.40B01 
		if (!isNil "ADF_HC2") then {
			HC2_ID = owner ADF_HC2;
			if (HC2_ID > 2 && ADF_debug) then {[format ["ADF_init_hc.sqf - HC2 with clientID %1 detected", HC2_ID]] call ADF_fnc_log;};
		} else {	 // NO ADF_HC2 connected
			ADF_HC2 = objNull;
			HC2_ID = -1;
			if (ADF_debug) then {["ADF_init_hc.sqf - ADF_HC2 is NOT connected"] call ADF_fnc_log};
		};

		// Get ADF_HC3 Client ID else set variables to null // v1.40B01
		if (!isNil "ADF_HC3") then {
			HC3_ID = owner ADF_HC3;
			if (HC3_ID > 2 && ADF_debug) then {[format ["ADF_init_hc.sqf - HC3 with clientID %1 detected", HC3_ID]] call ADF_fnc_log;};			
		} else {	 // NO ADF_HC3 connected
			ADF_HC3 = objNull;
			HC3_ID = -1;
			if (ADF_debug) then {["ADF_init_hc.sqf - ADF_HC3 is NOT connected"] call ADF_fnc_log};			
		};
		
		///// Let's check if 1 or more HC's is/are still populated with a client and check for 2 or more HC's.		
		private _chk = time;
		if ((isNull ADF_HC1) && (isNull ADF_HC2) && (isNull ADF_HC3)) then {
			waitUntil {
				sleep 1; 
				!isNull ADF_HC1 || !isNull ADF_HC2 || !isNull ADF_HC3 || time > (_chk + 60)
			};
		};
		// Last chance
		if ((isNull ADF_HC1) && (isNull ADF_HC2) && (isNull ADF_HC3)) exitWith {
			ADF_HC_connected = false;
			["ADF_init_hc.sqf - ERROR!. NO HC detected. Terminating LoadBalancing", true] call ADF_fnc_log;
		};
		
		// Check for at least 2 HC's else do not load balance.
		if (	(!isNull ADF_HC1 && !isNull ADF_HC2) || (!isNull ADF_HC1 && !isNull ADF_HC3) || (!isNull ADF_HC2 && !isNull ADF_HC3)) then {_lb = true}; 
		if (_lb && ADF_debug) then {["ADF_init_hc.sqf - starting loadBalancing to multiple HC's"] call ADF_fnc_log};	
		
		// Determine first HC to start with
		if (!isNull ADF_HC1) then {_hc = 1} else {if (!isNull ADF_HC2) then {_hc = 2} else {_hc = 3}};

		///// Transfer AI groups

		if (_ng > _cg) then {
			{
				// Set transfer to false if the group is a player group
				{if (isPlayer _x) then {_ht = false}} forEach units _x; 
				// Set transfer to false if the group is blacklisted
				if (_x getVariable ["ADF_noHC_transfer", false]) then {_ht = false};				
				// Store group directives
				if (_x getVariable ["ADF_HC_garrison_ADF", false]) then {
					ADF_HCLB_storedArr = _x getVariable ["ADF_HC_garrisonArr", []];					
					if (ADF_debug) then {[format ["ADF_init_hc.sqf - HCLB: ADF_HC_garrisonArr for group: %1 -- array: %2", _x, ADF_HCLB_storedArr]] call ADF_fnc_log};	
				};

				// If load balance enabled, round robin between the multiple HC's - else pass all to a single HC
				if (_ht) then {					
					if (_lb) then {
						switch (_hc) do {
							case 1: {_rr = _x setGroupOwner HC1_ID; _id = HC1_ID; if (!isNull ADF_HC2) then {_hc = 2} else {_hc = 3}};
							case 2: {_rr = _x setGroupOwner HC2_ID; _id = HC2_ID; if (!isNull ADF_HC3) then {_hc = 3} else {_hc = 1}};
							case 3: {_rr = _x setGroupOwner HC3_ID; _id = HC3_ID; if (!isNull ADF_HC1) then {_hc = 1} else {_hc = 2}};
							default {if (ADF_debug) then {[format ["ADF_init_hc.sqf - HCLB: No Valid HC to pass to. ** _hc = %1 **", _hc]] call ADF_fnc_log}};
							
						};
					} else {
						switch (_hc) do {
							case 1: {_rr = _x setGroupOwner HC1_ID; _id = HC1_ID};
							case 2: {_rr = _x setGroupOwner HC2_ID; _id = HC2_ID};
							case 3: {_rr = _x setGroupOwner HC3_ID; _id = HC3_ID};
							default {if (ADF_debug) then {[format ["ADF_init_hc.sqf - HCLB: No Valid HC to pass to. ** _hc = %1 **", _hc]] call ADF_fnc_log}};							
						};
					};
					
					// reApply group directives
					if (_x getVariable ["ADF_HC_garrison_ADF", false]) then {
						if (ADF_debug) then {[format ["ADF_init_hc.sqf - HCLB: ADF_fnc_defendArea_HC remoteExec for group: %1 to HC with ID %2", _x, _id]] call ADF_fnc_log};
						[_x, ADF_HCLB_storedArr] remoteExec ["ADF_fnc_defendArea_HC", _id, false];
						_x setVariable ["ADF_noHC_transfer", true];
						ADF_HCLB_storedArr = nil;
					};
		
					// Add to the group to the 'transferred counter'
					if (_rr) then {_t = _t + 1};
				};
			} forEach allGroups;
			
			// Set the group count so that only new groups are processed on next run
			_cg = _ng;			
		};
	 
		///// Reporting
		if (_t > 0) then {
			private _c1 = 0;
			private _c2 = 0;
			private _c3 = 0;

			[format ["ADF DEBUG: HC - Transferred %1 AI groups to HC(s)", _t], false] call ADF_fnc_log;				

			{
				switch (owner ((units _x) select 0)) do {
					case HC1_ID: {_c1 = _c1 + 1};
					case HC2_ID: {_c2 = _c2 + 1};
					case HC3_ID: {_c3 = _c3 + 1};
				};
			} forEach (allGroups);

			if (_c1 > 0) then {[format ["ADF_init_hc.sqf - HCLB: %1 AI groups currently on HC1", _c1]] call ADF_fnc_log};
			if (_c2 > 0) then {[format ["ADF_init_hc.sqf - HCLB: %1 AI groups currently on HC2", _c2]] call ADF_fnc_log};
			if (_c3 > 0) then {[format ["ADF_init_hc.sqf - HCLB: %1 AI groups currently on HC3", _c3]] call ADF_fnc_log};
			[format ["ADF_init_hc.sqf - HCLB: Transferred total %1 AI groups across all HC('s)", (_c1 + _c2 + _c3)]] call ADF_fnc_log;
		} else {
			["ADF_init_hc.sqf - HCLB: No AI groups to transfer at the moment"] call ADF_fnc_log;		
		};

		// Debug Diag reporting
		if (ADF_debug) then {[format ["ADF Debug: HC LoadBalancing - Diag time to execute function: %1",diag_tickTime - _dt]] call ADF_fnc_log;};
	}; // while
	
	diag_log "-----------------------------------------------------------------------------";
	diag_log "ADF RPT: HC - ERROR! Headless Client(s) disconnected";
	diag_log "-----------------------------------------------------------------------------";
};