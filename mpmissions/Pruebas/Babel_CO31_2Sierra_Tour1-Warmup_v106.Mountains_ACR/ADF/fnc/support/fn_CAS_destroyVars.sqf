/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_CAS_destroyVars
Author: Whiztler
Script version: 1.01

File: fn_CAS_destroyVars.sqf
**********************************************************************************
This function is exclusively used by the Create CAS module

INSTRUCTIONS:
call from script on server + players.

REQUIRED PARAMETERS:
n/a

OPTIONAL PARAMETERS:
n/a

EXAMPLE
[] call ADF_fnc_CAS_destroyVars;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_CAS_destroyVars"};

// Destroy variables:
ADF_vCAS 			= nil; 
ADF_CAS_pos 			= nil;
ADF_CAS_active 		= nil;
ADF_CAS_marker		= nil;
ADF_CAS_bingoFuel 	= nil; 
ADF_CAS_spawn			= nil;
ADF_CAS_vector		= nil;
ADF_CAS_delay			= nil;
ADF_CAS_onSite		= nil;
ADF_CAS_callSign		= nil;
ADF_CAS_station		= nil;
ADF_CAS_targetName	= nil;
ADF_CAS_targetDesc	= nil;
ADF_CAS_result		= nil;
ADF_CAS_apprVector	= nil;
ADF_HQ_callSign		= nil;
ADF_CAS_aoTriggerRad	= nil;
ADF_CAS_log			= nil;
ADF_CAS_logName		= nil;
ADF_CAS_groupName		= nil;
ADF_fnc_CAS_supportRq = nil;
ADF_fnc_CAS_Activated = nil;
if (!isServer) exitWith {};
diag_log	"-----------------------------------------------------";
diag_log "ADF RPT: CAS (server) terminated";
diag_log	"-----------------------------------------------------";

true