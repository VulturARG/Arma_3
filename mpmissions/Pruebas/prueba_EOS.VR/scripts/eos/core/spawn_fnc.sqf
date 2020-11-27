IF (isnil "server")then{hint "YOU MUST PLACE A GAME LOGIC NAMED SERVER!";};

eos_fnc_spawnvehicle  = compile preprocessFileLineNumbers "scripts\eos\functions\eos_SpawnVehicle.sqf";
eos_fnc_grouphandlers = compile preprocessFileLineNumbers "scripts\eos\functions\setSkill.sqf";
eos_fnc_findsafepos   = compile preprocessFileLineNumbers "scripts\eos\functions\findSafePos.sqf";
eos_fnc_spawngroup    = compile preprocessFileLineNumbers "scripts\eos\functions\infantry_fnc.sqf";
eos_fnc_setcargo      = compile preprocessFileLineNumbers "scripts\eos\functions\cargo_fnc.sqf";
eos_fnc_taskpatrol    = compile preprocessFileLineNumbers "scripts\eos\functions\shk_patrol.sqf";
SHK_pos               = compile preprocessFileLineNumbers "scripts\eos\functions\shk_pos.sqf";
shk_fnc_fillhouse     = compile preprocessFileLineNumbers "scripts\eos\Functions\SHK_buildingpos.sqf";
eos_fnc_getunitpool   = compile preprocessFileLineNumbers "scripts\eos\UnitPools.sqf";
eos_fnc_infInv        = compile preprocessFileLineNumbers "scripts\eos\functions\infantry_inventory.sqf";
FNC_newWaypoint       = compile preprocessFileLineNumbers "scripts\eos\functions\FNC_newWaypoint.sqf";

call compile preprocessFileLineNumbers "scripts\eos\AI_Skill.sqf";

EOS_Deactivate = {
	params ["_mkr"];;
	{
		_x setmarkercolor "colorblack";
		_x setmarkerAlpha 0;
	}foreach _mkr;
};

EOS_debug = {
	params ["_mkr","_n","_note","_pos"];

	_mkrID=format ["%3:%1,%2",_mkr,_n,_note];
	deletemarker _mkrID;
	_debugMkr = createMarker[_mkrID,_pos];
	_mkrID setMarkerType "Mil_dot";
	_mkrID setMarkercolor "colorBlue";
	_mkrID setMarkerText _mkrID;
_mkrID setMarkerAlpha 0.5;
};

/*
	Filename: Simple ParaDrop Script v0.96 eject.sqf
	Author: Beerkan
	Modify by Vultur

	Description:
     A Simple Paradrop Script

	Parameter(s):
	0: VEHICLE  - vehicle that will be doing the paradrop (object)
	1: ALTITUDE - (optional) the altitude where the group will open their parachute (number)

   Example:
   0 = [vehicle, altitude] execVM "eject.sqf"
*/

OpenPlayerChuteHA = {
	params ["_paraUnit","_chuteheight"];
	waitUntil {(position _paraUnit select 2) <= _chuteheight};
	_paraUnit action ["openParachute", _paraUnit];
};

paraLandSafeHA = {
	params ["_unit","_chuteheight"];
	_unit allowDamage false;
	[_unit,_chuteheight] spawn OpenPlayerchuteHA;
	//_unit allowdamage true;// Now you can take damage.
	waitUntil { isTouchingGround _unit || (position _unit select 2) < 1 };
	_unit allowdamage true;// Now you can take damage.
	sleep 1;
	//if (alive _unit){
		_inv = name _unit;
		[_unit, [missionNamespace, format["%1%2", "Inventory",_inv]]] call BIS_fnc_loadInventory;// Reload Loadout.
	//}
	_unit allowdamage true;// Now you can take damage.
};

/*******************************************************************************
                            Created by |ArgA|Vultur|Cbo¹
*******************************************************************************/
EOS_VUL_Debug = {
	params ["_strData"];
	private _data = MissionName;
	//systemChat format["%1",_strData];
	_strData = _strData apply {if (typeName _x != "STRING") then {str _x} else {_x}};
	{
		_data = _data + " " + _x;	
	} forEach _strData;
	//systemChat format["%1",_data];
	[format ["%1",_data]] call BIS_fnc_logFormat;
};
