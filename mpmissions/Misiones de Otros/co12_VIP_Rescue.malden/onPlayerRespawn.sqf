[player,[missionnamespace,"VirtualInventory"]] call BIS_fnc_loadInventory;
_mssg = format ["You have %1 respawn tickets remaining.", [player,0] call BIS_fnc_respawnTickets];
hint _mssg
player addAction ["Reprogram Radios",{[] spawn TG_fnc_reprogramRadios;},player,-999,false,false,"","_this == _target",-1,true];