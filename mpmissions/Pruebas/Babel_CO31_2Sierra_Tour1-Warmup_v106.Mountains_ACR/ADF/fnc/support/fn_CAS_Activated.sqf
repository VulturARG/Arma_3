/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_CAS_Activated
Author: Whiztler
Script version: 1.02

File: fn_CAS_Activated.sqf
**********************************************************************************
This function is exclusively used by the Create CAS module

INSTRUCTIONS:
Spawn from script on server + players.

REQUIRED PARAMETERS:
n/a

OPTIONAL PARAMETERS:
n/a

EXAMPLE
[] spawn ADF_fnc_CAS_Activated;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_CAS_Activated"};

// Init
private _p	= str (format ["%1 . %2", round (ADF_CAS_pos select 0), round (ADF_CAS_pos select 1)]);
private _v	= createVehicle ["Land_HelipadEmpty_F", ADF_CAS_pos, [], 0, "NONE"];
private _av	= getPosASL _v;
private _m	= round (_av select 2);
[_v] call ADF_fnc_delete;

private _at	= [ADF_CAS_spawn, ADF_CAS_pos, 275] call ADF_fnc_calcTravelTime; 
private _d	= str (floor ((ADF_CAS_delay / 60) + (_at select 1)));

// NLT
private _th	= date select 3;
private _tm	= date select 4;
if ((_tm + 10) >= 60) then {
	_th	= _th + 1;
	_tm	= (_tm + 10) - 60; 
} else {_tm = _tm + 10};

private _t = format ["%1:%2", _th, _tm];

ADF_CAS_marker = true; publicVariableServer "ADF_CAS_marker";

if (!hasInterface) exitWith {};

