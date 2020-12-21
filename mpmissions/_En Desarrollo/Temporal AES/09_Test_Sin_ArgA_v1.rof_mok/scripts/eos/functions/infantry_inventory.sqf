/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

if (!isServer) exitWith {};

params ["_unit","_unitType"];

private _uniformOpforce      = ["U_BG_Guerrilla_6_1","LOP_U_CHR_Woodlander_04","U_BG_Guerilla2_3","LOP_U_CHR_Woodlander_03","U_C_Uniform_Farmer_01_F","LOP_U_CHR_Citizen_04","LOP_U_CHR_Villager_03","LOP_U_CHR_Woodlander_01","LOP_U_CHR_Worker_06","U_C_Uniform_Farmer_01_F"];
private _headgearOpforce     = ["rhsusf_protech_helmetz","LOP_H_Villager_cap","LOP_H_Villager_cap","LOP_H_Booniehat_RACS","LOP_U_CHR_Citizen_04","H_Bandanna_gry","PO_H_cap_tub","H_Cap_grn","LOP_H_ChDKZ_Beret","LOP_H_ChDKZ_Beret"];
private _GogglesOpforce      = ["","","","","","","","","G_Aviator","G_Spectacles_Tinted"];
private _typeOpforce         = ["FUS1","FUS2","FUS3","FUS4","FUS5","FUS6","ESC","AT1","AT2","MG"];

private _uniformIndependent  = ["rhsgref_uniform_flecktarn_full"/*,"","","","","","","","",""*/];
private _headgearIndependent = ["rhsgref_helmet_pasgt_flecktarn"/*,"","","","","","","","",""*/];
private _GogglesIndependent  = ["","","","","","","","","",""];
private _typeIndependent     = ["POT_FUS1","POT_FUS1","POT_FUS2","POT_FUS1","POT_FUS1","POT_249","POT_MED","POT_AT"];

removeAllWeapons       _unit;
removeAllItems         _unit;
removeAllAssignedItems _unit;
removeUniform          _unit;
removeVest             _unit;
removeBackpack         _unit;
removeHeadgear         _unit;
removeGoggles          _unit;

