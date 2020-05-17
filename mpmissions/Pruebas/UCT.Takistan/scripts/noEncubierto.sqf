//player addEventHandler["Fired",{hint "setCaptive false"; player setCaptive false;}];

player addEventHandler ["FiredMan",{
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
	if (_weapon != "rhsusf_weap_glock17g4") then {
		hint "setCaptive false";
    player setCaptive false;
	} else {
    hint "Silencioso";
  };
  //systemChat format["muzzle: %1 weapon: %2 muzzle: %3",_unit, _weapon,_muzzle];
  //systemChat format["mode: %1 ammo: %2 vehicle: %3",_mode,_ammo,_vehicle];
  _myNearestEnemy = player findNearestEnemy player;
  systemChat format["%1 %2",_myNearestEnemy , player distance _myNearestEnemy];
}];
