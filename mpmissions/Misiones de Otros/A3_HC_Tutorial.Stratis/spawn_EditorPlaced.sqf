/*
 * Purpose: Spawn units initially placed in the editor via script
 * 
 * Mission: Arma3 Headless Client Tutorial
 *  Author: Monsoon
 *   Email: rweezera@hotmail.com
 *
 */

/**
 * Converted with Arma2MapConverter v0.5.1-beta
 *
 * Source: Z:\Documents\Arma 3 - Other Profiles\Monsoon\missions\A3_HC_Tutorial.Stratis\mission.sqm
 * Date: 2/9/15 2:12 AM
 */

_westHQ = createCenter west;
_eastHQ = createCenter east;
_guerHQ = createCenter resistance;
_civHQ  = createCenter civilian;
_emptyHQ = createCenter civilian;


_createdUnits = [];
_createdMarkers = [];
_createdTriggers = [];

/*****************
 * UNIT CREATION *
 *****************/
// group _group_west_2
_group_west_2 = createGroup _westHQ;
// begin autogen_ff1d09f01d824e858f83fd148942d41b, part of group _group_west_2
if (true) then
{
	autogen_ff1d09f01d824e858f83fd148942d41b = _group_west_2 createUnit ["B_recon_TL_F", [1847.1949, 5645.2437, 0], [], 0, "CAN_COLLIDE"];

	// this is VERY dirty and only used because I don't want to create
	// arrays for vehicles, units and stuff to check if the classname
	// is a vehicle, an unit, and so on. this just works.
	// what it does is if the unit is not alive after creation (because it should be a manned vehicle)
	// it will be created with createVehicle and manned with the BIS_fnc_spawnCrew function.
	if(!alive autogen_ff1d09f01d824e858f83fd148942d41b) then {
		autogen_ff1d09f01d824e858f83fd148942d41b = createVehicle ["B_recon_TL_F", [1847.1949, 5645.2437, 0], [], 0, "CAN_COLLIDE"];
		[autogen_ff1d09f01d824e858f83fd148942d41b, _group_west_2] call BIS_fnc_spawnCrew;
	};

	autogen_ff1d09f01d824e858f83fd148942d41b setUnitAbility 0.5;
	autogen_ff1d09f01d824e858f83fd148942d41b setRank "SERGEANT";
	if(true) then { _group_west_2 selectLeader autogen_ff1d09f01d824e858f83fd148942d41b; };
	_createdUnits = _createdUnits + [autogen_ff1d09f01d824e858f83fd148942d41b];
};
// end of autogen_ff1d09f01d824e858f83fd148942d41b
// begin autogen_3fc9bfdabe1044319f9aabebf9be81a0, part of group _group_west_2
if (true) then
{
	autogen_3fc9bfdabe1044319f9aabebf9be81a0 = _group_west_2 createUnit ["B_recon_M_F", [1852.1949, 5640.2437, 0], [], 0, "CAN_COLLIDE"];

	// this is VERY dirty and only used because I don't want to create
	// arrays for vehicles, units and stuff to check if the classname
	// is a vehicle, an unit, and so on. this just works.
	// what it does is if the unit is not alive after creation (because it should be a manned vehicle)
	// it will be created with createVehicle and manned with the BIS_fnc_spawnCrew function.
	if(!alive autogen_3fc9bfdabe1044319f9aabebf9be81a0) then {
		autogen_3fc9bfdabe1044319f9aabebf9be81a0 = createVehicle ["B_recon_M_F", [1852.1949, 5640.2437, 0], [], 0, "CAN_COLLIDE"];
		[autogen_3fc9bfdabe1044319f9aabebf9be81a0, _group_west_2] call BIS_fnc_spawnCrew;
	};

	autogen_3fc9bfdabe1044319f9aabebf9be81a0 setUnitAbility 0.44999999;
	autogen_3fc9bfdabe1044319f9aabebf9be81a0 setRank "CORPORAL";
	_createdUnits = _createdUnits + [autogen_3fc9bfdabe1044319f9aabebf9be81a0];
};
// end of autogen_3fc9bfdabe1044319f9aabebf9be81a0
// begin autogen_12010867a3cb42eb8431a02b6fbd2b62, part of group _group_west_2
if (true) then
{
	autogen_12010867a3cb42eb8431a02b6fbd2b62 = _group_west_2 createUnit ["B_recon_medic_F", [1842.1949, 5640.2437, 0], [], 0, "CAN_COLLIDE"];

	// this is VERY dirty and only used because I don't want to create
	// arrays for vehicles, units and stuff to check if the classname
	// is a vehicle, an unit, and so on. this just works.
	// what it does is if the unit is not alive after creation (because it should be a manned vehicle)
	// it will be created with createVehicle and manned with the BIS_fnc_spawnCrew function.
	if(!alive autogen_12010867a3cb42eb8431a02b6fbd2b62) then {
		autogen_12010867a3cb42eb8431a02b6fbd2b62 = createVehicle ["B_recon_medic_F", [1842.1949, 5640.2437, 0], [], 0, "CAN_COLLIDE"];
		[autogen_12010867a3cb42eb8431a02b6fbd2b62, _group_west_2] call BIS_fnc_spawnCrew;
	};

	autogen_12010867a3cb42eb8431a02b6fbd2b62 setUnitAbility 0.40000001;
	autogen_12010867a3cb42eb8431a02b6fbd2b62 setRank "PRIVATE";
	_createdUnits = _createdUnits + [autogen_12010867a3cb42eb8431a02b6fbd2b62];
};
// end of autogen_12010867a3cb42eb8431a02b6fbd2b62
// begin autogen_67608d349ee84b6e941db47bbaa116e2, part of group _group_west_2
if (true) then
{
	autogen_67608d349ee84b6e941db47bbaa116e2 = _group_west_2 createUnit ["B_recon_F", [1857.1949, 5635.2437, 0], [], 0, "CAN_COLLIDE"];

	// this is VERY dirty and only used because I don't want to create
	// arrays for vehicles, units and stuff to check if the classname
	// is a vehicle, an unit, and so on. this just works.
	// what it does is if the unit is not alive after creation (because it should be a manned vehicle)
	// it will be created with createVehicle and manned with the BIS_fnc_spawnCrew function.
	if(!alive autogen_67608d349ee84b6e941db47bbaa116e2) then {
		autogen_67608d349ee84b6e941db47bbaa116e2 = createVehicle ["B_recon_F", [1857.1949, 5635.2437, 0], [], 0, "CAN_COLLIDE"];
		[autogen_67608d349ee84b6e941db47bbaa116e2, _group_west_2] call BIS_fnc_spawnCrew;
	};

	autogen_67608d349ee84b6e941db47bbaa116e2 setUnitAbility 0.40000001;
	autogen_67608d349ee84b6e941db47bbaa116e2 setRank "PRIVATE";
	_createdUnits = _createdUnits + [autogen_67608d349ee84b6e941db47bbaa116e2];
};
// end of autogen_67608d349ee84b6e941db47bbaa116e2