// 9=liner CAS proc
hintSilent parseText format ["<img size= '5' shadow='false' image='%4'/><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>%1 this is %3. Request %2. How copy?</t><br/><br/>", ADF_CAS_callSign, ADF_CAS_station, ADF_CAS_groupName, ADF_clanLogo];
if (ADF_CAS_log) then {
	private _logTime = [dayTime] call BIS_fnc_timeToString;
	private _logTimeText = "Log: " + _logTime;
	player createDiaryRecord [ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: " +ADF_CAS_groupName+ "</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>"+ ADF_CAS_callSign +" this is "+ ADF_CAS_groupName +". Request "+ ADF_CAS_station +". How copy?</font><br/><br/>"]];
};
sleep 6;

hintSilent parseText format ["<img size= '5' shadow='false' image='" +ADF_CAS_image+ "'/><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>%1: %3 this is %2. Ready to copy. Over.</t><br/><br/>", ADF_CAS_pilotName, ADF_CAS_callSign, ADF_CAS_groupName];
if (ADF_CAS_log) then {
	private _logTime = [dayTime] call BIS_fnc_timeToString;
	private _logTimeText = "Log: " + _logTime;
	player createDiaryRecord [ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: "+ ADF_CAS_callSign +"</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>	<font color='#6C7169'>"+ ADF_CAS_pilotName +": " +ADF_CAS_groupName+ " this is "+ ADF_CAS_callSign +". Ready to copy. Over.</font><br/><br/>"]];
};
sleep 9;

hintSilent parseText format ["<img size= '5' shadow='false' image='" +ADF_clanLogo+ "'/><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>%1 with %2:</t><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>PRIORIY: #1</t><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>TARGET: %3, %4</t><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>LOCATION: %5, %6 MSL</t><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>TARGET TIME: NLT %7</t><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>RESULT: %8</t><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>CONTROL: %10 command</t><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>REMARKS: Vectors %9, Friendlies close. How copy?</t><br/><br/>", ADF_CAS_callSign, ADF_CAS_station, ADF_CAS_targetName, ADF_CAS_targetDesc, _p, _m, _t, ADF_CAS_result, ADF_CAS_apprVector, ADF_CAS_groupName];
if (ADF_CAS_log) then {
	private _logTime = [dayTime] call BIS_fnc_timeToString;
	private _logTimeText = "Log: " + _logTime;
	player createDiaryRecord [ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: " +ADF_CAS_groupName+ "</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>		<font color='#6C7169'>"+ ADF_CAS_callSign +" with "+ ADF_CAS_station +":<br/><br/>PRIORIY: #1<br/><br/>TARGET: " +ADF_CAS_targetName+ ", " +ADF_CAS_targetDesc+ "<br/><br/>LOCATION: "+ _p +", "+ str _m +" MSL<br/><br/>TARGET TIME: NLT "+ _t +"<br/><br/>RESULT: " +ADF_CAS_result+ "<br/><br/>CONTROL: " +ADF_CAS_groupName+ " command<br/><br/>REMARKS: Vectors "+ ADF_CAS_apprVector +", Friendlies close. How copy?</font><br/><br/>"]];
};
sleep 30;

hintSilent parseText format ["<img size= '5' shadow='false' image='" +ADF_CAS_image+ "'/><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>%1: Read back. PRIORIY: #1, TARGET: %2, %3, LOCATION: %4, %5 MSL, NLT %6, RESULT: %7, CONTROL: %9, REMARKS: Vectors %8, Friendlies close. Over.</t><br/><br/>", ADF_CAS_pilotName, ADF_CAS_targetName, ADF_CAS_targetDesc, _p, _m, _t, ADF_CAS_result, ADF_CAS_apprVector, ADF_CAS_groupName];
if (ADF_CAS_log) then {
	private _logTime = [dayTime] call BIS_fnc_timeToString;
	private _logTimeText = "Log: " + _logTime;
	player createDiaryRecord [ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: " +ADF_CAS_callSign+ "</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>"+ ADF_CAS_pilotName +": Read back. PRIORIY: #1, TARGET: " +ADF_CAS_targetName+ ", " +ADF_CAS_targetDesc+ ", LOCATION: "+ _p +", "+ str _m +" MSL, NLT "+ _t +", RESULT: " +ADF_CAS_result+ ", CONTROL: " +ADF_CAS_groupName+ ", REMARKS: Vectors "+ ADF_CAS_apprVector +", Friendlies close. Over.</font><br/><br/>"]];
};
sleep 18;

hintSilent parseText format ["<img size= '5' shadow='false' image='" +ADF_clanLogo+ "'/><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>Read back correct. Execute %1. Cleared %1. How Copy?</t><br/><br/>", ADF_CAS_station];
if (ADF_CAS_log) then {
	private _logTime = [dayTime] call BIS_fnc_timeToString;
	private _logTimeText = "Log: " + _logTime;
	player createDiaryRecord [ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: " +ADF_CAS_groupName+ "</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>Read back correct. Execute " +ADF_CAS_station+ ". Cleared " +ADF_CAS_station+ ". How Copy?</font><br/><br/>"]];
};
sleep 8;

hintSilent parseText format ["<img size= '5' shadow='false' image='" +ADF_CAS_image+ "'/><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>%1: Go on %2. ETA %3 Mikes. Out.</t><br/><br/>", ADF_CAS_pilotName, ADF_CAS_station, _d];
if (ADF_CAS_log) then {
	private _logTime = [dayTime] call BIS_fnc_timeToString;
	private _logTimeText = "Log: " + _logTime;
	player createDiaryRecord [ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: " +ADF_CAS_callSign+ "</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>" +ADF_CAS_callSign+ ": Go on " +ADF_CAS_station+ ". ETA "+ _d +" Mikes. Out.</font><br/><br/>"]];
};

// Time from map entrance it will take CAS to reach the AO
if (ADF_debug) then {diag_log format ["ADF RPT: ADF_fnc_CAS_Activated - CAS delay sleep: %1",ADF_CAS_delay]};
sleep ADF_CAS_delay; 

// Inform the server to create the CAS vehicle
ADF_CAS_active = true; publicVariableServer "ADF_CAS_active"; 

// Wait till the CAS ao timer runs out
waitUntil {sleep 3; ADF_CAS_bingoFuel}; 

if (!alive ADF_vCAS) exitWith { // CAS is kia!
	hintSilent parseText format ["<img size= '5' shadow='false' image='" +ADF_clanLogo+ "'/><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>%1 this is %3. %2 is down. How copy?</t><br/><br/>", ADF_HQ_callSign, ADF_CAS_callSign, ADF_CAS_groupName];
	sleep 9;
	hintSilent parseText"<img size= '5' shadow='false' image='image='" +ADF_HQ_image+ "'/>'/><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>" +ADF_CAS_groupName+ " this is" +ADF_HQ_callSign+ ". Solid Copy. We'll inform AOC. Stay on mission. Out.</t><br/><br/>";
	if (ADF_CAS_log) then {
		private _logTime = [dayTime] call BIS_fnc_timeToString; private _logTimeText = "Log: " + _logTime;
		player createDiaryRecord [ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: " +ADF_HQ_callSign+ "</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>" +ADF_CAS_groupName+ " this is " +ADF_HQ_callSign+ ". Solid copy. We'll inform AOC. Stay on mission. Out.</font><br/><br/>"]];
	};		
	sleep 12;
	hintSilent parseText format ["<img size= '5' shadow='false' image='" +ADF_clanLogo+ "'/><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>%1 this is %3. Roger. Out.</t><br/><br/>", ADF_HQ_callSign, ADF_CAS_callSign, ADF_CAS_groupName];
	call ADF_fnc_CAS_destroyVars;
};	

hintSilent parseText format ["<img size= '5' shadow='false' image='" +ADF_CAS_image+ "'/><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>%2: %3 this is %1 with bingo fuel. We are RTB. Over.</t><br/><br/>", ADF_CAS_callSign, ADF_CAS_pilotName, ADF_CAS_groupName];
if (ADF_CAS_log) then {
	private _logTime = [dayTime] call BIS_fnc_timeToString; private _logTimeText = "Log: " + _logTime;
	player createDiaryRecord [ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: "+ ADF_CAS_callSign +"</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>"+ ADF_CAS_pilotName +": " +ADF_CAS_groupName+ " this is " +ADF_CAS_callSign+ " with bingo fuel. We are RTB. Over.</font><br/><br/>"]];
};
sleep 11;
hintSilent parseText format ["<img size= '5' shadow='false' image='" +ADF_clanLogo+ "'/><br/><br/><t color='#6C7169' size='1.1' font='EtelkaNarrowMediumPro' align='left'>%1 this is %3. Roger. Thanks for the assist. Out.</t><br/><br/>", ADF_CAS_callSign, ADF_CAS_groupName];
call ADF_fnc_CAS_destroyVars;

