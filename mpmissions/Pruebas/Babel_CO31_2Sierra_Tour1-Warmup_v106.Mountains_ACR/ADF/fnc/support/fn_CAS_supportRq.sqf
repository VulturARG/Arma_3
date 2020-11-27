/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_CAS_supportRq
Author: Whiztler
Script version: 1.03

File: fn_CAS_supportRq.sqf
**********************************************************************************
This function is exclusively used by the Create CAS module

INSTRUCTIONS:
Spawn from script on server

REQUIRED PARAMETERS:
passed by addAction

OPTIONAL PARAMETERS:
n/a

EXAMPLE
[] spawn ADF_fnc_CAS_supportRq;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_CAS_supportRq"};

// Init
params ["_u", "_i"];

// Remove the action
_u removeAction _i;

// Map click process.
if (player == ADF_CAS_requester) then {openMap true; hintSilent format ["\n%1, click on a location\n on the map where you want\nClose Air Support.\n\n", name _u]};
ADF_CAS_requester onMapSingleClick {
	ADF_CAS_pos = _pos;
	publicVariableServer "ADF_CAS_pos";
	onMapSingleClick ""; true;
	openMap false; hint "";
	[] spawn ADF_fnc_CAS_Activated;
	remoteExec ["ADF_fnc_CAS_server", 2, false];
};
