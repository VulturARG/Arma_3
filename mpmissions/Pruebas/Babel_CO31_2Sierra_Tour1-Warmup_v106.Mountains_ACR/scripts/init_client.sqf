diag_log "ADF RPT: Init - executing scripts\init_client.sqf"; // Reporting. Do NOT edit/remove
#include "ADF_mod_messageParser.sqf"

ADF_msg_clearedAO = {
	params ["_c"];
	["2S","ACO","Area of Operations cleared. Out."] call ADF_fnc_MessageParser;
	if (_c == 5) then {
		sleep 5;
		private "_l";
		_l = ["tLayer"] call BIS_fnc_rscLayer;
		_l cutText ["", "BLACK IN", 5];
		["<t size='5' color='#FFFFFF'>V I C T O R Y</t>",0,0,3,12] spawn BIS_fnc_dynamicText;
		sleep 5;
		_l = ["tLayer"] call BIS_fnc_rscLayer; 
		_l cutText ["", "BLACK", 20];
		["<img size= '10' shadow='false' image='mission\images\intro_TwoSierra.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Two Sierra - WarmUp</t>",0,0,9,8] spawn BIS_fnc_dynamicText;		
		['END1',true,22] call BIS_fnc_endMission;	};
};

ADF_fnc_sitRep = {
	["ACO","2S","Interrogative sitrep. Over."] call ADF_fnc_MessageParser; sleep 11;
	if (ADF_endMission) exitWith {};
	private _p = getPosASL (leader (group player));
	private _k = ["ALFA", "BRAVO", "CHARLIE", "DELTA", "ECHO", "FOXTROT", "GOLF", "HOTEL", "INDIA", "JULIETT", "KILO", "LIMA", "MIKE", "NOVEMBER", "OSCAR", "PAPA", "QUEBEC", "ROMEO", "SIERRA", "TANGO", "UNIFORM", "VICTOR", "WHISKEY", "XRAY", "YANKEE", "ZULU"];
	private _m = format ["WHISKY %1. Break.<br/>Objective not completed. Break.<br/>Position grid %2 %3 %1 . %2. Over.",{alive _x} count (allPlayers - entities "HeadlessClient_F"), selectRandom _k, selectRandom _k, round (_p select 0), round (_p select 1)];
	["2S","ACO",_m] call ADF_fnc_MessageParser; sleep 14;
	if (ADF_endMission) exitWith {};
	["ACO","2S","Roger. Out"] call ADF_fnc_MessageParser;
};

waitUntil {sleep 2; ADF_missionInit}; sleep 5;

[
	["04 APR 2019","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
	["REPUBLIC OF TAKISTAN","<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"],
	["FOB LYON, FERUZ ABAD","<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"]
] spawn ADF_fnc_typeWriter;

_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Two Sierra Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: ACO</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<t color='#A1A4AD' size='17'>Two Sierra WarmUp</t><br/><br/>
<font color='#6c7169'>WarmUp for a TWO SIERRA mission<br/><br/>	
Train your (motorized) infantry skills<br/><br/>
Test TWO SIERRA mission mods<br/><br/>
Objective: Clear OpFor AO's<br/><br/>
JIP / Respawn enabled<br/><br/>
Teleport to Leader at Flagpole<br/><br/>
Vanilla loadout. Supplies in vehicles</font>
"]];

hint parseText"<img size= '5' shadow='false' image='mission\images\logo_TwoSierra.paa'/><br/><br/>
<t color='#A1A4AD' size='1.7'>Two Sierra WarmUp</t><br/><br/>
<t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro'>WarmUp for a TWO SIERRA mission</t><br/><br/>	
<t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro'>Train your (motorized) infantry skills</t><br/><br/>
<t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro'>Test mission mods</t><br/><br/>
<t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro'>Objective: Clear OpFor AO's</t><br/><br/>
<t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro'>JIP / Respawn enabled</t><br/><br/>
<t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro'>Teleport to Leader at Flagpole</t><br/><br/>
<t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro'>Vanilla loadout. Supplies in vehicles</t><br/><br/>	
";
