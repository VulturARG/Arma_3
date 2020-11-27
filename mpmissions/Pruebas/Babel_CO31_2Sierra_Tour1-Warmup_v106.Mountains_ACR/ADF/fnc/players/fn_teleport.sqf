/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_teleport
Author: Whiztler
Script version: 1.10

File: fn_teleport.sqf
**********************************************************************************
ABOUT
This can be used to teleport players to a specific location (marker, object,
position)

INSTRUCTIONS:
Place an object (flag pole, vehicle, etc.) and copy the following into the init
field of the placed object:

this addAction ["<t align='left' color='#E4F2AA'>Teleport</t>",
{[_this select 1, AAAA, BBBB, CCCC] spawn ADF_fnc_teleport;}, 
[], 6, true, true, "", "true" , 8]; this allowDamage false;

REQUIRED PARAMETERS:
AAAA - Position:       Teleport position. Marker, object, trigger, team leader 
					or position array [x,y,z]
				
OPTIONAL PARAMETERS:
BBBB - String:         The name of the teleport location. 
					Default: "the RV location"
CCCC - Number:         Delay in seconds (0 is no delay)
					Default: 30
				
EXAMPLE TELEPORT TO TEAM LEADER
this addAction ["<t align='left' color='#E4F2AA'>Teleport</t>", 
{[_this select 1, leader player, "the RV location", 10] spawn ADF_fnc_teleport;}, 
[], 6, true, true, "", "true" , 8]; this allowDamage false;

EXAMPLE TELEPORT TO A MARKER POSITION
this addAction ["<t align='left' color='#E4F2AA'>Teleport</t>", 
{[_this select 1, "myTeleportMarker", "the RV location", 10] spawn ADF_fnc_teleport;}, 
[], 6, true, true, "", "true" , 8]; this allowDamage false;

RETURNS
Nothing
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_teleport"};

// Only players
if (!hasInterface) exitWith {diag_log "ADF Debug: ADF_fnc_teleport - ERROR! This entity cannot execute this function!"};

params [
	["_u", player, [objNull]],
	["_p", [0,0,0], [objNull, "", [], grpNull]],
	["_n", "the RV location", [""]],
	["_c", 30, [0]]
];
private _d = 0;
private _v = false;
private _g = false;
private _l = leader (group _u);
private _o = _p;
private _j = [_u, _o] call ADF_fnc_checkDistance;

switch (typeName _p) do {

	case "STRING":	{
		if (_p in allMapMarkers) then {_d = markerDir _p};
		_o = _u;
	};		
	
	case "OBJECT":	{
		_d = getDir _p; 
		if (_p isKindOf "Man") then {
			if (!isNull objectParent _l) then {_v = true};
			_g = true;
		} else {
			if (_p isKindOf "AllVehicles") then {
				if ((({_p emptyPositions _x} forEach ["Commander", "Driver", "Gunner", "Cargo"]) + 1) > 0) then {_v = true};
			};
		};
	};		
	
	case "GROUP":	{
		_d = getDirVisual _l;
		if (!isNull objectParent _l) then {_v = true};
		_g = true;
	};
	
	case "ARRAY";
	default			{_d = random 360};
};

// Check the position location	
_p = [_p] call ADF_fnc_checkPosition;

// Debug
if (ADF_debug) then {[format ["ADF_fnc_teleport - Unit: %1 | Teleport Position: %2 (%3) | Name: %4 | Delay: %5 secs | Distance: %6 meters",_u, _p, _o, _n, _c, _j]] call ADF_fnc_log};

// Exit if player is the group leader for group teleport	
if (_g && _u == _l) exitWith {hintSilent parseText format ["<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/><t color='#6C7169' align='left' size='1.1' font='EtelkaNarrowMediumPro'>%1, it seems you're the leader of your group. You cannot teleport to yourself. Command suggests you take a hike.</t><br/><br/>", name _u];};

// Exit if the teleport location is < 250 meters away	
if (_j < 250) exitWith {hintSilent parseText format ["<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/><t color='#6C7169' align='left' size='1.1' font='EtelkaNarrowMediumPro'>%1, it seems the teleport location is just %2 meters away at PAPPA VICTOR %3.%4. Command suggests you take a hike.</t><br/><br/>", name _u, _j, floor (_p select 0), floor (_p select 1)];};

