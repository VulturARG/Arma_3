params ["_light", "_intensity", ["_floor", "GF"]];

_height = switch (_floor) do {
	case "GF": {1.8};
	case "1F": {4.8}; // you'd play around with these numbers to get the right height per floor.
?	case "2F": {7.8};
	default {1.8};
};

_light setPosATL[(getPosATL _light select 0), (getPosATL _light select 1), _height];

BIS?_lightEmitor01 = "#lightpoint" createVehicleLocal getPosATL _light;  
BIS_lightEmitor01 setLightColor [1, 1, 1];
BIS_lightEmitor01 setLightBrightness _intensity;
BIS_lightEm?itor01 setLightAmbient [1,1,1];
BIS_lightEmitor01 lightAttachObject [_light, [0, 0, 0.1]];