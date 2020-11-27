/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Mission Params
Author: Whiztler
Script version: 1.02

Game type: n/a
File: ADF_mission_config_params.sqf
*********************************************************************************
Configure mission specific params here.
*********************************************************************************/

class customBlank_1 {title = ""; values[] = {-999}; default = -999; texts[] = {""};};	
class customBlank_2 
{
	title = "---------- MISSION PARAMS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------";
	values[] = {-999};
	default = -999;
	texts[] = {""};
};
class customBlank_3 {title = ""; values[] = {-999}; default = -999; texts[] = {""};};


class ADF_mb {
	title = "Mission balance : Mission difficulty level. If unsure leave as 'Default / auto'.";
	values[] = {0, 1, 2, 3};
	texts[] = {"Default / auto", "easy / low", "medium / medium", "hard / high"};
	default = 0;
};
