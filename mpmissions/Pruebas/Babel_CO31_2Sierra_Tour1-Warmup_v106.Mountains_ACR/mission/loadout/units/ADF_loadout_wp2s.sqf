/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: Custom uniform texture
Author: Whiztler
Script version: 1.01

Game type: COOP
File: ADF_loadout_wp2s.sqf
*********************************************************************************
Used exclusively by the server to apply textures globally
*********************************************************************************/

if (ADF_clanName == "Two Sierra") then {
	[] spawn {
		if (isMultiplayer) then {ADF_uArray = playableUnits;} else {ADF_uArray = switchableUnits};
		sleep 20; // wait till units have geared up
		{_x setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa"]} forEach ADF_uArray; 
		ADF_uArray = nil;
	};
};
if (ADF_clanName == "Wolfpack") then {
	[] spawn {
		if (isMultiplayer) then {ADF_uArray = playableUnits;} else {ADF_uArray = switchableUnits};
		sleep 20; // wait till units have geared up
		{_x setObjectTextureGlobal [0, "\A3\Characters_F\Common\Data\basicbody_black_co.paa"]} forEach ADF_uArray; 
		ADF_uArray = nil;
	};
};	
