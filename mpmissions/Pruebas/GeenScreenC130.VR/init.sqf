// init.sqf
//////////////////////////////////////////////////////////////////
///////////      Realizado por |ArgA|Vultur|Sdo¹    //////////////
//////////////////////////////////////////////////////////////////
{_x allowDamage false;} forEach allPlayers;

//marcadores = ["M_Aerodoromo","M_Aeropuerto","M_Anthrakia","M_Base_Pyrgos","M_Chalkeia","M_Charkia","M_Dorida","M_Feres","M_Kalochori","M_Panagia","M_Paros","M_Pyrgos","M_Rodopoli","M_Selakano"];


//QS_fnc_AOminefield﻿ = compile preprocessfile "fn_AOminefield.sqf";


/*
waitUntil {time > 0};

player addAction ["Spawn BMP", {
	private _veh = createVehicle ["O_APC_Wheeled_02_rcws_F",getMarkerPos "X1",[],0,"NONE"];
	createVehicleCrew _veh;

	private _grp = group commander _veh;
	private _wpp = _grp addWaypoint [getMarkerPos "X1a", 0];
	_wpp setWaypointType "MOVE";
	_wpp setWaypointSpeed "LIMITED";
	_wpp setWaypointBehaviour "SAFE";
}];
*/
