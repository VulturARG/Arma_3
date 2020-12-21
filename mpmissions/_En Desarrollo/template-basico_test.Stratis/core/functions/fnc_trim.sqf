/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params ["_originalString"]; 
private _string = toArray _originalString;
private _begin = -1; 
private _end = -1; 
private _length = count _string; 

if (_length != 0) then { 
	for "_i" from 0 to _length step 1 do {
		if (_string select _i != 32 && _begin == -1) then { 
			_begin = _i; 
		}; 
	}; 
	for "_i" from _length to 0 step -1 do { 
		if (_string select _i != 32 && _end == -1) then { 
			_end = _i;
		};
	}; 
};

_begin = if (_begin == -1) then { 0 } else { _begin };
_end = if (_end == -1) then { _length } else { _end };

private _result = [];

for "_i" from _begin to _end step 1 do {
	_result pushBack (_string select _i);
};

toString _result;

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/