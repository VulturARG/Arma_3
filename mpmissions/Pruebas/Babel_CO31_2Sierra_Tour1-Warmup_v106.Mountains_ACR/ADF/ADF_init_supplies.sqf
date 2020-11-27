/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Mission init - Vehicle/Crate Supplies
Author: Whiztler
Script version: 1.11

File: ADF_init_supplies.sqf
**********************************************************************************
This loads pre-configured supplies onto crates and vehicles. the
script checks if the crate or vehicle exists before adding supplies.
Supply scripts can be tailored for each mission.
See the 'scripts\supplies\' folder for all supply scripts.

This script is (to be) executed on the server only.
*********************************************************************************/

// Reporting
if (ADF_debug || ADF_extRpt || time < 180) then {diag_log "ADF RPT: Init - executing: ADF_init_supplies.sqf"};

// Crates
if !(isNil "crate_IFT_1") then {[crate_IFT_1] execVM format ["mission\loadout\crates\%1","ADF_cCargo_B_IFT.sqf"]};
if !(isNil "crate_IFT_2") then {[crate_IFT_2] execVM format ["mission\loadout\crates\%1","ADF_cCargo_B_IFT.sqf"]};
if !(isNil "crate_IWT_1") then {[crate_IWT_1] execVM format ["mission\loadout\crates\%1","ADF_cCargo_B_IWT.sqf"]};
if !(isNil "crate_CAV_1") then {[crate_CAV_1] execVM format ["mission\loadout\crates\%1","ADF_cCargo_B_CAV.sqf"]};
if !(isNil "crate_SOR_1") then {[crate_SOR_1] execVM format ["mission\loadout\crates\%1","ADF_cCargo_B_SpecOps.sqf"]};
if !(isNil "crate_SOD_1") then {[crate_SOD_1] execVM format ["mission\loadout\crates\%1","ADF_cCargo_B_WetGear.sqf"]};
if !(isNil "crate_SOP_1") then {[crate_SOP_1] execVM format ["mission\loadout\crates\%1","ADF_cCargo_B_RcnJTC.sqf"]};

// Vehicles
if !(isNil "MRAP_XO") then {[MRAP_XO] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_Car.sqf"]};
if !(isNil "MEDITRUCK_XO") then {[MEDITRUCK_XO] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_TruckMedi.sqf"]};
if !(isNil "MHQ") then {[MHQ] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_MHQ.sqf"]};
if !(isNil "SUPPLYTRUCK_AMMO") then {[SUPPLYTRUCK_AMMO] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_TruckAmmo.sqf"]};
if !(isNil "SUPPLYTRUCK_FUEL") then {[SUPPLYTRUCK_FUEL] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_TruckFuel.sqf"]};
if !(isNil "SUPPLYTRUCK_REPAIR") then {[SUPPLYTRUCK_REPAIR] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_TruckRepair.sqf"]};
if !(isNil "MRAP_INF_PC") then {[MRAP_INF_PC] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarSQD.sqf"]};
if !(isNil "MRAP_1INF_1") then {[MRAP_1INF_1] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarIFT.sqf"]};
if !(isNil "MRAP_1INF_2") then {[MRAP_1INF_2] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarIFT.sqf"]};
if !(isNil "MRAP_1INF_3") then {[MRAP_1INF_3] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarIFT.sqf"]};
if !(isNil "MRAP_1INF_4") then {[MRAP_1INF_4] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarIFT.sqf"]};
if !(isNil "TRPTTRUCK_INF1") then {[TRPTTRUCK_INF1] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_TruckTrpt.sqf"]};
if !(isNil "TRPTTRUCK_INF2") then {[TRPTTRUCK_INF2] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_TruckTrpt.sqf"]};
if !(isNil "MRAP_1INF_WT1") then {[MRAP_1INF_WT1] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarIWT.sqf"]};
if !(isNil "MRAP_1INF_WT2") then {[MRAP_1INF_WT2] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarIWT.sqf"]};
if !(isNil "TRPTTRUCK_INF3") then {[TRPTTRUCK_INF3] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarIWT.sqf"]};
if !(isNil "APC_2BAT") then {[APC_2BAT] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_Mech.sqf"]};
if !(isNil "APC_2BAT_A") then {[APC_2BAT_A] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_Mech.sqf"]};
if !(isNil "APC_2BAT_B") then {[APC_2BAT_B] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_Mech.sqf"]};
if !(isNil "APC_2BAT_C") then {[APC_2BAT_C] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_Mech.sqf"]};
if !(isNil "MBT_2BAT_A") then {[MBT_2BAT_A] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_Armor.sqf"]};
if !(isNil "MBT_2BAT_B") then {[MBT_2BAT_B] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_Armor.sqf"]};
if !(isNil "MLRS_2BAT") then {[MLRS_2BAT] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_Armor.sqf"]};
if !(isNil "M4_2BAT") then {[M4_2BAT] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_Armor.sqf"]};
if !(isNil "MH9_3WING_DC") then {[MH9_3WING_DC] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_AirHeli.sqf"]};
if !(isNil "AH99_3WING_1") then {[AH99_3WING_1] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_AirHeli.sqf"]};
if !(isNil "AH9_3WING_1") then {[AH9_3WING_1] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_AirHeli.sqf"]};
if !(isNil "UH80_3WING_A") then {[UH80_3WING_A] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_AirHeli.sqf"]};
if !(isNil "UH80_3WING_B") then {[UH80_3WING_B] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_AirHeli.sqf"]};
if !(isNil "CH67_3WING_C") then {[CH67_3WING_C] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_AirHeli.sqf"]};
if !(isNil "MRAP_4SOR_SSC") then {[MRAP_4SOR_SSC] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarRecon.sqf"]};
if !(isNil "MRAP_4SOR_M") then {[MRAP_4SOR_M] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarRecon.sqf"]};
if !(isNil "MRAP_4SOR_R") then {[MRAP_4SOR_R] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarRecon.sqf"]};
if !(isNil "MRAP_4SOR_Y") then {[MRAP_4SOR_Y] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarRecon.sqf"]};
if !(isNil "SOV_4SOD_1") then {[SOV_4SOD_1] execVM format ["mission\loadout\vehicles\%1","ADF_vCargo_B_CarRecon.sqf"]};