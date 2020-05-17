//////////////////////////////////////////////////////////////////
///////////      Realizado por |ArgA|Vultur|Sdo¹    //////////////
//////////////////////////////////////////////////////////////////
_algo = _this select ;
_algo allowDamage false;
clearWeaponCargo _algo;
clearMagazineCargo _algo;
clearItemCargo _algo;
/*_this addweaponcargo ["srifle_EBR_F",10];
_this addweaponcargo ["hgun_P07_F",10]; */
_algo addmagazinecargo ["rhs_mag_30Rnd_556x45_Mk262_Stanag", 100]; 
/*_this addmagazinecargo ["16Rnd_9x21_Mag", 30];
_this addmagazinecargo ["30Rnd_9x21_Mag", 10];
_this additemcargo ["optic_Aco", 10];
_this additemcargo ["optic_Hamr", 10];
_this additemcargo ["optic_Holosight", 10];
_this additemcargo ["acc_flashlight", 10];
_this additemcargo ["acc_pointer_IR", 10];
_this additemcargo ["U_B_CombatUniform_mcam", 10];
_this additemcargo ["U_B_CombatUniform_mcam_tshirt", 10];
_this additemcargo ["U_B_CombatUniform_mcam_vest", 10];
_this additemcargo ["H_HelmetB", 10];
_this additemcargo ["H_HelmetB_light", 10];
_this additemcargo ["H_HelmetB_paint", 10];
_this additemcargo ["V_PlateCarrier1_rgr", 10];
_this additemcargo ["V_PlateCarrier2_rgr", 10];
_this additemcargo ["V_PlateCarrierGL_rgr", 10];
_this addbackpackcargo ["B_AssaultPack_ocamo", 10];
_this addbackpackcargo ["B_Kitbag_sgg", 10];



private _rol = _this select 3;

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

switch (_rol)do
{
    case "Fusilero":
    {
        player forceAddUniform uniforme;
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_epinephrine";};
        for "_i" from 1 to 5 do {player addItemToUniform "ACE_quikclot";};
        player addItemToUniform "ACE_tourniquet";
        player addItemToUniform "ACE_EarPlugs";
        for "_i" from 1 to 4 do {player addItemToUniform "SmokeShellBlue";};
        player addItemToUniform "rhsusf_mag_17Rnd_9x19_FMJ";
        player addVest chaleco;
        player addItemToVest "ACE_EntrenchingTool";
        for "_i" from 1 to 2 do {player addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";};
        for "_i" from 1 to 8 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
        for "_i" from 1 to 4 do {player addItemToVest "ACE_M84";};
        for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
        player addHeadgear casco;

        player addWeapon "rhs_weap_m4a1_mstock";
        player addPrimaryWeaponItem "rhsusf_acc_nt4_black";
        player addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
        player addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
        player addPrimaryWeaponItem "rhsusf_acc_grip1";
        player addWeapon "rhsusf_weap_glock17g4";
        player addHandgunItem "rhsusf_acc_omega9k";
        player addWeapon "Rangefinder";

        player linkItem "ItemMap";
        player linkItem "ItemCompass";
        player linkItem "ItemWatch";
        player linkItem "tf_anprc152";
    };
    case "Granadero":
    {
        player forceAddUniform uniforme;
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_epinephrine";};
        for "_i" from 1 to 5 do {player addItemToUniform "ACE_quikclot";};
        player addItemToUniform "ACE_tourniquet";
        player addItemToUniform "ACE_EarPlugs";
        for "_i" from 1 to 4 do {player addItemToUniform "SmokeShellBlue";};
        player addItemToUniform "rhsusf_mag_17Rnd_9x19_FMJ";
        player addVest chaleco;
        player addItemToVest "ACE_EntrenchingTool";
        for "_i" from 1 to 2 do {player addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";};
        for "_i" from 1 to 4 do {player addItemToVest "ACE_M84";};
        for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
        for "_i" from 1 to 6 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
        for "_i" from 1 to 3 do {player addItemToVest "3Rnd_HE_Grenade_shell";};
        player addHeadgear casco;

        player addWeapon "rhs_weap_m4a1_m320";
        player addPrimaryWeaponItem "rhsusf_acc_nt4_black";
        player addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
        player addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
        player addWeapon "rhsusf_weap_glock17g4";
        player addHandgunItem "rhsusf_acc_omega9k";
        player addWeapon "Rangefinder";

        player linkItem "ItemMap";
        player linkItem "ItemCompass";
        player linkItem "ItemWatch";
        player linkItem "tf_anprc152";
    };
    case "Medico":
    {
        player forceAddUniform uniforme;
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_epinephrine";};
        for "_i" from 1 to 5 do {player addItemToUniform "ACE_quikclot";};
        player addItemToUniform "ACE_tourniquet";
        player addItemToUniform "ACE_EarPlugs";
        for "_i" from 1 to 4 do {player addItemToUniform "SmokeShellBlue";};
        player addItemToUniform "rhsusf_mag_17Rnd_9x19_FMJ";
        player addVest chaleco;
        player addItemToVest "ACE_EntrenchingTool";
        for "_i" from 1 to 2 do {player addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";};
        for "_i" from 1 to 4 do {player addItemToVest "ACE_M84";};
        for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
        for "_i" from 1 to 6 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
        player addBackpack mochila;
        for "_i" from 1 to 20 do {player addItemToBackpack "ACE_epinephrine";};
        for "_i" from 1 to 3 do {player addItemToBackpack "ACE_personalAidKit";};
        player addItemToBackpack "ACE_surgicalKit";
        for "_i" from 1 to 20 do {player addItemToBackpack "ACE_morphine";};
        for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV";};
        for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV_250";};
        for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV_500";};
        for "_i" from 1 to 2 do {player addItemToBackpack "ACE_bloodIV";};
        for "_i" from 1 to 2 do {player addItemToBackpack "ACE_bloodIV_250";};
        for "_i" from 1 to 2 do {player addItemToBackpack "ACE_bloodIV_500";};
        for "_i" from 1 to 4 do {player addItemToBackpack "ACE_tourniquet";};
        for "_i" from 1 to 30 do {player addItemToBackpack "ACE_fieldDressing";};
        for "_i" from 1 to 30 do {player addItemToBackpack "ACE_elasticBandage";};
        for "_i" from 1 to 30 do {player addItemToBackpack "ACE_quikclot";};
        for "_i" from 1 to 30 do {player addItemToBackpack "ACE_packingBandage";};
        player addHeadgear casco;

        player addWeapon "rhs_weap_m4a1_mstock";
        player addPrimaryWeaponItem "rhsusf_acc_nt4_black";
        player addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
        player addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
        player addWeapon "rhsusf_weap_glock17g4";
        player addHandgunItem "rhsusf_acc_omega9k";
        player addWeapon "Rangefinder";

        player linkItem "ItemMap";
        player linkItem "ItemCompass";
        player linkItem "ItemWatch";
        player linkItem "tf_anprc152";
    };
    case "M240B":
    {
        player forceAddUniform uniforme;
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_epinephrine";};
        for "_i" from 1 to 5 do {player addItemToUniform "ACE_quikclot";};
        player addItemToUniform "ACE_tourniquet";
        player addItemToUniform "ACE_EarPlugs";
        for "_i" from 1 to 4 do {player addItemToUniform "SmokeShellBlue";};
        player addVest chaleco;
        player addItemToVest "ACE_EntrenchingTool";
        for "_i" from 1 to 2 do {player addItemToVest "rhsusf_50Rnd_762x51_m80a1epr";};
        for "_i" from 1 to 2 do {player addItemToVest "rhsusf_50Rnd_762x51_m62_tracer";};
        player addBackpack mochila;
        for "_i" from 1 to 2 do {player addItemToBackpack "rhsusf_100Rnd_762x51";};
        for "_i" from 1 to 2 do {player addItemToBackpack "rhsusf_100Rnd_762x51_m61_ap";};
        for "_i" from 1 to 2 do {player addItemToBackpack "rhsusf_100Rnd_762x51_m62_tracer";};
        player addItemToBackpack "ACE_SpareBarrel";
        player addHeadgear casco;

        player addWeapon "rhs_weap_m240B";
        player addPrimaryWeaponItem "ACE_muzzle_mzls_B";
        player addPrimaryWeaponItem "rhsusf_acc_ACOG_MDO";

        player linkItem "ItemMap";
        player linkItem "ItemCompass";
        player linkItem "ItemWatch";
        player linkItem "tf_anprc152";
        player setFace "GreekHead_A3_05";
        player setSpeaker "male05gre";
    };
    case "M249":
    {
        player forceAddUniform uniforme;
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_epinephrine";};
        for "_i" from 1 to 5 do {player addItemToUniform "ACE_quikclot";};
        player addItemToUniform "ACE_tourniquet";
        player addItemToUniform "ACE_EarPlugs";
        for "_i" from 1 to 4 do {player addItemToUniform "SmokeShellBlue";};
        player addVest chaleco;
        player addItemToVest "ACE_EntrenchingTool";
        for "_i" from 1 to 2 do {player addItemToVest "rhs_200rnd_556x45_M_SAW";};
        player addBackpack mochila;
        player addItemToBackpack "ACE_SpareBarrel";
        for "_i" from 1 to 5 do {player addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
        player addHeadgear casco;

        player addWeapon "rhs_weap_m249_pip";
        player addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";

        player linkItem "ItemMap";
        player linkItem "ItemCompass";
        player linkItem "ItemWatch";
        player linkItem "tf_anprc152";
    };
    case "Tirador":
    {
        player forceAddUniform uniforme;
        for "_i" from 1 to 4 do {player addItemToUniform "ACE_packingBandage";};
        for "_i" from 1 to 6 do {player addItemToUniform "ACE_elasticBandage";};
        player addItemToUniform "ACE_tourniquet";
        for "_i" from 1 to 4 do {player addItemToUniform "ACE_morphine";};
        player addItemToUniform "ACE_epinephrine";
        player addItemToUniform "ACE_ATragMX";
        player addItemToUniform "ACE_Kestrel4500";
        for "_i" from 1 to 3 do {player addItemToUniform "ACE_CableTie";};
        player addItemToUniform "ACE_EarPlugs";
        player addItemToUniform "ACE_MapTools";
        for "_i" from 1 to 2 do {player addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
        player addVest chaleco;
        for "_i" from 1 to 8 do {player addItemToVest "rhsusf_20Rnd_762x51_m62_Mag";};
        player addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";
        player addBackpack mochila;
        player addItemToBackpack "ACE_EntrenchingTool";
        player addItemToBackpack "rhsusf_acc_ACOG_RMR";
        for "_i" from 1 to 12 do {player addItemToBackpack "rhsusf_20Rnd_762x51_m993_Mag";};
        for "_i" from 1 to 5 do {player addItemToBackpack "SmokeShellBlue";};
        for "_i" from 1 to 5 do {player addItemToBackpack "ACE_M84";};
        player addItemToBackpack "rhsusf_20Rnd_762x51_m62_Mag";
        player addHeadgear casco;

        player addWeapon "rhs_weap_sr25_ec";
        player addPrimaryWeaponItem "rhsusf_acc_SR25S";
        player addPrimaryWeaponItem "rhsusf_acc_premier_low";
        player addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
        player addWeapon "rhsusf_weap_glock17g4";
        player addHandgunItem "rhsusf_acc_omega9k";
        player addWeapon "ACE_VectorDay";

        player linkItem "ItemMap";
        player linkItem "ItemCompass";
        player linkItem "ACE_Altimeter";
        player linkItem "tf_anprc152_2";
    };
    case "Helicoptero":
    {
        player forceAddUniform "arga_u_piloto";
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
        for "_i" from 1 to 2 do {player addItemToUniform "ACE_epinephrine";};
        for "_i" from 1 to 5 do {player addItemToUniform "ACE_quikclot";};
        player addItemToUniform "ACE_tourniquet";
        player addItemToUniform "ACE_EarPlugs";
        for "_i" from 1 to 4 do {player addItemToUniform "SmokeShellBlue";};
        player addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";
        player addVest "V_TacVest_blk";
        for "_i" from 1 to 5 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
        for "_i" from 1 to 2 do {player addItemToVest "SmokeShellGreen";};
        for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
        for "_i" from 1 to 2 do {player addItemToVest "SmokeShellPurple";};
        for "_i" from 1 to 2 do {player addItemToVest "SmokeShellOrange";};
        for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
        for "_i" from 1 to 2 do {player addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";};
        player addHeadgear "H_CrewHelmetHeli_B";
        player addGoggles "rhs_ess_black";
        player addWeapon "rhs_weap_m4_carryhandle_pmag";
        player addWeapon "rhsusf_weap_glock17g4";

        player linkItem "ItemMap";
        player linkItem "ItemCompass";
        player linkItem "ItemWatch";
        player linkItem "tf_anprc152";
        player linkItem "ItemGPS";
        player linkItem "NVGoggles_OPFOR";

        player setFace "GreekHead_A3_05";
        player setSpeaker "male04gre";
    };
    case "Experto":
    {
      player forceAddUniform uniforme;
      for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
      for "_i" from 1 to 2 do {player addItemToUniform "ACE_epinephrine";};
      for "_i" from 1 to 5 do {player addItemToUniform "ACE_quikclot";};
      player addItemToUniform "ACE_tourniquet";
      player addItemToUniform "ACE_EarPlugs";
      for "_i" from 1 to 4 do {player addItemToUniform "SmokeShellBlue";};
      player addVest chaleco;
      player addItemToVest "ACE_EntrenchingTool";
      for "_i" from 1 to 3 do {player addItemToVest "ACE_Clacker";};
      for "_i" from 1 to 2 do {player addItemToVest "ACE_M26_Clacker";};
      for "_i" from 1 to 2 do {player addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";};
      for "_i" from 1 to 7 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
      for "_i" from 1 to 4 do {player addItemToVest "ACE_M84";};
      for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
      player addBackpack mochila;
      for "_i" from 1 to 8 do {player addItemToBackpack "DemoCharge_Remote_Mag";};
      for "_i" from 1 to 2 do {player addItemToBackpack "SatchelCharge_Remote_Mag";};
      player addHeadgear casco;

      player addWeapon "rhs_weap_m4a1_mstock";
      player addPrimaryWeaponItem "rhsusf_acc_nt4_black";
      player addPrimaryWeaponItem "rhsusf_acc_anpeq15_bk";
      player addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
      player addPrimaryWeaponItem "rhsusf_acc_grip1";
      player addWeapon "rhsusf_weap_glock17g4";
      player addHandgunItem "rhsusf_acc_omega9k";
      player addWeapon "Rangefinder";

      player linkItem "ItemMap";
      player linkItem "ItemCompass";
      player linkItem "ItemWatch";
      player linkItem "tf_anprc152";
    };
    case "AT":
    {
        player forceAddUniform uniforme;
        for "_i" from 1 to 6 do {player addItemToUniform "ACE_elasticBandage";};
        for "_i" from 1 to 4 do {player addItemToUniform "ACE_packingBandage";};
        player addItemToUniform "ACE_tourniquet";
        player addItemToUniform "ACE_EarPlugs";
        for "_i" from 1 to 3 do {player addItemToUniform "ACE_CableTie";};
        player addItemToUniform "ACE_EntrenchingTool";
        for "_i" from 1 to 4 do {player addItemToUniform "ACE_morphine";};
        player addItemToUniform "ACE_epinephrine";
        player addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";
        player addVest chaleco;
        for "_i" from 1 to 10 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
        for "_i" from 1 to 5 do {player addItemToVest "SmokeShellBlue";};
        for "_i" from 1 to 6 do {player addItemToVest "ACE_M84";};
        player addBackpack mochila;
        for "_i" from 1 to 3 do {player addItemToBackpack "RPG32_F";};
        for "_i" from 1 to 2 do {player addItemToBackpack "RPG32_HE_F";};
        for "_i" from 1 to 2 do {player addItemToBackpack "rhsusf_mag_17Rnd_9x19_JHP";};
        player addHeadgear casco;

        player addWeapon "rhs_weap_m4a1_carryhandle_pmag";
        player addPrimaryWeaponItem "rhsusf_acc_nt4_black";
        player addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR";
        player addPrimaryWeaponItem "rhsusf_acc_grip1";
        player addWeapon "launch_RPG32_F";
        player addWeapon "rhsusf_weap_glock17g4";
        player addHandgunItem "rhsusf_acc_omega9k";
        player addWeapon "ACE_VectorDay";

        player linkItem "ItemMap";
        player linkItem "ItemCompass";
        player linkItem "ACE_Altimeter";
        player linkItem "tf_anprc152_4";
    };
};
*/
