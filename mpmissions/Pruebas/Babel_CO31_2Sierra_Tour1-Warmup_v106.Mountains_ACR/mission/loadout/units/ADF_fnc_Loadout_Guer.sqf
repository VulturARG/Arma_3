/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Loadout FIA
Author: Whiztler
Script version: 2.31

Game type: n/a
File: ADF_fnc_loadout_Guer.sqf
*********************************************************************************
NOTE: Gear loads on actual players only. Does not load on AI's!!

Instructions:

This script is called by the loadoutClient.sqf script. The client
script call for a specific role that matches the name of the playable
unit. Make sure that the names of your playable units match exactly
with the names (variables) in both the client and the gear script else
the script will not execute for that specific player causing him to have
an incorrect loadout.

Make sure to check the capacity of the backpack and vest before adding
(more) items. Do not delete lines but comment them out when you do not
want it included.
*********************************************************************************/

diag_log "ADF RPT: Init - executing ADF_fnc_LoadoutGuer.sqf"; // Reporting. Do NOT edit/remove