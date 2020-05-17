if (!isServer) exitWith {};
// SINGLE INFANTRY GROUP
private ["_grp","_unit","_pool","_pos","_faction"];

_pos=(_this select 0);
_grpSize=(_this select 1);
_faction=(_this select 2);
_side=(_this select 3);

_grpMin=_grpSize select 0;
_grpMax=_grpSize select 1;
_d=_grpMax-_grpMin;
_r=floor(random _d);
_grpSize=_r+_grpMin;

	if (surfaceiswater _pos) then {_pool=[_faction,1] call eos_fnc_getunitpool;}else{_pool=[_faction,0] call eos_fnc_getunitpool;};

	_grp=createGroup _side;

for "_x" from 1 to _grpSize do {
		_unitType=_pool select (floor(random(count _pool)));
		_unit = _grp createUnit [_unitType, _pos, [], 6, "FORM"];
				////////////////
		switch (_unitType) do {
	  	case "LOP_IRA_Infantry_SL": {
				comment "Lider";
				comment "Remove existing items";
				removeAllWeapons _unit;
				removeAllItems _unit;
				removeAllAssignedItems _unit;
				removeUniform _unit;
				removeVest _unit;
				removeBackpack _unit;
				removeHeadgear _unit;
				removeGoggles _unit;

				comment "Add containers";
				_unit forceAddUniform "LOP_U_CHR_Citizen_07";
				_unit addItemToUniform "ACE_epinephrine";
				_unit addItemToUniform "ACE_morphine";
				_unit addItemToUniform "ACE_EarPlugs";
				for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_elasticBandage";};
				for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_packingBandage";};
				_unit addVest "V_BandollierB_cbr";
				for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
				_unit addHeadgear "LOP_H_Villager_cap";

				comment "Add weapons";
				_unit addWeapon "rhs_weap_ak74";
				_unit addPrimaryWeaponItem "rhs_acc_dtk1983";
				};
			case "LOP_IRA_Infantry_Rifleman": {
				comment "Fusilero";
				comment "Remove existing items";
				removeAllWeapons _unit;
				removeAllItems _unit;
				removeAllAssignedItems _unit;
				removeUniform _unit;
				removeVest _unit;
				removeBackpack _unit;
				removeHeadgear _unit;
				removeGoggles _unit;

				comment "Add containers";
				_unit forceAddUniform "LOP_U_CHR_Citizen_05";
				_unit addItemToUniform "rhs_30Rnd_545x39_AK";
				_unit addVest "V_BandollierB_blk";
				for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
				_unit addHeadgear "LOP_H_Villager_cap";

				comment "Add weapons";
				_unit addWeapon "rhs_weap_ak74";
				_unit addPrimaryWeaponItem "rhs_acc_dtk1983";
				};
				case "LOP_IRA_Infantry_AR": {
					comment "Ametrallador";
					comment "Remove existing items";
					removeAllWeapons _unit;
					removeAllItems _unit;
					removeAllAssignedItems _unit;
					removeUniform _unit;
					removeVest _unit;
					removeBackpack _unit;
					removeHeadgear _unit;
					removeGoggles _unit;

					comment "Add containers";
					_unit forceAddUniform "LOP_U_CHR_Citizen_05";
					_unit addVest "V_BandollierB_blk";
					_unit addItemToVest "rhs_100Rnd_762x54mmR";
					_unit addBackpack "B_FieldPack_blk";
					for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
					_unit addHeadgear "LOP_H_Villager_cap";

					comment "Add weapons";
					_unit addWeapon "rhs_weap_pkm";
				}
		};

		/////////////////////////
	};


_grp
