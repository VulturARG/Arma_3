if (isServer) then {
	private ["_CHgroupArray","_LVgroupArray","_PAgroupArray","_CHGroups","_AVehGroups","_LVehGroups","_PApatrols","_PAminDist","_angle"];
	private ["_LVminDist","_AVminDist","_CHminDist","_PTGroups","_PTgroupSize","_PTminDist","_PTAltSalto","_HAgroupSize","_HAminDist","_HAAltSalto"];
	private ["_PTgroupArray","_HAgroupArray"];

	_JIPmkr=(_this select 0);
	_infantry=(_this select 1);
	_PApatrols=_infantry select 0;
	_PAgroupSize=_infantry select 1;
	_PAminDist=if ( count _infantry > 2 ) then { _infantry select 2 } else { 500 };
	_LVeh=(_this select 2);
	_LVehGroups=_LVeh select 0;
	_LVgroupSize=_LVeh select 1;
	_LVminDist=if ( count _LVeh > 2 ) then { _LVeh select 2 } else { 800 };
	_AVeh=(_this select 3);
	_AVehGroups=_AVeh select 0;
	_AVminDist=if ( count _AVeh > 1 ) then { _AVeh select 1 } else { 800 };
	_SVeh=(_this select 4);
	_CHGroups=_SVeh select 0;
	_CHgroupSize=_SVeh select 1;
	_CHminDist=if ( count _SVeh > 2 ) then { _SVeh select 2 } else { 1400 };
	/////
	_PTrooper=(_this select 5);
	_PTGroups=_PTrooper select 0;
	_PTgroupSize=_PTrooper select 1;
	_PTminDist=if ( count _PTrooper > 2 ) then { _PTrooper select 2 } else { 1400 };
	_PTAltSalto=if ( count _PTrooper > 3 ) then { if(_PTrooper select 3 < 400) then {400} else{_PTrooper select 3} } else { 400 };
	_HAtrooper=(_this select 6);
	_HAGroups=_HAtrooper select 0;
	_HAgroupSize=_HAtrooper select 1;
	_HAminDist=if ( count _HAtrooper > 2 ) then { _HAtrooper select 2 } else { 200 };
	_HAAltSalto=if ( count _HAtrooper > 3 ) then { if(_HAtrooper select 3 < 600) then {600} else{_HAtrooper select 3} } else { 600 };
	/////
	_settings=(_this select 7);
	_basSettings=(_this select 8);
	_angle=(_this select 9);

	if (_PAgroupSize==0) then {_PAgroupArray=[1,1]};
	if (_PAgroupSize==1) then {_PAgroupArray=[2,4]};
	if (_PAgroupSize==2) then {_PAgroupArray=[4,8]};
	if (_PAgroupSize==3) then {_PAgroupArray=[8,12]};
	if (_PAgroupSize==4) then {_PAgroupArray=[12,16]};
	if (_PAgroupSize==5) then {_PAgroupArray=[16,20]};

	if (_LVgroupSize==0) then {_LVgroupArray=[1,1]};
	if (_LVgroupSize==1) then {_LVgroupArray=[2,4]};
	if (_LVgroupSize==2) then {_LVgroupArray=[4,8]};
	if (_LVgroupSize==3) then {_LVgroupArray=[8,12]};
	if (_LVgroupSize==4) then {_LVgroupArray=[12,16]};
	if (_LVgroupSize==5) then {_LVgroupArray=[16,20]};

	if (_CHgroupSize==0) then {_CHgroupArray=[0,0]};
	if (_CHgroupSize==1) then {_CHgroupArray=[2,4]};
	if (_CHgroupSize==2) then {_CHgroupArray=[4,8]};
	if (_CHgroupSize==3) then {_CHgroupArray=[8,12]};
	if (_CHgroupSize==4) then {_CHgroupArray=[12,16]};
	if (_CHgroupSize==5) then {_CHgroupArray=[16,20]};

	if (_PTgroupSize==0) then {_PTgroupArray=[1,1]};
	if (_PTgroupSize==1) then {_PTgroupArray=[2,4]};
	if (_PTgroupSize==2) then {_PTgroupArray=[4,8]};
	if (_PTgroupSize==3) then {_PTgroupArray=[8,12]};
	if (_PTgroupSize==4) then {_PTgroupArray=[12,16]};
	if (_PTgroupSize==5) then {_PTgroupArray=[16,20]};

	if (_HAgroupSize==0) then {_HAgroupArray=[1,1]};
	if (_HAgroupSize==1) then {_HAgroupArray=[2,4]};
	if (_HAgroupSize==2) then {_HAgroupArray=[4,8]};
	if (_HAgroupSize==3) then {_HAgroupArray=[8,12]};
	if (_HAgroupSize==4) then {_HAgroupArray=[12,16]};
	if (_HAgroupSize==5) then {_HAgroupArray=[16,20]};
	{
		_eosMarkers=server getvariable "EOSmarkers";

		if (isnil "_eosMarkers") then {_eosMarkers=[];};
			_eosMarkers set [count _eosMarkers,_x];
			server setvariable ["EOSmarkers",_eosMarkers,true];
			null = [_x,[_PApatrols,_PAgroupArray,_PAminDist],[_LVehGroups,_LVgroupArray,_LVminDist],[_AVehGroups,_AVminDist],[_CHGroups,_CHgroupArray,_CHminDist],[_PTGroups,_PTgroupArray,_PTminDist,_PTAltSalto],[_HAGroups,_HAgroupArray,_HAminDist,_HAAltSalto],_settings,_basSettings,_angle] execVM "eos\core\b_core.sqf";
	}foreach _JIPmkr;

};
