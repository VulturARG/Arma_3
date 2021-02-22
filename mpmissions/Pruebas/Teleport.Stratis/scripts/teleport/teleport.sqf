/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/

params["_startTrigger","_destinationMarker","_callObject"];

if(isNil "_callObject") exitWith {};

removeAllActions _callObject;

private _objectPosition   = getPos _callObject;
private _newPosition      = getMarkerPos _destinationMarker;

_callObject addAction [
	"<t color='#00FF00'>Transporte a " + markerText _destinationMarker + "</t>",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_arguments params ["_objectPosition", "_newPosition", "_startTrigger"];
		
		[[_startTrigger], "scripts\teleport\teleport_sound.sqf"]   remoteExec ["BIS_fnc_execVM", 0, false];
		[[_startTrigger], "scripts\teleport\teleport_message.sqf"] remoteExec ["BIS_fnc_execVM", 0, false];

		sleep 5;
		{
			_x setPos 
				[
					(_objectPosition select 0) - ((getPos _x) select 0) + (_newPosition select 0),
					(_objectPosition select 1) - ((getPos _x) select 1) + (_newPosition select 1),
					(_objectPosition select 2) - ((getPos _x) select 2) + (_newPosition select 2)
					
				];
		} forEach (playableUnits inAreaArray _startTrigger);
		//hint "activado";
		//setDate [2002, 4, 12, 23, 0];
	}, [_objectPosition, _newPosition, _startTrigger], 1.5, true, true, "", "true", 50, false, "", ""
];

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/