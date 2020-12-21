/*******************************************************************************
                             Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/

params["_group"];

private _dataHC = call compile preprocessFileLineNumbers 'scripts\eos\functions\aes_getHCSmalledUnits.sqf';

if (_dataHC select 1 != -1) then {
	_group setGroupOwner (owner _playerObject);
};

/*******************************************************************************
                             Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/