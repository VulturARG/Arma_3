///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

setTerrainGrid 40;

[] execVM "scripts\civiles.sqf";

[] execVM "scripts\setBriefing.sqf";

//////////////////////////////////////////////////////////////////
///////////      Realizado por |ArgA|Vultur|Sdo¹    //////////////
//////////////////////////////////////////////////////////////////
if (isServer) then
{
		//CuratorModule = your curator module name; true = boolean, if civilians should be editable by zeus as well.
	[Observador_1,true] execVM "scripts\ADV_zeus.sqf";
  [Observador_2,true] execVM "scripts\ADV_zeus2.sqf";
  [Observador_3,true] execVM "scripts\ADV_zeus3.sqf";
  [Observador_4,true] execVM "scripts\ADV_zeus4.sqf";
	[Capitan,true] execVM "scripts\ADV_zeus5.sqf";
  [Teniente,true] execVM "scripts\ADV_zeus6.sqf";
};
