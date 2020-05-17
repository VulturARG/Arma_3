ADV_Zeus: Script for adding editor placed and spawned units to the Zeus interface by Belbo (or Pergor - that's an older nick of mine. ;))
(JIP compatible and almost idiot-proof)

Version 1.02

Setup:
	1. put the ADV_zeus.sqf into your missionfolder.
	
	2. put this in your mission's init.sqf (create if necessary)

////////// ADV_Zeus-Script by Belbo start //////////
	if (isServer) then 
{
		//CuratorModuleName = your curator module name; true = boolean, if civilians should be editable by zeus as well - set to false if you don't want civilians to be editable.
	[CuratorModuleName,true] execVM "ADV_zeus.sqf";
};
////////// ADV_Zeus-Script by Belbo end //////////


	3. Make sure to replace "CuratorModuleName" with the name of your actual curator module.
	
	4. Repeat for additional curator modules.
	
	5. Start your mission and have fun with all the stuff you have placed in the editor and all the respawning players and whatnot. :)

	
Changelog:
v1.02: - small change to the while-loop (thanks to Psychobastard)

v1.01: - reduced network traffic (thanks to Moricky)

v1.0: 	- Initial release