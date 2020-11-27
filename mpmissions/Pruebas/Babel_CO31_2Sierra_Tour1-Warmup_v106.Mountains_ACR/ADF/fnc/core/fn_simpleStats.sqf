/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Function: ADF_fnc_simpleStats
Author: Whiztler
Script version: 1.02

File: fn_simpleStats.sqf
**********************************************************************************
This function displays server/headless client statistics and information. In the 
ADF sample mission the function is activated using a radio traigger [0-0-0]. But
you can call the function from anywhere, anytime. As long as it is executed by all
connected clients.

REQUIRED PARAMETERS:
N/A

OPTIONAL PARAMETERS:
N/A

EXAMPLE:
[] spawn ADF_fnc_simpleStats;

RETURNS:
Bool
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt) then {diag_log "ADF RPT: fnc - executing: ADF_fnc_simpleStats"};

// Init
ADF_simpleStats_textServer 	= "";
ADF_simpleStats_textHeadless1	= "";
ADF_simpleStats_textHeadless2	= "";
ADF_simpleStats_textHeadless3	= "";
private _s					= 0.5;
private _c					= 0;

while {(_c != 20)} do {
	_c = _c + 1;
	
	private _gen = {
		params ["_e","_n","_m"];
		private _f = 0;
		
		if (isMultiplayer) then {_f = round (diag_fps)} else {_f = "N/A";};
		
		_m = format ["
			<t color='#FFFFFF' align='left' font='PuristaMedium' size='.9'>%1:</t><br/>
			
			<t color='#A1A4AD' align='left' font='PuristaMedium' size='.9'>FPS:</t>
			<t color='#FFFFFF' align='right' font='PuristaMedium' size='.9'>%2</t><br/>
			
			<t color='#A1A4AD' align='left' font='PuristaMedium' size='.9'>Units west:</t>
			<t color='#799cff' align='right' font='PuristaBold' size='.9'>%3</t><br/>
			<t color='#A1A4AD' align='left' font='PuristaMedium' size='.9'>Units east:</t>
			<t color='#ff8989' align='right' font='PuristaBold' size='.9'>%4</t><br/>
			<t color='#A1A4AD' align='left' font='PuristaMedium' size='.9'>Units independent:</t>
			<t color='#d8ff5f' align='right' font='PuristaBold' size='.9'>%5</t><br/>
			<t color='#A1A4AD' align='left' font='PuristaMedium' size='.9'>Units Civilian:</t>
			<t color='#eebffd' align='right' font='PuristaBold' size='.9'>%6</t><br/><br/>",
			_n,													// 1
			_f, 													// 2			
			{(local _x) && (side _x == west)} count allUnits, 		// 3
			{(local _x) && (side _x == east)} count allUnits, 		// 4
			{(local _x) && (side _x == independent)} count allUnits, 	// 5
			{(local _x) && (side _x == civilian)} count allUnits 		// 6
		];

		if (_e == 0) exitWith {ADF_simpleStats_textServer	 = _m; publicVariable "ADF_simpleStats_textServer"};
		if (_e == 1) exitWith {ADF_simpleStats_textHeadless1 = _m; publicVariable "ADF_simpleStats_textHeadless1"};
		if (_e == 2) exitWith {ADF_simpleStats_textHeadless2 = _m; publicVariable "ADF_simpleStats_textHeadless2"};
		if (_e == 3) exitWith {ADF_simpleStats_textHeadless3 = _m; publicVariable "ADF_simpleStats_textHeadless3"};
		
	};	

	if (isDedicated || isServer) then {[0,"Server",ADF_simpleStats_textServer] call _gen};
	if (ADF_isHC1) then {[1,"Headless Client 1",ADF_simpleStats_textHeadless1] call _gen};
	if (ADF_isHC2) then {[2,"Headless Client 2",ADF_simpleStats_textHeadless2] call _gen};
	if (ADF_isHC3) then {[3,"Headless Client 3",ADF_simpleStats_textHeadless3] call _gen};
		
	private _m = format ["
		<t color='#FFFFFF' size='1.3' font='PuristaMedium'>SERVER STATS</t><br/><br/>		
		<t color='#A1A4AD' align='left' font='PuristaMedium' size='.9'>Game time:</t>
		<t color='#FFFFFF' align='right' font='PuristaMedium' size='.9'>%1</t><br/>
		<t color='#A1A4AD' align='left' font='PuristaMedium' size='.9'>Total Units:</t>
		<t color='#FFFFFF' align='right' font='PuristaMedium' size='.9'>%2</t><br/>
		<t color='#A1A4AD' align='left' font='PuristaMedium' size='.9'>Total Players:</t>
		<t color='#FFFFFF' align='right' font='PuristaMedium' size='.9'>%3</t><br/>	
		<t color='#A1A4AD' align='left' font='PuristaMedium' size='.9'>Total Groups:</t>
		<t color='#FFFFFF' align='right' font='PuristaMedium' size='.9'>%4</t><br/><br/>",
		[(round time)] call BIS_fnc_secondsToString, 	//1
		count allUnits,								//2
		{alive _x} count (allPlayers - (entities "HeadlessClient_F")),		//3
		count allGroups								//4		
	];
		
	if (hasInterface) then {hintSilent parseText (_m + ADF_simpleStats_textServer + ADF_simpleStats_textHeadless1 + ADF_simpleStats_textHeadless2 + ADF_simpleStats_textHeadless3)};
	
	UiSleep _s;
};

// Delete the display
hintSilent "";

// Delete the vars
{_x = nil} forEach [ADF_simpleStats_textServer, ADF_simpleStats_textHeadless1, ADF_simpleStats_textHeadless2, ADF_simpleStats_textHeadless3];

true