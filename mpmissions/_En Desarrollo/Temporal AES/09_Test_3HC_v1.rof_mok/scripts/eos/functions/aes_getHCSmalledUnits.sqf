/*******************************************************************************
                             Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/

private _hcData = [];
private _minimun = ["",-1, objNull];

if (!isNil "HC1") then {
	if (!isNull HC1) then {
		_hcData append [["HC1", { owner _x == owner HC1} count allUnits, HC1]];
	};
};

if (!isNil "HC2") then {
	if (!isNull HC2) then {
		_hcData append [["HC2", { owner _x == owner HC2} count allUnits, HC2]];
	};
};

if (!isNil "HC3") then {
	if (!isNull HC3) then {
		_hcData append [["HC3", { owner _x == owner HC3} count allUnits, HC3]];
	};
};


if (!isNil "hc1") then {
	if (!isNull hc1) then {
		_hcData append [["hc1", { owner _x == owner hc1} count allUnits, hc1]];
	};
};

if (!isNil "hc2") then {
	if (!isNull hc2) then {
		_hcData append [["hc2", { owner _x == owner hc2} count allUnits, hc2]];
	};
};

if (!isNil "hc3") then {
	if (!isNull hc3) then {
		_hcData append [["hc3", { owner _x == owner hc3} count allUnits, hc3]];
	};
};

if (!isNil "HC_1") then {
	if (!isNull HC1) then {
		_hcData append [["HC_1", { owner _x == owner HC_1} count allUnits, HC_1]];
	};
};

if (!isNil "HC_2") then {
	if (!isNull HC_2) then {
		_hcData append ["HC_2", { owner _x == owner HC_2} count allUnits, HC_2];
	};
};

if (!isNil "HC_3") then {
	if (!isNull HC_3) then {
		_hcData append [["HC_3", { owner _x == owner HC_3} count allUnits, HC_3]];
	};
};

if (!isNil "hc_1") then {
	if (!isNull hc_1) then {
		_hcData append [["hc_1", { owner _x == owner hc_1} count allUnits, hc_1]];
	};
};

if (!isNil "hc_2") then {
	if (!isNull hc_2) then {
		_hcData append [["hc_2", { owner _x == owner hc_2} count allUnits, hc_2]];
	};
};

if (!isNil "hc_3") then {
	if (!isNull hc_3) then {
		_hcData append [["hc_3", { owner _x == owner hc_3} count allUnits, hc_3]];
	};
};

["GET_HC","_hcData_0:", _hcData] call MIV_fnc_log;
["GET_HC","_minimun_0:", _minimun] call MIV_fnc_log;

{
	["GET_HC","_x:", _x] call MIV_fnc_log;
	if (_minimun select 1 < _x select 1) then {
		_minimun = _x;
	};
	
} forEach _hcData;

["GET_HC","_hcData_1:", _hcData] call MIV_fnc_log;
["GET_HC","_minimun_1:", _minimun] call MIV_fnc_log;

_minimun

/*******************************************************************************
                             Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/