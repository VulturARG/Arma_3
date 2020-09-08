openMap true;
waitUntil{visibleMap};
scopeName "main";
while {true} do{
	onMapSingleClick{
		SAT_SatelliteTarget = "Logic" createVehicleLocal _pos;//SAT_SATCOM_Logic
		SAT_SatelliteTarget setDir 0;
		call SAT_viewSatellite;
	};
	waitUntil{!visibleMap};
	onMapSingleClick{""};
	breakOut "main";
};