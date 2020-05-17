[player,[missionnamespace,"VirtualInventory"]] call BIS_fnc_saveInventory;
[]execVM "briefing.sqf";

waitUntil {!isNull player && isPlayer player};

[player] spawn TG_fnc_detected;
[player,2] call bis_fnc_respawnTickets;

//-------------------------------------------Group--------------------------------------------------------
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

[] spawn 	TG_fnc_squadUI;
call 		TG_fnc_earplugs;
[] spawn 	TG_fnc_drag;
[] spawn 	TG_fnc_teleportToSL;

//------------------------------------------TFR add actions-----------------------------------------------
_is_mod_tfr_enabled_locally = isClass(configFile/"CfgPatches"/"task_force_radio");
if (_is_mod_tfr_enabled_locally) then
{
	[nil, player] spawn TG_fnc_getShortRadio;//add short range for all
	//player addAction ["Reprogram SR Radio",{[] spawn TG_fnc_reprogramRadios;},player,-999,false,false,"","_this == _target",-1,true];
	boat1 addAction ["Get Short Range Radio",{[nul,player] spawn TG_fnc_getShortRadio;}];
	boat1 addAction ["Get Long Range Radio",{[nul,player] spawn TG_fnc_getLongRadio;}];	
	boat2 addAction ["Get Short Range Radio",{[nul,player] spawn TG_fnc_getShortRadio;}];
	boat2 addAction ["Get Long Range Radio",{[nul,player] spawn TG_fnc_getLongRadio;}];
	boat3 addAction ["Get Short Range Radio",{[nul,player] spawn TG_fnc_getShortRadio;}];
	boat3 addAction ["Get Long Range Radio",{[nul,player] spawn TG_fnc_getLongRadio;}];
};

player moveInAny (player getVariable "whichBoat");
sleep 10;
_mssg = format ["You have %1 respawn tickets remaining.", [player,0] call BIS_fnc_respawnTickets];
