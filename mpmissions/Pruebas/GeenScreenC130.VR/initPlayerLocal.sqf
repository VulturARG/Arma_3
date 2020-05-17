//nul = [] execVM "QS_icons.sqf";
//{ nul = [_x] execVm "gpsMap.sqf"; } forEach allPlayers;

nul = [] execVm "gpsMap.sqf";
//nul = [] execVm "test.sqf";

////////////////////////////////////////////////////////////////////
// Cierra el GPS cuando se apunta el arma
// https://forums.bohemia.net/forums/topic/223397-is-it-possible-hide-the-gps-when-the-player-is-aiming/?tab=comments#comment-3357386
addMissionEventHandler ["EachFrame", {
	if (visibleGPS && {cameraView == "gunner"}) then {
		player unlinkItem "ItemGPS";
	} else {
		player linkItem "ItemGPS";
	};
}];
////////////////////////////////////////////////////////////////////
