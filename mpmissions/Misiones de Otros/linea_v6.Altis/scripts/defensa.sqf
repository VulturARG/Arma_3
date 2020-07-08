/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/
if(!isServer) exitWith {
};

private _COMBAT_MODE = "AWARE";
private _LIMIT_SPEED = 30;
private _SPEED_MODE = "FULL";


/*
private _TIME_FST_WAVE = 1;
private _TIME_SND_WAVE = 60;
private _TIME_THD_WAVE = 60;
*/

// TODO PONER ESTOS TIEMPOS PARA LA COOP
private _TIME_FST_WAVE = 900;
private _TIME_SND_WAVE = 1200;
private _TIME_THD_WAVE = 1200;


private _fstGroup = [e, e_1, e_2, e_3, e_4, e_17, e_18, e_19, e_20, e_21, e_34, e_35, e_36, e_37, e_38, e_53, e_54, e_57, e_58, e_59];
private _fstVehGroup = [veh_1, veh_2, veh_3, veh_9, veh_10, veh_17, veh_18, veh_19];

private _sndGroup = [e_5, e_6, e_7, e_8, e_9, e_22, e_23, e_24, e_25, e_39, e_40, e_41, e_42, e_43, e_55, e_60];
private _sndVehGroup = [veh_4, veh_5, veh_13, veh_20];

private _thdGroup = [e_10, e_11, e_12, e_13, e_14, e_15, e_16, e_27, e_28, e_29, e_30, e_31, e_32, e_33, e_44, e_45, e_46, e_47, e_48, e_49, e_50, e_51, e_52, e_56, e_61, e_62];
private _thdVehGroup = [veh_7, veh_8, veh_14, veh_15, veh_16, veh_22, veh_23, veh_24];

private _WAVES = [[_fstGroup, _fstVehGroup, _TIME_FST_WAVE], [_sndGroup, _sndVehGroup, _TIME_SND_WAVE], [_thdGroup, _thdVehGroup, _TIME_THD_WAVE]];

MANDI_SPAWN_WAVE = 
{
	params ["_unitGroups", "_vehGroups"];

	{
		_x hideObjectGlobal false;
		_x enableSimulationGlobal true;
		_x limitSpeed _LIMIT_SPEED;
	} forEach _vehGroups;

	{
		private _group = _x;
		_group setBehaviour _COMBAT_MODE;
		_group setSpeedMode _SPEED_MODE;

		{
			_x hideObjectGlobal false;
			_x enableSimulationGlobal true;
		} forEach units _group;
		
	} forEach _unitGroups;
};

{
	_x params ["_unitGroups", "_vehGroups", "_sleepTime"];
	sleep _sleepTime;
	[_unitGroups, _vehGroups] call MANDI_SPAWN_WAVE;
} forEach _WAVES;

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/