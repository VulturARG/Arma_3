/*********************************************************************************
 _____ ____  _____ 
|  _  |    \|   __|
|     |  |  |   __|
|__|__|____/|__|   
ARMA Mission Development Framework
ADF version: 2.06 / JUN 2018

Script: mission config entries
Author: Whiztler
Script version: 1.51

File: ADF_mission_debriefing.hpp
*********************************************************************************
Here you can define the various mission endings, The information is show at the
end of the mission.

More information: https://community.bistudio.com/wiki/Description.ext#CfgDebriefing
and https://community.bistudio.com/wiki/Debriefing
*********************************************************************************/

class CfgDebriefing
{  
	class End1
	{
		title = "Mission Completed";
		subtitle = "Warmup";
		description = "Excellent achievement TWO SIERRA!";
		//pictureBackground = "mission\images\loadScreen_TwoSierra.jpg"; // eg. "img\yourpicture.jpg" no picture? use "";
		picture = "mission\images\logo_TwoSierra.paa"; // Marker icon
		pictureColor[] = {0.0,0.3,0.6,1}; // Overlay color
	};
	
	class End2
	{
		title = "Mission Failed";
		subtitle = "Warmup";
		description = "That could have gone so much worse, or not?";
		//pictureBackground = "mission\images\loadScreen_TwoSierra.jpg"; // eg. "img\yourpicture.jpg" no picture? use "";
		picture = "mission\images\logo_TwoSierra.paa"; // Marker icon
		pictureColor[] = {0.0,0.3,0.6,1}; // Overlay color
	};
	
	class Killed
	{
		title = "All units K.I.A.";
		subtitle = "Warmup";
		description = "TWO SIERRA R.I.P.";
		//pictureBackground = "mission\images\loadScreen_TwoSierra.jpg"; // eg. "img\yourpicture.jpg" no picture? use "";
		picture = "mission\images\logo_TwoSierra.paa"; // Marker icon
		pictureColor[] = {0.0,0.3,0.6,1}; // Overlay color
	};
};