/* 
 * This file contains config parameters and a function call to start the civilian script.
 * The parameters in this file may be edited by the mission developer.
 *
 * See file Engima\Civilians\Documentation.txt for documentation and a full reference of 
 * how to customize and use Engima's Civilians.
 */
 
private ["_parameters"];

// Set civilian parameters.
_parameters = [
	["UNIT_CLASSES", ["LOP_CHR_CIV_RANDOM"]],
	["UNITS_PER_BUILDING", 0.3],
	["MAX_GROUPS_COUNT", 20],
	["MIN_SPAWN_DISTANCE", 20],
	["MAX_SPAWN_DISTANCE", 500],
	["BLACKLIST_MARKERS", ["marker_0", "marker_1", "marker_2", "marker_3", "marker_5"]],
	["HIDE_BLACKLIST_MARKERS", true],
	["ON_UNIT_SPAWNED_CALLBACK", {}],
	["ON_UNIT_REMOVE_CALLBACK", { true }],
	["DEBUG", false]
];

// Start the script
_parameters spawn ENGIMA_CIVILIANS_StartCivilians;
