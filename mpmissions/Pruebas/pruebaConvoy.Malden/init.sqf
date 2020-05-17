///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

setTerrainGrid 40;
/*
[] execVM "scripts\civiles.sqf";

[] execVM "scripts\setBriefing.sqf";
*/
///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
if (isServer) then
{
		//CuratorModule = your curator module name; true = boolean, if civilians should be editable by zeus as well.
	[Z1,true] execVM "scripts\ADV_zeus.sqf";
  [Z2,true] execVM "scripts\ADV_zeus2.sqf";
};
/*
nul = [JIP] execVM "intro.sqf";

JIP - number, time in seconds
			- if negative the intro will be played for all JIP players regardless the time they join
			- if is bigger than 0, players joining after the amount of seconds specified will not see the intro

Examples
> INTRO will be played for all JIP players regardless of joining time
nul = [-1] execVM "AL_intro\intro.sqf";

> INTRO will be played for all JIP players if they join in the first 10 seconds after mission start
nul = [10] execVM "AL_intro\intro.sqf";
*/

nul = [-1] execVM "AL_intro\intro.sqf";
//nul = [60] execVM "AL_intro\intro.sqf";
