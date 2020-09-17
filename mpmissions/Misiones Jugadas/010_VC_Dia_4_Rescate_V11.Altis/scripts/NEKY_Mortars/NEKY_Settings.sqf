//	Settings for NEKY_Mortars
//	
//	(https://community.bistudio.com/wiki/Arma_3_CfgMagazines#8Rnd_82mm_Mo_shells)   Mortar class names
//	
//	Made by NeKo-ArroW

/*******************************************************************************
                          	Modify by |ArgA|Vultur|Cbo¹
*******************************************************************************/

// General Settings
_TravelTime = 15;											// Time it takes for round to travel to its position. (Will always take a minimum of 2sec for sound effects sake).	Number (Seconds)
_Avoid = False;												// Avoid firing near friendlies, if friendlies are within "inaccuracy" area, it will hold fire and rescan.			Boolean
_AvoidMultiplier = 0.9;										// if a unit is within inaccuracy zone times(*) this multiplier then it counts as "too close".						Number (Multiplier)
_Danger = True;												// Dismount static weapon if an enemy unit is close.																Boolean
_DangerClose = 50;											// Range from which the unit will react to enemy forces and dismount static weapon.									Number (Meters)
_Lock = True;												// Lock the mortar if the gunner dies or leaves it (To avoid other AI to take it and operate it as they see fit). 	Boolean
_ScanVehicles = False;										// When scanning for targets, count manned vehicles as targets. True/False											Boolean
_Ammo = 100;												// Total ammo the mortar can spend. Once empty, unit will dismount.													Number (Mortars)

//	Firing Mode settings
_firingModeArray = ["sporadic", "precise", "barrage", "guided","screen","safe"]; // Firing modes ["Sporadic", "Precise", "Barrage", "Guided","Screen"]							Array of Strings
_roundSize = [10,12,14];									// Randomly select number of mortars per all rotation.																Array of numbers (Mortars)
_roundTimeArray =[8,11,4,_TravelTime + 5,3,9];				// The time it takes for the mortar to fire next round for Sporadic, Precise, Barrage, Guided modes					Array of number (Seconds)
_inaccuracyMultiplier = [4,1,1.75,3,1,1];					// How much more inaccurate the barrage will be compared to a precise (1) strike.									Array of numbers (Multiplier)	
_ReloadTime = [170,160,710,160,150,120];					// The time it takes for the mortar to prepare for another strike after performing a Screen strike.					Array of numbers (Seconds)

// Class Names

//Class round: light           medium         heavy             smoke                    flare 
_round = ["Sh_82mm_AMOS", "Sh_120mm_HE", "Sh_155mm_AMOS", "Smoke_120mm_AMOS_White", "F_40mm_White"];

_MortarTypeArray = [ "light", "medium", "heavy", "smoke", "flare"];

// Day/Night time
_Sunrise = 4.20;											// The time it gets bright enough for smokes to be used instead of flares.											Number (0.00 - 23.59)
_Sunset = 19.15;											// The time it gets dark enough to start using flares.																Number (0.00 - 23.59)

// Crew
_BLUFORGunner = ["B_Soldier_F"];							// BLUFOR Gunner for the Mortar
_OPFORGunner  = ["LOP_IRA_Infantry_Rifleman"];				// OPFOR Gunner for the Mortar
_INDEPGunner  = ["I_Soldier_F"];							// INDEPENDENT Gunner for the Mortar

//	Marking and Sound effects
_Marking    = [true,true,true,true,true,true];				// If marking should be used on firing modes. [Sporadic,Precise,Barrage,Guided,Screen] True / False					Array of Booleans
_SoundOn    = [true,false,false,false,true,true];			// If sound effect should be applied to mortar round when incoming. [Light,Medium,Heavy,Smoke,Flare] True / False	Array of Booleans
_SoundTypes = ["mortar1","","","",""];						// The sound effects used by using Say3d. [Light,Medium,Heavy,Smoke]												Array of Strings
_MarkSmoke  = "SmokeShellRed";								// Class name of smoke that marks target area.																		String
_MarkFlare  = "F_40mm_Red";									// Class name of flare that marks target area.																		String

//	Random Parameter. These are the firing modes that will be randomly selected if firing mode is "Random".
_RandomFiringMode = ["Sporadic", "Precise", "Barrage", "Guided"]; // Randomly selected firing mode. Default: ["Sporadic", "Precise", "Barrage", "Guided"]						Array of Strings
