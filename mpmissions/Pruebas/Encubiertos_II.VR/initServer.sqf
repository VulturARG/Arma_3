pepe addEventHandler ["Dammaged", {
	params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];
	systemChat format["_shooter %1 Damage %2", name _shooter,_damage];
}];
/*
pepe addEventHandler ["Hit", {
	params ["_unit", "_source", "_damage", "_instigator"];
	systemChat format["_instigator %1", name _instigator];
}];

pepe addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	systemChat format["_killer %1", name _killer];
}];*/