if (_unitType == "C_scientist_F" || _unitType == "O_crew_F") then {
  _unit forceAddUniform (_uniformOpforce  call BIS_fnc_selectRandom);
  _unit addHeadgear     (_headgearOpforce call BIS_fnc_selectRandom);
  private _goggles    = (_GogglesOpforce  call BIS_fnc_selectRandom);

  if (_goggles != "") then {
    _unit addGoggles _goggles;
  };

  _unit linkItem "ItemMap";
  _unit linkItem "ItemCompass";
  _unit linkItem "ItemWatch";

  switch (_typeOpforce call BIS_fnc_selectRandom) do {
    case "FUS1": {
      _unit addWeapon "rhs_weap_l1a1";
      _unit addPrimaryWeaponItem "rhsgref_acc_falMuzzle_l1a1";
      _unit addPrimaryWeaponItem "rhs_mag_20Rnd_762x51_m80_fnfal";
      _unit addVest "rhs_vest_pistol_holster";
      _unit addItemToUniform "rhs_mag_20Rnd_762x51_m80_fnfal";
      _unit addItemToVest "rhs_mag_20Rnd_762x51_m80_fnfal";
    };
    case "FUS2": {
      _unit addWeapon "rhs_weap_l1a1_wood";
      _unit addPrimaryWeaponItem "rhsgref_acc_falMuzzle_l1a1";
      _unit addPrimaryWeaponItem "rhs_mag_20Rnd_762x51_m80_fnfal";
      _unit addVest "V_Pocketed_black_F";
    };
    case "FUS3": {
      _unit addWeapon "rhs_weap_l1a1_wood";
      _unit addPrimaryWeaponItem "rhsgref_acc_falMuzzle_l1a1";
      _unit addPrimaryWeaponItem "rhs_mag_20Rnd_762x51_m80_fnfal";
      _unit addVest "V_LegStrapBag_coyote_F";
      for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_20Rnd_762x51_m80_fnfal";};
      _unit addItemToVest "rhs_mag_m18_green";
    };
    case "FUS4": {
      _unit addWeapon "rhs_weap_l1a1";
      _unit addPrimaryWeaponItem "rhsgref_acc_falMuzzle_l1a1";
      _unit addPrimaryWeaponItem "rhs_mag_20Rnd_762x51_m80_fnfal";
      _unit addVest "V_Pocketed_olive_F";
      for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_20Rnd_762x51_m80_fnfal";};
    };
    case "FUS5": {
      _unit addWeapon "rhs_weap_l1a1_wood";
      _unit addPrimaryWeaponItem "rhsgref_acc_falMuzzle_l1a1";
      _unit addPrimaryWeaponItem "rhs_mag_20Rnd_762x51_m80_fnfal";
      _unit addVest "V_LegStrapBag_black_F";
      _unit addItemToUniform "rhs_mag_20Rnd_762x51_m80_fnfal";
      for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_20Rnd_762x51_m80_fnfal";};
      _unit addItemToVest "rhs_mag_m18_green";
    };
    case "FUS6": {
      _unit addWeapon "rhs_weap_l1a1_wood";
      _unit addPrimaryWeaponItem "rhsgref_acc_falMuzzle_l1a1";
      _unit addPrimaryWeaponItem "rhs_mag_20Rnd_762x51_m80_fnfal";
      _unit forceAddUniform "U_BG_Guerrilla_6_1";
      _unit addVest "rhsgref_TacVest_ERDL";
    };
    case "ESC": {
      _unit addWeapon "rhs_weap_Izh18";
      _unit addPrimaryWeaponItem "rhsgref_1Rnd_00Buck";
      _unit addWeapon "hgun_Rook40_F";
      _unit addHandgunItem "16Rnd_9x21_Mag";
      _unit addVest "LOP_6sh46";
      for "_i" from 1 to 3 do {_unit addItemToUniform "rhsgref_1Rnd_00Buck";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
      for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_m18_green";};
      for "_i" from 1 to 15 do {_unit addItemToVest "rhsgref_1Rnd_00Buck";};
      for "_i" from 1 to 2 do {_unit addItemToVest "rhsgref_1Rnd_Slug";};
      _unit addItemToVest "16Rnd_9x21_Mag";
    };
    case "AT1": {
      _unit addWeapon "rhs_weap_l1a1_wood";
      _unit addPrimaryWeaponItem "rhsgref_acc_falMuzzle_l1a1";
      _unit addPrimaryWeaponItem "rhs_mag_20Rnd_762x51_m80_fnfal";
      _unit addWeapon "rhs_weap_m72a7";
      _unit addVest "V_LegStrapBag_coyote_F";
      for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_20Rnd_762x51_m80_fnfal";};
      _unit addItemToVest "rhs_mag_m18_green";
    };
    case "AT2": {
      _unit addWeapon "rhs_weap_l1a1_wood";
      _unit addPrimaryWeaponItem "rhsgref_acc_falMuzzle_l1a1";
      _unit addPrimaryWeaponItem "rhs_mag_20Rnd_762x51_m80_fnfal";
      _unit addWeapon "launch_RPG7_F";
      _unit addSecondaryWeaponItem "RPG7_F";
      _unit addVest "V_Pocketed_coyote_F";
      _unit addBackpack "B_Messenger_Black_F";
      for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7V_mag";};
    };
    case "MG": {
      _unit addWeapon "rhs_weap_mg42";
      _unit addPrimaryWeaponItem "rhsgref_50Rnd_792x57_SmE_drum";
      _unit addVest "rhs_vydra_3m";
      _unit addBackpack "B_Messenger_Olive_F";
      _unit addItemToUniform "rhsgref_50Rnd_792x57_SmE_drum";
      _unit addItemToVest "rhs_mag_m18_green";
      _unit addItemToVest "MiniGrenade";
      for "_i" from 1 to 3 do {_unit addItemToVest "rhsgref_50Rnd_792x57_SmK_alltracers_drum";};
      _unit addItemToBackpack "ACE_SpareBarrel";
      for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsgref_50Rnd_792x57_SmK_alltracers_drum";};
    };
  };

};

if (_unitType == "I_soldier_F") then {
  _unit forceAddUniform (_uniformIndependent   call BIS_fnc_selectRandom);
  _unit addHeadgear     (_headgearIndependent  call BIS_fnc_selectRandom);
  private _goggles    = (_GogglesIndependent call BIS_fnc_selectRandom);
  if (_goggles != "") then {
    _unit addGoggles _goggles;
  };

  _unit linkItem "ItemMap";
  _unit linkItem "ItemCompass";
  _unit linkItem "ItemWatch";
  _unit linkItem "ItemRadio";

  switch (_typeIndependent call BIS_fnc_selectRandom) do {
    case "POT_FUS1": {
      _unit addWeapon "rhs_weap_m16a4_carryhandle";
      _unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
      _unit addWeapon "hgun_Rook40_F";
      _unit addHandgunItem "16Rnd_9x21_Mag";
      for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_packingBandage";};
      for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_elasticBandage";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
      for "_i" from 1 to 3 do {_unit addItemToUniform "adv_aceSplint_splint";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
      _unit addItemToUniform "ACE_EntrenchingTool";
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
      _unit addItemToUniform "ACE_EarPlugs";
      for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
      for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
      for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
    };
    case "POT_FUS2": {
      _unit addWeapon "rhs_weap_m16a4_carryhandle";
      _unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
      _unit addWeapon "hgun_Rook40_F";
      _unit addHandgunItem "16Rnd_9x21_Mag";
      _unit addBackpack "arga_m_petate_selva_marpat";
      for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_packingBandage";};
      for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_elasticBandage";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
      for "_i" from 1 to 3 do {_unit addItemToUniform "adv_aceSplint_splint";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
      _unit addItemToUniform "ACE_EntrenchingTool";
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
      _unit addItemToUniform "ACE_EarPlugs";
      for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
      for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
      for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
      for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_packingBandage";};
      for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_elasticBandage";};
      for "_i" from 1 to 2 do {_unit addItemToBackpack "adv_aceSplint_splint";};
      _unit addItemToBackpack "ACE_Flashlight_MX991";
      _unit addItemToBackpack "ACE_morphine";
      _unit addItemToBackpack "ACE_epinephrine";
      _unit addItemToBackpack "ACE_salineIV_500";
      for "_i" from 1 to 5 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
    };
    case "POT_249": {
      _unit addWeapon "rhs_weap_m249_pip_L_para";
      _unit addPrimaryWeaponItem "ACE_muzzle_mzls_L";
      _unit addPrimaryWeaponItem "rhsusf_200Rnd_556x45_box";
      _unit addPrimaryWeaponItem "rhsusf_acc_saw_bipod";
      _unit addWeapon "hgun_Rook40_F";
      _unit addHandgunItem "16Rnd_9x21_Mag";

      _unit addBackpack "arga_m_petate_selva_marpat";

      for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_packingBandage";};
      for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_elasticBandage";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
      for "_i" from 1 to 3 do {_unit addItemToUniform "adv_aceSplint_splint";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
      _unit addItemToUniform "ACE_EntrenchingTool";
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
      _unit addItemToUniform "ACE_EarPlugs";
      _unit addItemToVest "16Rnd_9x21_Mag";
      for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
      _unit addItemToVest "rhsusf_200rnd_556x45_mixed_box";
      for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_packingBandage";};
      for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_elasticBandage";};
      for "_i" from 1 to 2 do {_unit addItemToBackpack "adv_aceSplint_splint";};
      _unit addItemToBackpack "ACE_Flashlight_MX991";
      _unit addItemToBackpack "ACE_morphine";
      _unit addItemToBackpack "ACE_epinephrine";
      _unit addItemToBackpack "ACE_salineIV_500";
      for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_200Rnd_556x45_box";};
      for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_200rnd_556x45_mixed_box";};
    };
    case "POT_MED": {
      _unit addWeapon "rhs_weap_m16a4_carryhandle";
      _unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
      _unit addWeapon "hgun_Rook40_F";
      _unit addHandgunItem "16Rnd_9x21_Mag";

      _unit addBackpack "arga_m_petate_selva_marpat";

      for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_packingBandage";};
      for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_elasticBandage";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
      for "_i" from 1 to 3 do {_unit addItemToUniform "adv_aceSplint_splint";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
      _unit addItemToUniform "ACE_EntrenchingTool";
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
      _unit addItemToUniform "ACE_EarPlugs";
      for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
      for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
      for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
      for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_packingBandage";};
      for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_elasticBandage";};
      for "_i" from 1 to 5 do {_unit addItemToBackpack "adv_aceSplint_splint";};
      _unit addItemToBackpack "ACE_Flashlight_MX991";
      for "_i" from 1 to 7 do {_unit addItemToBackpack "ACE_morphine";};
      for "_i" from 1 to 7 do {_unit addItemToBackpack "ACE_epinephrine";};
      for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_salineIV_500";};
      _unit addItemToBackpack "ACE_MapTools";
      for "_i" from 1 to 6 do {_unit addItemToBackpack "ACE_tourniquet";};
      for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_CableTie";};
      _unit addItemToBackpack "ACE_EntrenchingTool";
      for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_salineIV";};
      _unit addItemToBackpack "ACE_surgicalKit";
      for "_i" from 1 to 5 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
    };
    case "POT_AT": {
      _unit addWeapon "rhs_weap_m16a4_carryhandle";
      _unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
      _unit addWeapon "rhs_weap_maaws";
      _unit addSecondaryWeaponItem "rhs_optic_maaws";
      _unit addSecondaryWeaponItem "rhs_mag_maaws_HEAT";
      _unit addWeapon "hgun_Rook40_F";
      _unit addHandgunItem "16Rnd_9x21_Mag";

      _unit addBackpack "arga_m_petate_selva_marpat";

      for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_packingBandage";};
      for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_elasticBandage";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
      for "_i" from 1 to 3 do {_unit addItemToUniform "adv_aceSplint_splint";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
      _unit addItemToUniform "ACE_EntrenchingTool";
      for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
      _unit addItemToUniform "ACE_EarPlugs";
      for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
      for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
      for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
      for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_packingBandage";};
      for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_elasticBandage";};
      for "_i" from 1 to 2 do {_unit addItemToBackpack "adv_aceSplint_splint";};
      _unit addItemToBackpack "ACE_Flashlight_MX991";
      _unit addItemToBackpack "ACE_morphine";
      _unit addItemToBackpack "ACE_epinephrine";
      _unit addItemToBackpack "ACE_salineIV_500";
      for "_i" from 1 to 4 do {_unit addItemToBackpack "MRAWS_HEAT_F";};
      for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
    };
  }; 
};

_unit

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

//  ["INF_INV:","Dentro"] call MIV_fnc_log;
//  ["INF_INV:","_unit", _unit] call MIV_fnc_log;
//  ["INF_INV:","_unit:", _unit,"_unitType:",_unitType] call MIV_fnc_log;