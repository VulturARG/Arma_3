//_QS_fnc_iconType = {
//hint "comienzo";
	params ['_u'];
	private _vt = typeOf (vehicle _u);
	private _i = missionNamespace getVariable [format ['QS_ST_iconType#%1',_vt],''];
	if (_i isEqualTo '') then {
		if ((vehicle _u) isKindOf 'CAManBase') then {
			if (_u getUnitTrait 'medic') then {
				_vt = 'B_medic_F';
			} else {
				if (_u getUnitTrait 'engineer') then {
					_vt = 'B_engineer_F';
				} else {
					if (_u getUnitTrait 'explosiveSpecialist') then {
						_vt = 'B_soldier_exp_F';
					};
				};
			};
		};
		_i = getText (configFile >> 'CfgVehicles' >> _vt >> 'icon');
		missionNamespace setVariable [format ['QS_ST_iconType#%1',_vt],_i];
	};
	_i;
	hint format["Algo => %1 // QS_ST_iconType#%2", _i,_vt];
//};
