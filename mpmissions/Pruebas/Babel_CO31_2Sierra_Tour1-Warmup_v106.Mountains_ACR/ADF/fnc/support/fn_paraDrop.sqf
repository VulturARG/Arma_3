/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Para drop script
Author: Whiztler
Script version: 1.12

File: fn_paraDrop.sqf
**********************************************************************************
ABOUT
AI para function that is executed om AI units individually. The function creates,
assigns and attaches a parachute to a unit and removes the parachute once the unit
is touching the ground. Leaders are dropped with a smoke grenade attached.

You can optionally pass the unit's backpack + backpack items to reapply them once
the unit has landed.

INSTRUCTIONS:
Execute from the server.

REQUIRED PARAMETERS:
0: Object     The AI unit

OPTIONAL PARAMETERS:
1: Bool       Unit has a backpack? True for has backpack. False for no backpack.
2: String     Class name representing the unit's backpack
3: Array      Array of stored backpack items to reapply once the unit has landed.

EXAMPLES:
[AIunitName, true, "BackpackClassname", [item1, item2, item3]] call ADF_fnc_paraDrop;

RETURNS:
Bool (success flag)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_paraDrop"};


// Init
params ["_u","_ub","_sb","_sbi"];
private _vc	= "Steerable_parachute_F";
private _vp	= getPosASL (vehicle _u);
private _g	= group _u;
private _s	= objNull;

// Order the unit to jump out of the aircraft
unassignVehicle _u;
_u action ["EJECT", vehicle _u];	

// Position the unit 2.5 meters below the aircraft to avoid collision
_u setPosASL [_vp select 0, _vp select 1, (_vp select 0) - 2.5];

// Create the parachute and move in the unit into the parachute
private _v = createVehicle [_vc, _vp, [], 0, 'FLY'];
_u assignAsDriver _v;
_u moveInDriver _v;

// Leaders get a smoke granade attached
if (_u == leader _g) then {
	_s	= createVehicle [(selectRandom ["SmokeShellRed", "SmokeShellPurple"]), getPos _v, [], 0, "FLY"];
	_s attachTo [_v, [0.8, 0, 0]];
};

sleep 3;	
_u allowDamage true;

// When to unit is close to the ground switch off damage allowance in case he hits an object close to the ground.
waitUntil {sleep 1; getPosATL _u select 2 < 5 || isNull _u};
_u allowDamage false;

// On touch down, detach the smoke from the leader, give back the backpack and set the HC transfer and cache vars
waitUntil {sleep 1; isTouchingGround _u || isNull _u};
if (_u == leader _g) then {detach _s};
if (_ub) then {_u addBackpack _sb; {_u addItemToBackpack _x} forEach _sbi};
_u allowDamage true;
_g setVariable ["ADF_noHC_transfer", false];
_g setVariable ["zbe_cacheDisabled", false];
sleep 5;
// delete the smoke nade
if (_u == leader _g && (!isNull _s)) then {deleteVehicle _s};

true