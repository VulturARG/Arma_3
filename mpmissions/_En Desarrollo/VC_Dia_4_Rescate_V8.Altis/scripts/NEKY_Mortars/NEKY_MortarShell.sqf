/*******************************************************************************
                          	Modify by |ArgA|Vultur|Cbo¹
*******************************************************************************/
params ["_Position","_Inaccuracy","_MortarType","_Sound","_SoundOn","_TravelTime","_isFlare"];
Private ["_Height","_FallSpeed"];

if (_TravelTime > 2) then {	sleep (_TravelTime - 2) };
_Pos = CreateVehicle ["Land_HelipadEmpty_F", [(_Position select 0), (_Position select 1), ((_Position select 2) + 50)], [], _Inaccuracy, "CAN_COLLIDE"];

if (_isFlare) then {
	_Height = 140; 
	_FallSpeed = -10;
	UIsleep 3.1;
	playSound3D [_Sound, _MortarType, false, [((getPosATL _Pos) select 0), ((getPosATL _Pos) select 1), ((GetPosATL _Pos) select 2) + _Height], 8, 1, 300];
} else {
	_Height = 300;
	_FallSpeed = -400;
	if ((_SoundOn) && !(_Sound == "")) then {[[[_Pos,_Sound], { (_this select 0) say3D (_This select 1)}], "bis_fnc_call", true] call BIS_fnc_MP;};
};

sleep 2;
_Temp = CreateVehicle [_MortarType, [((getPosATL _Pos) select 0), ((getPosATL _Pos) select 1), ((GetPosATL _Pos) select 2) + _Height], [], 0, "CAN_COLLIDE"];
_Temp setVelocity [0,0,_FallSpeed];
DeleteVehicle _Pos;

/*******************************************************************************
                          	Modify by |ArgA|Vultur|Cbo¹
*******************************************************************************/