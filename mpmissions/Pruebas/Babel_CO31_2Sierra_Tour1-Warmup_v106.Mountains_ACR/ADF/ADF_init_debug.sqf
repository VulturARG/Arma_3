/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Debug tools
Author: whiztler
Script version: 1.48

File: ADF_init_debug.sqf
**********************************************************************************
INSTRUCTIONS::

Debug functions add various actions to the the player in editor preview.
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt || time < 180) then {diag_log "ADF RPT: Init - executing: ADF_init_debug.sqf"};

// Enable full Zeus functionality for non GM units
if (isServer || !hasInterface) exitWith {};
if (isNil "GM_1") then {GM_1 = objNull}; 
if (isNil "GM_2") then {GM_2 = objNull}; 
if !((player == GM_2) || (player == GM_1)) then {
	[] spawn {
		GMmod_1 addCuratorEditableObjects [vehicles, true];
		GMmod_1 addCuratorEditableObjects [(allMissionObjects "Man"), false];
		GMmod_1 addCuratorEditableObjects [(allMissionObjects "Air"), true];
		GMmod_1 addCuratorEditableObjects [(allMissionObjects "Ammo"), false];
		GMmod_1 allowCuratorLogicIgnoreAreas true;
		{GMmod_1 addCuratorEditableObjects [[_x], true];} forEach allUnits;
		GMmod_1 addCuratorEditableObjects [vehicles, true];
		sleep 30;
	};
};

// Player debug mode
player setDamage 0;
player enableStamina false;
player enableFatigue false;
player allowDamage false;
player setCaptive true;

ADF_fnc_teleport = {
	openMap true; sleep .5;
	hintSilent format ["%1, click on a location on the map to teleport...", name vehicle player];
	onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true; openMap false; hint format [""%1, you are now at: %2"", name vehicle player, getPosATL player];";
};

// Player debug actions
player addAction ["<t align='left' color='#C0C0C0'>––––––––––––––––––––––––",nil];
player addAction ["<t align='left' color='#F7D358'>Teleport</t>", {player call ADF_fnc_teleport;}];
player addAction ["<t align='left' color='#F7D358'>Set time +6 hours</t>",{skipTime 6;}];
player addAction ["<t align='left' color='#F7D358'>Set time -6 hours</t>",{skipTime -6;}];
player addAction ["<t align='left' color='#F7D358'>Captive Mode ON/OFF</t>",{if (captive player) then {player setCaptive false; hintSilent "Captive Mode OFF";} else {player setCaptive true; hintSilent "Captive Mode ON";};}];		
player addAction ["<t align='left' color='#C0C0C0'>––––––––––––––––––––––––",nil];