// Check if the target is alive/mobile
if !(alive _o) exitWith {hintSilent parseText format ["<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/><t color='#6C7169' align='left' size='1.1' font='EtelkaNarrowMediumPro'>%1, it seems %2 is unavailable. Please organize alternative transport.</t><br/><br/>", name _u, if (_o isKindOf "Man") then {name _o} else {_o}];};

// Check vars defined
if (isNil "ADF_clanLogo") then {ADF_clanLogo = ""};
if (isNil "ADF_mod_ACE3") then {ADF_mod_ACE3 = false};

private _f = {
	titleText ["<t color='#6C7169' size='1.5'>Teleporting...</t>", "BLACK OUT", 2, true, true];
	uiSleep 2;
};

private _t = {
	params ["_u", "_p", "_l"];		
	hintSilent parseText format ["<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/><t color='#6C7169' align='left' size='1.1' font='EtelkaNarrowMediumPro'>%1, have been teleported into a %2 position of %3's vehicle.</t><br/><br/>", name _u, _p, name _l];
	titleText ["", "BLACK IN", 2];
	if (ADF_mod_ACE3) then {[_u, currentWeapon _u, currentMuzzle _u] call ACE_SafeMode_fnc_lockSafety;};
	uiSleep 8; hintSilent "";	
};

if (_v) exitWith {	
	scopeName "ADF_TeleportVeh";
	if (((vehicle _l) emptyPositions "commander") > 0) then {
		[] call _f;
		sleep 1;
		_u assignAsCommander (vehicle _l);
		_u moveInCommander (vehicle _l);			
		[_u, "commander", _l] call _t;
		breakOut "ADF_TeleportVeh";
	};
	if (((vehicle _l) emptyPositions "gunner") > 0) then {
		[] call _f;
		sleep 1;
		_u assignAsGunner (vehicle _l);
		_u moveInGunner (vehicle _l);
		[_u, "gunner", _l] call _t;
		breakOut "ADF_TeleportVeh";
	};
	if (((vehicle _l) emptyPositions "driver") > 0) then {
		[] call _f;
		sleep 1;
		_u assignAsDriver (vehicle _l);
		_u moveInDriver (vehicle _l);
		[_u, "driver", _l] call _t;
		breakOut "ADF_TeleportVeh";
	};
	if (((vehicle _l) emptyPositions "cargo") > 0) then {
		[] call _f;
		sleep 1;
		_u assignAsCargo (vehicle _l);
		_u moveInCargo (vehicle _l);
		[_u, "cargo", _l] call _t;
		breakOut "ADF_TeleportVeh";
	};
	// No space in vehicle
	hintSilent parseText format ["<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/><t color='#6C7169' align='left' size='1.1' font='EtelkaNarrowMediumPro'>%1, your unit Leader, %2, is in a vehicle.</t><br/><br/><t color='#6C7169' align='left' size='1.1' font='EtelkaNarrowMediumPro'>The vehicle does not have an empty seat at the moment. Please try again later.</t><br/><br/>", name _u, name _l];
};

waitUntil {
	_c = _c - 1;
	hintSilent parseText format ["<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/><t color='#9DA698' align='left' size='1.1' font='EtelkaNarrowMediumPro'>%1</t><t color='#6C7169' align='left' size='1.1' font='EtelkaNarrowMediumPro'>, You'll be teleported to %2 in <t color='#9DA698' align='left' size='1.1' font='EtelkaNarrowMediumPro'>%3</t> <t color='#6C7169' align='left' size='1.1' font='EtelkaNarrowMediumPro'>seconds.</t><br/><br/>",name _u, _n, _c];
	sleep 1;		
	(!alive _u || _c == 1);
};

[] call _f;
sleep 1;
_u setPosATL _p;
hintSilent parseText format ["<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/><t color='#9DA698' align='left' size='1.1' font='EtelkaNarrowMediumPro'>%1</t><t color='#6C7169' align='left' size='1.1' font='EtelkaNarrowMediumPro'>, you have been teleported to <t color='#9DA698' align='left' size='1.1' font='EtelkaNarrowMediumPro'>%2</t><t color='#6C7169' align='left' size='1.1' font='EtelkaNarrowMediumPro'>. Please wait for the rest of your team to arrive.</t><br/><br/>",name _u, _n];
titleText ["", "BLACK IN", 2];
if (ADF_mod_ACE3) then {[_u, currentWeapon _u, currentMuzzle _u] call ACE_SafeMode_fnc_lockSafety;};
uiSleep 8; hintSilent "";	