///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

setTerrainGrid 40;

[] execVM "scripts\civiles.sqf";

[] execVM "scripts\setBriefing.sqf";

//////////////////////////////////////////////////////////////////
///////////      Realizado por |ArgA|Vultur|Sdo¹    //////////////
//////////////////////////////////////////////////////////////////

//marcadores = ["M_Aerodoromo","M_Aeropuerto","M_Anthrakia","M_Base_Pyrgos","M_Chalkeia","M_Charkia","M_Dorida","M_Feres","M_Kalochori","M_Panagia","M_Paros","M_Pyrgos","M_Rodopoli","M_Selakano"];
marcadores = ["M_Aerodoromo","M_Base_Pyrgos","M_Chalkeia","M_Charkia","M_Dorida","M_Feres","M_Panagia","M_Pyrgos","M_Selakano"];

// Enemy Occupation System (EOS)
// http://www.armaholic.com/page.php?id=20262
// https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/
//
// Activa modulo EOS
//nul = [] execVM "eos\OpenMe.sqf";
