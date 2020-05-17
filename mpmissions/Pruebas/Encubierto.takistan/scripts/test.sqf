//hint format["%1",group player];
//unidad = allUnits select {group _x == group player};
//unidad = allUnits select {group _x == GT};
//unidad = units GT;
//enemigos = allUnits select {side _x == EAST && _x iskindof "Man"};
/*
{
	player addEventHandler ["FiredNear",{
		params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
		if (_weapon != "arga_rhsusf_weap_glock17g4_silenciador") then {
			hint "setCaptive false";
    	player setCaptive false;
			} else {
    	hint "Silencioso";
			systemChat format["unit %1 firer %2dist: %3",_unit,_firer_distance];
			hint format["unit %1 firer %2dist: %3",_unit,_firer_distance];
  	};
	}];
}forEach playableUnits;
*/
//{_x setCaptive true;} forEach units this;



player addEventHandler ["FiredMan",{
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
	if (_weapon != "arga_rhsusf_weap_glock17g4_silenciador") then {
		hint "setCaptive false";
    player setCaptive false;
	} else {
    hint "Silencioso";
		{
			_x addEventHandler ["Killed", {
				params ["_unit", "_killer", "_instigator"];
				systemChat format["unit %1 killer %2 instigator %3",_unit,_killer,_instigator];
			}];
		}forEach allUnits;
  };

}];

*/
{
	_x addEventHandler ["FiredNear", {
		params ["_unit", "_firer", "_distance"];
		//params ["_unit", "_source", "_damage", "_instigator"];
		//systemChat format["unit %1 source %2 damage %3 instigator %4",_unit,_source,_damage,_instigator];
		systemChat format["%1",_distance];
		//systemChat format["d2D %1",player distance2D _firer];
		//systemChat format["dis %1",_x distance _firer];

	}];
	//systemChat format["%1",_x];
} forEach allUnits;


///////////////////////////////////////////////////
enemigos = allUnits select {side _x == EAST && _x iskindof "Man"};
{
	deteccion = _x knowsAbout player;
	systemChat format["%1",deteccion];
} forEach enemigos;

*/
