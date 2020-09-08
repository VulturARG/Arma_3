params[
	["_volunt",objNull,[objNull]]
];
injuryArray = ["stab","bullet","falling"];
if (alive (_volunt)) then {
	private["_head_inj","_body_inj","_hand_r_inj","_hand_l_inj","_leg_r_inj","_leg_l_inj","_value_head","_value_body","_value_hand_r","_value_hand_l","_valaue_leg_r","_value_leg_l"];
	_head_injI = lbCurSel 2100;
	_body_injI = lbCurSel 2101;
	_hand_r_injI = lbCurSel 2102;
	_hand_l_injI = lbCurSel 2103;
	_leg_r_injI = lbCurSel 2104;
	_leg_l_injI = lbCurSel 2105;
	if(_head_injI == 3) then {
		_head_inj = selectrandom ["stab","bullet","falling"];
	}else{
		_head_inj = injuryArray select _head_injI;
	};
	if(_body_injI == 3) then {
		_body_inj = selectrandom ["stab","bullet","falling"];
	}else{
		_body_inj = injuryArray select _body_injI;
	};
	if(_hand_r_injI == 3) then {
		_hand_r_inj = selectrandom ["stab","bullet","falling"];
	}else{
		_hand_r_inj = injuryArray select _hand_r_injI;
	};
	if(_hand_l_injI == 3) then {
		_hand_l_inj = selectrandom ["stab","bullet","falling"];
	}else{
		_hand_l_inj = injuryArray select _hand_l_injI;
	};
	if(_leg_r_injI == 3) then {
		_leg_r_inj = selectrandom ["stab","bullet","falling"];
	}else{
		_leg_r_inj = injuryArray select _leg_r_injI;
	};
	if(_leg_l_injI == 3) then {
		_leg_l_inj = selectrandom ["stab","bullet","falling"];
	}else{
		_leg_l_inj = injuryArray select _leg_l_injI;
	};
	_value_head = sliderposition 1900;
	_value_head = [_value_head,1] call BIS_fnc_cutDecimals;
	_value_head = _value_head / 10;
	_value_body = sliderposition 1901;
	_value_body = [_value_body,1] call BIS_fnc_cutDecimals;
	_value_body = _value_body / 10;
	_value_hand_r = sliderposition 1902;
	_value_hand_r = [_value_hand_r,1] call BIS_fnc_cutDecimals;
	_value_hand_r = _value_hand_r / 10;
	_value_hand_l = sliderposition 1903;
	_value_hand_l = [_value_hand_l,1] call BIS_fnc_cutDecimals;
	_value_hand_l = _value_hand_l / 10;
	_valaue_leg_r = sliderposition 1904;
	_valaue_leg_r = [_valaue_leg_r,1] call BIS_fnc_cutDecimals;
	_valaue_leg_r = _valaue_leg_r / 10;
	_value_leg_l = sliderposition 1905;
	_value_leg_l = [_value_leg_l,1] call BIS_fnc_cutDecimals;
	_value_leg_l = _value_leg_l / 10;

	[_volunt, _value_head, "head", _head_inj] call ace_medical_fnc_addDamageToUnit;
	[_volunt, _value_body, "body", _body_inj] call ace_medical_fnc_addDamageToUnit;
	[_volunt, _value_hand_r, "hand_r", _hand_r_inj] call ace_medical_fnc_addDamageToUnit;
	[_volunt, _value_hand_l, "hand_l", _hand_l_inj] call ace_medical_fnc_addDamageToUnit;
	[_volunt, _valaue_leg_r, "leg_r", _leg_r_inj] call ace_medical_fnc_addDamageToUnit;
	[_volunt, _value_leg_l, "leg_l", _leg_l_inj] call ace_medical_fnc_addDamageToUnit;
};