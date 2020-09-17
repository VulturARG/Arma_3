/*******************************************************************************
                          	Modify by |ArgA|Vultur|Cbo¹
*******************************************************************************/

params ["_Unit"];

if (Alive _Unit) then
{
	_Unit enableAI "MOVE";
	_Unit enableAI "AUTOTARGET";
	_Unit enableAI "FSM";
	UnassignVehicle _Unit;
	[_Unit] OrderGetIn False;
	_Unit setBehaviour "Combat";
	_Unit setCombatMode "RED";
	WaitUntil {sleep 30; !Alive _Unit};
	sleep 600;
	DeleteVehicle _Unit;
};

/*******************************************************************************
                          	Modify by |ArgA|Vultur|Cbo¹
*******************************************************************************/