/**
 * Waypoints for group _group_west_2
 */
// waypoint #1
_wp = _group_west_2 addWaypoint[[1847.3927, 5699.8213, 0], 0, 1];
[_group_west_2, 1] setWaypointBehaviour "UNCHANGED";
[_group_west_2, 1] setWaypointCombatMode "NO CHANGE";
[_group_west_2, 1] setWaypointCompletionRadius 0;
[_group_west_2, 1] setWaypointFormation "NO CHANGE";
[_group_west_2, 1] setWaypointSpeed "UNCHANGED";
[_group_west_2, 1] setWaypointStatements["true", ""];
// waypoint #2
_wp = _group_west_2 addWaypoint[[1899.8821, 5699.9927, 0], 0, 2];
[_group_west_2, 2] setWaypointBehaviour "UNCHANGED";
[_group_west_2, 2] setWaypointCombatMode "NO CHANGE";
[_group_west_2, 2] setWaypointCompletionRadius 0;
[_group_west_2, 2] setWaypointFormation "NO CHANGE";
[_group_west_2, 2] setWaypointSpeed "UNCHANGED";
[_group_west_2, 2] setWaypointStatements["true", ""];
// waypoint #3
_wp = _group_west_2 addWaypoint[[1900.0531, 5600.1426, 0], 0, 3];
[_group_west_2, 3] setWaypointBehaviour "UNCHANGED";
[_group_west_2, 3] setWaypointCombatMode "NO CHANGE";
[_group_west_2, 3] setWaypointCompletionRadius 0;
[_group_west_2, 3] setWaypointFormation "NO CHANGE";
[_group_west_2, 3] setWaypointSpeed "UNCHANGED";
[_group_west_2, 3] setWaypointStatements["true", ""];
// waypoint #4
_wp = _group_west_2 addWaypoint[[1847.2217, 5599.9717, 0], 0, 4];
[_group_west_2, 4] setWaypointBehaviour "UNCHANGED";
[_group_west_2, 4] setWaypointCombatMode "NO CHANGE";
[_group_west_2, 4] setWaypointCompletionRadius 0;
[_group_west_2, 4] setWaypointFormation "NO CHANGE";
[_group_west_2, 4] setWaypointSpeed "UNCHANGED";
[_group_west_2, 4] setWaypointStatements["true", ""];
[_group_west_2, 4] setWaypointType "CYCLE";

// return all created units in an array
[_createdUnits, _createdMarkers, _createdTriggers]
