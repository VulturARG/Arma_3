/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params [["_objective", "gato"]];

if(!isServer) exitWith { };

private _COMBAT_MODE = "AWARE";
private _LIMIT_SPEED = 30;
private _SPEED_MODE = "FULL";

private _WAVES = [];

switch (_objective) do {
	case "gato": { 
		_WAVES = [
			[1, [e_1, e_2, e_3, e_4, e_5, e_6, b_1, b_2, b_3, b_4, b_5, b_6, v_1, v_2]], 
			[300, [e_7, e_8, e_9, e_10, e_11, b_7, b_8, b_9, b_10, b_11, v_3, r_1, r_2, r_3, r_4, h_1]],
			[300, [e_12, e_13, e_14, e_15, e_16, e_17, e_18, e_19, e_20, e_21, b_12, b_13, b_14, b_15, b_16, b_17, v_4, v_5, r_5, r_6, r_7, r_8, r_9, r_10, h_2]]
		];
		[comandante, "Múltiples objetivos acercandose hacia Gato"] remoteExec ["sideChat", 0, true];
	};
	case "perro": {
		_WAVES = [
			[1, [e_22, e_23, e_24, e_25, e_26, e_27, e_28, e_29, b_18, b_19, b_20, b_21, b_22, b_23, b_24, b_25, v_6]], 
			[300, [e_30, e_31, e_32, e_33, e_34, e_35, b_26, b_27, b_28, b_29, b_30, b_31, b_32, b_33, v_7, v_8, h_3]],
			[300, [e_36, e_37, e_38, e_39, e_40, e_41, e_42, e_43, e_44, e_45, b_34, b_35, b_36, b_37, b_38, b_39, b_40, b_41, v_9, v_10, h_4]]
		];
		[comandante, "Múltiples objetivos acercandose hacia Perro"] remoteExec ["sideChat", 0, true];
	};
	default { };
};

MANDI_SPAWN_WAVE = 
{
	params ["_unitGroups"];

	{
		private _group = _x;

		_group setBehaviour _COMBAT_MODE;
		_group setSpeedMode _SPEED_MODE;

		{
			if(!(isNull objectParent _x)) then {
				private _vehicle = vehicle _x;
				if (!simulationEnabled _vehicle || isObjectHidden _vehicle) then {
					[(vehicle _x), true] call MANDI_fnc_displayObject;
					(vehicle _x) limitSpeed _LIMIT_SPEED;
				};
			};
			[_x, true] call MANDI_fnc_displayObject;
		} forEach units _group;
		
	} forEach _unitGroups;
};

{
	_x params ["_sleepTime", "_unitGroups"];
	sleep _sleepTime;
	["CONTRA ATAQUE:", _objective, "SLEEP TIME:", _sleepTime, _unitGroups] call MIV_fnc_log;
	[_unitGroups] call MANDI_SPAWN_WAVE;
} forEach _WAVES;

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

