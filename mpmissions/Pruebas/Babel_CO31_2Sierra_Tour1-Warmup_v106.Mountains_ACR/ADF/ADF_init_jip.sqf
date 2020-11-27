/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Join In Progress init
Author: Whiztler
Script version: 1.02

File: ADF_init_jip.sqf
************************************************************************************
ABOUT
The script will check if the player has initialized. Once the player has
initialized the script returns true.

INSTRUCTIONS:
Include in scripts for players (do not run on server scripts).

REQUIRED PARAMETERS:
N/A

OPTIONAL PARAMETERS:
N/A  

EXAMPLES USAGE IN SCRIPT:
#include "..\ADF\ADF_init.jip.sqf"

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
N/A

RETURNS:
Nothing


********************************************************************************/

if (!isDedicated && !isServer && (player != player) || didJIP) then {
	waitUntil {!isNull player};
    waitUntil {time > 1}; 
};