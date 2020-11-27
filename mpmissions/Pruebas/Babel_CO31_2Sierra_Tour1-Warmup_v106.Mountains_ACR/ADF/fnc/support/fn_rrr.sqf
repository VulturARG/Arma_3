/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: Reload/Rearm/Repair
Author: Xeno (Adapted for ADF by Whiztler)
Script version: 2.85

File: fn_rrr.sqf
***********************************************************************************
ABOUT
Basic functionality to create a FARP. The script determines the type of vehicle and
(re-)supplies accordingly.

INSTRUCTIONS:
Create a trigger, make it the size of the service area. Trigger configuration:

Name:           Any name you want
Activation by:  side of the players or whichever side you want to activate the
                Reload/Rearm/Repair function.
Repeatable:     Yes

For Helicopters:
Condition:      ("Helicopter" countType thisList  > 0) && ((getPos (thisList select 0)) select 2 < .5)
On activation:  0 = [(thisList select 0)] spawn ADF_fnc_rrr;

For Airplanes:
Condition:      (("Plane" countType thisList  > 0) || ("airplane" countType thisList  > 0) || ("airplanex" countType thisList  > 0)) && ((getPos (thisList select 0)) select 2 < 1) && (speed (thisList select 0) < 10)
On activation:  0 = [(thisList select 0)] spawn ADF_fnc_rrr;

For Vehicles:
Condition:      (("CAR" countType thisList  > 0) || ("TRUCK" countType thisList  > 0) || ("TANK" countType thisList  > 0) || ("APC" countType thisList  > 0)) &&  ((getPos (thisList select 0)) select 2 < 2);
On activation:  0 = [(thisList select 0)] spawn ADF_fnc_rrr;

EXAMPLES USAGE IN SCRIPT:
N/A

EXAMPLES USAGE IN EDEN:
N/A

DEFAULT/MINIMUM OPTIONS
N/A

RETURNS:
Nothing (besides a full tank of gas)
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_rrr"};

// Init
params [
	["_v", objNull, [objNull]]
];
private _vt	= typeOf _v;
private _vn	= getText(configFile >> "CfgVehicles" >> _vt >> "displayName");
private _vf	= fuel _v;
private _tm	= round ((ADF_FARP_repairTime + ADF_FARP_reloadTime + ADF_FARP_refuelTime + 30) / 60); // maximum time in MIN
private _ts	= time;
private _vd	= damage _v;
private _vc	= "";
private _u	= "";

if (_v isKindOf "ParachuteBase") exitWith {[format ["ADF_fnc_rrr - Incorrect vehicle passed: '%1' (%2). Exiting", _v, typeOf _v], true] call ADF_fnc_log;};
if (!alive _v) exitWith {[format ["ADF_fnc_rrr - Vehicle '%1' (%2) is beyond repair. Exiting", _v, typeOf _v], true] call ADF_fnc_log;};

if ((_v isKindOf "Plane") || (_v isKindOf "Helicopter")) then {
	_u	= "Pilot";
	_vc	= "aircraft";
} else {
	_u	= "Driver";
	_vc	= "vehicle";
};

private _sr = ADF_FARP_repairTime / 25;
private _sa = ADF_FARP_reloadTime / 3;
private _sf = ADF_FARP_refuelTime / 60;

_v vehicleChat format ["%1 Forward Arming and Refueling Point", ADF_clanName];
sleep 2;
_v vehicleChat format ["Servicing %1", _vn];
sleep 2;
_v vehicleChat format ["%1, please switch off your engine and remain in the %2", _u, _vc];
sleep 2;
_v vehicleChat format ["Service can take up to %1 minutes.", _tm];

sleep 5;

// REARM
private _vm = getArray (configFile >> "CfgVehicles" >> _vt >> "magazines");

if (count _vm > 0) then {
	_a = [];
	{
		if (!(_x in _a)) then {
			_v removeMagazines _x;
			_a = _a + [_x];
		};
	} forEach _vm;
	
	{
		_v vehicleChat format ["Reloading %1", _x];
		sleep _sa;
		if (!alive _v) exitWith {};
		_v addMagazine _x;
	} forEach _vm;
};

private _wt = count (configFile >> "CfgVehicles" >> _vt >> "Turrets");

if (_wt > 0) then {
	for "_i" from 0 to (_wt - 1) do {
		scopeName "ADF_Reload";
		private _wc = (configFile >> "CfgVehicles" >> _vt >> "Turrets") select _i;
		_vm = getArray(_wc >> "magazines");
		_a = [];
		{
			if (!(_x in _a)) then {
				_v removeMagazines _x;
				_a = _a + [_x];
			};
		} forEach _vm;
		{
			_v vehicleChat format ["Reloading %1", _x];
			sleep _sa;
			if (!alive _v) then {breakOut "ADF_Reload"};
			_v addMagazine _x;
			sleep _sa;
			if (!alive _v) then {breakOut "ADF_Reload"};
		} forEach _vm;
		// check if the main turret has other turrets
		_wt_other = count (_wc >> "Turrets");

		if (_wt_other > 0) then {
			for "_i" from 0 to (_wt_other - 1) do {
				_wc2 = (_wc >> "Turrets") select _i;
				_vm = getArray(_wc2 >> "magazines");
				_a = [];
				{
					if (!(_x in _a)) then {
						_v removeMagazines _x;
						_a = _a + [_x];
					};
				} forEach _vm;
				{
					_v vehicleChat format ["Reloading %1", _x]; 
					sleep _sa;
					if (!alive _v) then {breakOut "ADF_Reload"};
					_v addMagazine _x;
					sleep _sa;
					if (!alive _v) then {breakOut "ADF_Reload"};
				} forEach _vm;
			};
		};
	};
};
if (!alive _v) exitWith {};
_v setVehicleAmmo 1; // Reload all turrets
sleep 2;
_v vehicleChat format ["%1 is fully rearmed", _vn];
sleep 2;

// REPAIR
if (!alive _v) exitWith {};
if (_vd > 0) then {
	while {_vd > 0 && alive _v} do {
		_v vehicleChat format ["Repairing %1", _vn];
		sleep _sr;
		_v setDamage (_vd - 0.05);
		_vd = damage _v;		
	};
	sleep 2;
	_v vehicleChat "Repairs completed";
	sleep 2;	
} else {
	_v vehicleChat "No repair services required.";
	if (!alive _v) exitWith {};
	sleep 2;
};

// REFUEL
if (!alive _v) exitWith {};
if (_vf < 1) then {
	_v vehicleChat format ["Refueling %1", _vn];
	while {_vf < 1 && alive _v} do {		
		_v setFuel (_vf + 0.01);
		_vf = fuel _v;
		sleep _sf;
	};
	sleep 2;
	_v vehicleChat format ["%1 is fully refueled", _vn];
	sleep 2;
} else {
	_v vehicleChat "No refuel services needed.";
	if (!alive _v) exitWith {};
	sleep 2;
};
if (!alive _v) exitWith {};

// SERVICE FINISHED
private _t = round ((time - _ts) / 60);
private _tt = "minutes";
private _td = "day";
private _tdt = date select 3;
if (_tdt < 12) then {_td = "morning"};
if (_tdt > 18) then {_td = "evening"};
if ((time - _ts) < 90) then {_t = 1;_tt = "minute"};
_v vehicleChat format ["%1 was serviced in %2 %3. Enjoy your %4", _vn, _t, _tt, _td];