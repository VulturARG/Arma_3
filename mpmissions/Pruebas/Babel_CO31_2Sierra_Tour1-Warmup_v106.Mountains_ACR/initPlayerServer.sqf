/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Server init for connected clients
Author: Whiztler
Script version: 1.21

File: initPlayerServer.sqf
*********************************************************************************
DO NOT edit this file. To set-up and configure your mission, edit the files in
the  'mission\'  folder.
*********************************************************************************/

params ["_u", "_j"];

if (isMultiplayer) then {
	diag_log format ["ADF RPT: Init - executing initPlayerServer.sqf | player: %1 | JIP: %2", _u, _j];
	// Mission re-balance for JIP
	if (_j && ADF_missionBalance) then {
		private _m = playableSlotsNumber ADF_playerSide;
		private _u = {alive _x} count (allPlayers - ADF_cntHC);
		[_m, _u, false] call ADF_fnc_missionBalance;
	};
} else {
	diag_log "ADF RPT: Init - executing: initPlayerServer.sqf";
};

// Add player to curator object list
{_x addCuratorEditableObjects [[_u], true]} forEach allCurators;  

// Apply loadout Textures to JIP clients if needed
if (_j && (ADF_clanName == "Two Sierra")) then {
	[_u] spawn {
		params ["_u"];
		sleep 20; // wait till unit has geared up
		_u setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa"];
		[_u, "CLANPATCH"] call BIS_fnc_setUnitInsignia;
	};
};
if (_j && (ADF_clanName == "Wolfpack")) then {
	[_u] spawn {
		params ["_u"];
		sleep 20; // wait till unit has geared up
		_u setObjectTextureGlobal [0, "\A3\Characters_F\Common\Data\basicbody_black_co.paa"];
		[_u, "CLANPATCH"] call BIS_fnc_setUnitInsignia;
	};
};