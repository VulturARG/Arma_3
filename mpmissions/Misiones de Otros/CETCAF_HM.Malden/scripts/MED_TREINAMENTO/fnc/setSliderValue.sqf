_sliderArray = [1900,1901,1902,1903,1904,1905];
_sTextArray = [1015,1016,1017,1018,1019,1020];
_sliderIdc = _sliderArray select sliderNr;
_sTextIdc = _sTextArray select sliderNr;
_sliderPos = sliderposition _sliderIdc;
_sliderValue = [_sliderPos,1] call BIS_fnc_cutDecimals;
_sliderValue = _sliderValue / 10;
ctrlSetText [_sTextIdc, format["%1", _sliderValue]];
