/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params ["_trigger"];

MANDI_TRIGGER_1 = false;
MANDI_TRIGGER_2 = false;
MANDI_TRIGGER_3 = false;
MANDI_TRIGGER_4 = false;
MANDI_TRIGGER_5 = false;
MANDI_TRIGGER_6 = false;
MANDI_TRIGGER_7 = false;

switch (_trigger) do {
	case 1: {
		if (MANDI_TRIGGER_1) exitWith { };
		MANDI_TRIGGER_1 = true;
		rhib_5 execVM "scripts\blow_group.sqf";
		little_1 execVM "scripts\blow_group.sqf";
		"marker_21" execVM "scripts\spawn_bomba.sqf";
		"marker_27" execVM "scripts\spawn_bomba.sqf";
	};
	case 2: {
		if (MANDI_TRIGGER_2) exitWith { };
		MANDI_TRIGGER_2 = true;
		rhib_4 execVM "scripts\blow_group.sqf";
		"marker_23" execVM "scripts\spawn_bomba.sqf";
		"marker_31" execVM "scripts\spawn_bomba.sqf";
		e_fijas execVM "scripts\kill_group.sqf";
	};
	case 3: {
		if (MANDI_TRIGGER_3) exitWith { };
		MANDI_TRIGGER_3 = true;
		rhib_3 execVM "scripts\blow_group.sqf";
		"marker_22" execVM "scripts\spawn_bomba.sqf";
		"marker_26" execVM "scripts\spawn_bomba.sqf";
	};
	case 4: {
		if (MANDI_TRIGGER_4) exitWith { };
		MANDI_TRIGGER_4 = true;
		little_2 execVM "scripts\blow_group.sqf";
		"marker_28" execVM "scripts\spawn_bomba.sqf";
		"marker_30" execVM "scripts\spawn_bomba.sqf";
		e_moviles execVM "scripts\kill_group.sqf";
	};
	case 5: {
		if (MANDI_TRIGGER_5) exitWith { };
		MANDI_TRIGGER_5 = true;
		rhib_1 execVM "scripts\blow_group.sqf";
		"marker_25" execVM "scripts\spawn_bomba.sqf";
		"marker_29" execVM "scripts\spawn_bomba.sqf";
	};
	case 6: {
		if (MANDI_TRIGGER_6) exitWith { };
		MANDI_TRIGGER_6 = true;
		"marker_32" execVM "scripts\spawn_bomba.sqf"; 
		"marker_33" execVM "scripts\spawn_bomba.sqf";
	};
	case 7: {
		if (MANDI_TRIGGER_7) exitWith { };
		MANDI_TRIGGER_7 = true;
		"marker_35" execVM "scripts\spawn_bomba.sqf";
		"marker_34" execVM "scripts\spawn_bomba.sqf";
		{
			_x allowDamage true;
		} forEach allPlayers;
	};
};
/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/