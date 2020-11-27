/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Create Crewed Vehicle
Author: Whiztler. Adapted from BIS_fnc_spawnVehicle
Script version: 1.04

File: fn_createCrewedVehicle.sqf
**********************************************************************************
This function creates a vehicle and vehicle crew according to the available
vehicle role and positions. If no group is passed the function will create a group
based on the side of given the vehicle class.

VehicleCrewAI will be applied to the vehicle crew so that they only abandon their
vehicles when it looses comabt capability (too much damage).

INSTRUCTIONS:
Execute from the server or headless client.

REQUIRED PARAMETERS:
0. Position:    Spawn position. Marker, object, trigger or position araay [x,y,z]
2. Number:      Spawn direction (0-360)
3. String:      Vehicle classname

OPTIONAL PARAMETERS:
4. Group:       Group. if no group exists one will be created based on the side of
                the vehicle.
5. String:      Code to execute on each unit of the crew (e.g. a function).
                Default = "". Code is CALLED. Each unit of the group is passed
                (_this select 0) to the code/fnc.
6. String:      Code to execute on the crew aa a group (e.g. a function).
                Default = "". Code is CALLED. The group is passed
                (_this select 0) to the code/fnc.  
7. Bool:        Force precise position:
                - true (default)
                - false

EXAMPLES USAGE IN SCRIPT:
[_markerName, 90, "O_MBT_02_cannon_F", _grp, "", "", true] call ADF_fnc_createCrewedVehicle;

EXAMPLES USAGE IN EDEN:
["SpawnMarker", 90, "O_MBT_02_cannon_F", myGroupName, "", "", true] call ADF_fnc_createCrewedVehicle;

DEFAULT/MINIMUM OPTIONS
["SpawnMarker", 45, "O_MBT_02_cannon_F", _grp] call ADF_fnc_createCrewedVehicle;

RETURNS:
Array:          0. new vehicle (Object).
                1. all crew (Array of Objects).
                2. vehicle's group (Group).
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_createCrewedVehicle"};

// Init
params [
	["_p", "", ["", [], objNull, grpNull]],
	["_d", 0, [0]],
	["_vs", "", [""]],
	["_g", grpNull, [grpNull]],
	["_c1", "", [""]],
	["_c2", "", [""]],			
	["_z", true, [false]]
];
private _v = objNull;

// Check valid vars
if (_c1 != "") then {if (isNil _c1) then {if (ADF_debug) then {[format ["ADF_fnc_createCrewedVehicle - incorrect code (%1) passed. Defaulted to ''.", _c1]] call ADF_fnc_log;}; _c1 = "";}};
if (_c2 != "") then {if (isNil _c2) then {if (ADF_debug) then {[format ["ADF_fnc_createCrewedVehicle - incorrect code (%1) passed. Defaulted to ''.", _c2]] call ADF_fnc_log;}; _c2 = "";}};

// Check the location position
_p = [_p] call ADF_fnc_checkPosition;

// Check if a valid group if passed. If not, create a group based on the side of the vehicle
if (_g isEqualTo grpNull) then {	
	switch (getNumber(configFile >> "CfgVehicles" >> _vs >> "side")) do {
		case 0 : {_g = createGroup east};
		case 1 : {_g = createGroup west};
		case 2 : {_g = createGroup independent};
		case 3 : {_g = createGroup civilian};
	};	
};

// Determine vehicle
private _c = getText(configFile >> "CfgVehicles" >> _vs >> "simulation");

switch (toLower _c) do {
	case "soldier":			{_v = _g createUnit [_vs,_p,[],0,"none"]};
	case "airplanex";
	case "helicopterrtd";
	case "helicopterx":		{if (count _p == 2) then {_p set [2,0]}; _p = [_p select 0, _p select 1,(_p select 2) + 50]; _v = createVehicle [_vs, _p, [], 0, "FLY"];}; //Spawn airborne
	default 					{_v = createVehicle [_vs, _p, [], 0, "none"]};
};

// Apply spawn direction and positioning.
_v setDir _d;
if (_z) then {_v setPos _p};

// Apply velocity for aircraft
if (_c == "airplanex") then {_v setVelocity [100 * (sin _d), 100 * (cos _d), 0]};

// Create the crew and assign them to the vehicle.
createVehicleCrew _v;
private _c = crew _v;
_c joinSilent _g;
_g addVehicle _v;

// Set the vehicle crew AI
[_v] call ADF_fnc_vehicleCrewAI;

// Execute custom passed code/function
if (_c1 != "") then {
	// Each unit in the crew
	{[_x] call (call compile format ["%1", _c1])} forEach units _g;
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createCrewedVehicle - call %1 for units of group: %2",_c1,_g]] call ADF_fnc_log};
};

if (_c2 != "") then {
	// Crew
	[_g] call (call compile format ["%1", _c2]);
	// Debug reporting
	if (ADF_debug) then {[format ["ADF_fnc_createCrewedVehicle - call %1 for the vessel crew: %2",_c2,_g]] call ADF_fnc_log};	
};

[_v, _c, _g]