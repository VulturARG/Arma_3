/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

MIV_GET_COLOR = {
	params ["_number"];

	_number = _number % 26;
	private _color = "Default";

	switch (_number) do {
		case 0: { _color = "ColorBlack" };
		case 1: { _color = "ColorGrey" };
		case 2: { _color = "ColorRed" };
		case 3: { _color = "ColorBrown" };
		case 4: { _color = "ColorOrange" };
		case 5: { _color = "ColorYellow" };
		case 6: { _color = "ColorKhaki" };
		case 7: { _color = "ColorGreen" };
		case 8: { _color = "ColorBlue" };
		case 9: { _color = "ColorPink" };
		case 10: { _color = "ColorWhite" };
		case 11: { _color = "ColorWEST" };
		case 12: { _color = "ColorEAST" };
		case 13: { _color = "ColorGUER" };
		case 14: { _color = "ColorCIV" };
		case 15: { _color = "ColorUNKNOWN" };
		case 16: { _color = "colorBLUFOR" };
		case 17: { _color = "colorOPFOR" };
		case 18: { _color = "colorIndependent" };
		case 19: { _color = "colorCivilian" };
		case 20: { _color = "Color1_FD_F" };
		case 21: { _color = "Color2_FD_F" };
		case 22: { _color = "Color3_FD_F" };
		case 23: { _color = "Color4_FD_F" };
		case 24: { _color = "Color5_FD_F" };
		case 25: { _color = "Default" };
	};

	_color;
};

private _markersToRemove = allMapMarkers select {getMarkerType _x == "mil_objective"};

{
	deleteMarker _x;
} forEach _markersToRemove;

private _markers = allMapMarkers select {getMarkerType _x == "mil_dot"};

private _clusters = [_markers, 500] call compile preprocessFileLineNumbers "fnc_get_clusters.sqf";

_clusters = _clusters apply { _x apply {getMarkerPos _x} };

{
	[_x] params ["_cluster"];

	private _color = _forEachIndex call MIV_GET_COLOR;
	{
		[_x] params ["_point"];
		private _markerName = format ["%1%2", _color, str _forEachIndex];
		private _marker = createMarker [_markerName, _point];
		_marker setMarkerAlpha 1;
		_marker setMarkerType "mil_objective";
		_marker setMarkerColor _color;
	} forEach _cluster;
	
} forEach _clusters;
/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/