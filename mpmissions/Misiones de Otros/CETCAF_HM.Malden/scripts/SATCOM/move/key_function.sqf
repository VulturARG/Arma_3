private["_event","_keyCode","_return"];

_event = _this;
_keyCode = _event select 1;
_return = true;

#define FACTOR 50

switch (_keyCode) do
{
	case 1://ESC
	{
		call SAT_closeCamera;
	};
	case 220://ESC
	{
		call SAT_closeCamera;
	};
	case 219://ESC
	{
		call SAT_closeCamera;
	};
	case 2://1 normal view
	{
		[2] call SAT_adjustCamera;
	};
	case 3://2 thermograph
	{
		[3] call SAT_adjustCamera;
	};
	case 4://3 white is hot
	{
		[4] call SAT_adjustCamera;
	};
	case 5://4 black is hot
	{
		[5] call SAT_adjustCamera;
	};
	case 50://M redefine default satellite position
	{
		call SAT_redefineDefaultPos;
	};
	default
	{
		_return = false;
	};
};
// key combo handling
if (!(_return)) then
{
	private["_pressedButtonArray"];
	_pressedButtonArray = [_keyCode];
	_return = true;

	// check for key actions
	switch (true) do
	{
		//case 17://W
		case (({_x in _pressedButtonArray} count (actionKeys "MoveForward")) > 0):
		{
			SAT_SatelliteNorthMovementDelta = 2.5;
			SAT_SatelliteTarget setPos [(getPos SAT_SatelliteTarget) select 0,((getPos SAT_SatelliteTarget) select 1) + SAT_SatelliteNorthMovementDelta,(getPos SAT_SatelliteTarget) select 2];
			call SAT_updateCamera;
		};
		//case 31://S
		case (({_x in _pressedButtonArray} count (actionKeys "MoveBack")) > 0):
		{
			SAT_SatelliteSouthMovementDelta = 2.5;
			SAT_SatelliteTarget setPos [(getPos SAT_SatelliteTarget) select 0,((getPos SAT_SatelliteTarget) select 1) - SAT_SatelliteSouthMovementDelta,(getPos SAT_SatelliteTarget) select 2];
			call SAT_updateCamera;
		};
		//case 30://A
		case (({_x in _pressedButtonArray} count (actionKeys "TurnLeft")) > 0):
		{
			SAT_SatelliteWestMovementDelta = 2.5;
			SAT_SatelliteTarget setPos [((getPos SAT_SatelliteTarget) select 0) - SAT_SatelliteWestMovementDelta,(getPos SAT_SatelliteTarget) select 1,(getPos SAT_SatelliteTarget) select 2];
			call SAT_updateCamera;
		};
		//case 32://D
		case (({_x in _pressedButtonArray} count (actionKeys "TurnRight")) > 0):
		{
			SAT_SatelliteEastMovementDelta = 2.5;
			SAT_SatelliteTarget setPos [((getPos SAT_SatelliteTarget) select 0) + SAT_SatelliteEastMovementDelta,(getPos SAT_SatelliteTarget) select 1,(getPos SAT_SatelliteTarget) select 2];
			call SAT_updateCamera;
		};
		//case 78://Num +
		case ((({_x in _pressedButtonArray} count (actionKeys "ZoomIn")) > 0) || (({_x in _pressedButtonArray} count (actionKeys "MoveDown")) > 0)):
		{
			if ((SAT_SatelliteZoom + (0.02 * FACTOR)) <= 47) then
			{
				SAT_SatelliteFOV = SAT_SatelliteFOV - (0.0005 * FACTOR);
				SAT_SatelliteZoom = SAT_SatelliteZoom + (0.02 * FACTOR);
				call SAT_updateCamera;
			};
		};
		//case 74://Num -
		case ((({_x in _pressedButtonArray} count (actionKeys "ZoomOut")) > 0) || (({_x in _pressedButtonArray} count (actionKeys "MoveUp")) > 0)):
		{
			if ((SAT_SatelliteZoom - (0.02 * FACTOR)) >= 0.1) then
			{
				SAT_SatelliteFOV = SAT_SatelliteFOV + (0.0005 * FACTOR);
				SAT_SatelliteZoom = SAT_SatelliteZoom - (0.02 * FACTOR);
				call SAT_updateCamera;
			};
		};
		default
		{
			_return = false;
		};
	};
};
_return;