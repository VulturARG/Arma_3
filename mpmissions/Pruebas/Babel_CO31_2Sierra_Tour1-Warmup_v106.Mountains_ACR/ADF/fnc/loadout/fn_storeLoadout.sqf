/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_storeLoadout
Author: Whiztler
Script version: 1.03

File: fn_storeLoadout.sqf
**********************************************************************************
ABOUT
Stores the loadout during the game session. This is not a multi-session solution.

INSTRUCTIONS:
Execute (call) from client

REQUIRED PARAMETERS:
0. Object:      Player

OPTIONAL PARAMETERS:
1. String:      Options:
                - "save" Store the loadout (default)
                - "load" Load a saved loadout
        
EXAMPLES USAGE IN SCRIPT:
[player, "load"] call ADF_fnc_storeLoadout;

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
[player] call ADF_fnc_storeLoadout;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_storeLoadout"};

params [
	["_u", objNull, [objNull]],
	["_s", "save", [""]]
];

// Check valid vars
if !(_u isKindOf "CAManBase" || isPlayer _u) exitWith {[format ["ADF_fnc_storeLoadout - passed object does not seem to be a playable unit: '%1' (%2). Exiting", _u, typeOf _u], true] call ADF_fnc_log; false};
if (	(_s != "load") && (_s != "save")) then {_s = "save"; if (ADF_debug) then {[format ["ADF_fnc_storeLoadout - incorrect storage param (%1) passed for player: %2. Defaulted to 'novice'.",_s, _u]] call ADF_fnc_log;}};

// Only run on local machines

if (_s == "SAVE") exitWith {
	// Containers
	ADF_StoreLoadout_uniform = uniform _u;
	ADF_StoreLoadout_vest = vest _u;
	ADF_StoreLoadout_backpack = backpack _u;
	ADF_StoreLoadout_headgear = headgear _u;	
	ADF_StoreLoadout_goggles = goggles _u;	
	// Weapons (also binos, gps etc)
	ADF_StoreLoadout_weapons = weapons _u;	
	ADF_StoreLoadout_magazines = magazines _u;
	// Weapon attachments etc
	ADF_StoreLoadout_primaryWeaponItems = primaryWeaponItems _u;
	ADF_StoreLoadout_secondaryWeaponItems = secondaryWeaponItems _u;	
	ADF_StoreLoadout_sideWeaponItems = handgunItems _u;
	// items
	ADF_StoreLoadout_items = items _u;
	ADF_StoreLoadout_assignedItems = assignedItems _u;
	
	true
};

if (_s == "LOAD") exitWith {
	[_u, true] call ADF_fnc_stripUnit;

	// Containers
	_u addUniform ADF_StoreLoadout_uniform;
	_u addVest ADF_StoreLoadout_vest;
	_u addBackpack ADF_StoreLoadout_backpack;
	_u addHeadgear ADF_StoreLoadout_headgear;
	_u addGoggles ADF_StoreLoadout_goggles;
	// Weapons/Magazines
	{_u addMagazine _x} forEach ADF_StoreLoadout_magazines;
	{_u addWeapon _x} forEach ADF_StoreLoadout_weapons;
	// Weapon attachments etc
	{_u addPrimaryWeaponItem _x} forEach ADF_StoreLoadout_primaryWeaponItems;
	{_u addSecondaryWeaponItem _x} forEach ADF_StoreLoadout_secondaryWeaponItems;
	{_u addHandgunItem _x} forEach ADF_StoreLoadout_sideWeaponItems;
	// Items
	{_u addItem _x} forEach ADF_StoreLoadout_items;
	{_u assignItem _x} forEach ADF_StoreLoadout_assignedItems;
	
	true
};

if (!(_s == "LOAD") && !(_s == "SAVE")) exitWith {
	// Debug reporting
	if (ADF_debug || ADF_extRpt) then {diag_log "ADF Debug: ADF_fnc_storeLoadout - ERROR, incorrect parameter passed. Should be either 'LOAD' or 'SAVE'. Exiting."};
	
	false
};