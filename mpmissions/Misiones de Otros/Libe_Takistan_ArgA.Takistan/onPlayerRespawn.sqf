if ( isNil "GRLIB_respawn_loadout" ) then {
	removeGoggles player;

} else {
	sleep 4;
	[ player, GRLIB_respawn_loadout ] call F_setLoadout;
};
