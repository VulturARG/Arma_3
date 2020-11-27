/*
 * Purpose: Spawn a single group and set them on patrol via script
 * 
 * Mission: Arma3 Headless Client Tutorial
 *  Author: Monsoon
 *   Email: rweezera@hotmail.com
 *
 */

_pos      = getMarkerPos "Patrol1";
_cfgGroup = configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_SniperTeam";
_group    = [_pos, WEST, _cfgGroup] call BIS_fnc_spawnGroup;

[_group, _pos, 100] call BIS_fnc_taskPatrol;