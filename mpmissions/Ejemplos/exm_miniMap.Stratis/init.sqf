fnc_updateMiniMap = {
	_map = _this select 0;
	_map ctrlMapAnimAdd [0, 0.05, player];
	ctrlMapAnimCommit _map;
};

waitUntil { time > 0 };

//Show MiniMap
( [ "myMiniMap" ] call BIS_fnc_rscLayer ) cutRsc [ "myMap", "PLAIN", 1, false ];
