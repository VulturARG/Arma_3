/*
 * Purpose: Create DAC zones via script
 * 
 * Mission: Arma3 Headless Client Tutorial
 *  Author: Monsoon
 *   Email: rweezera@hotmail.com
 *
 */


/**
 * Converted with Arma2MapConverter v0.5.1-beta
 *
 * Source: Z:\Documents\Arma 3 - Other Profiles\Monsoon\missions\A3_HC_Tutorial.Stratis\mission.sqm
 * Date: 2/9/15 2:12 AM
 */

_westHQ = createCenter west;
_eastHQ = createCenter east;
_guerHQ = createCenter resistance;
_civHQ  = createCenter civilian;
_emptyHQ = createCenter civilian;


_createdUnits = [];
_createdMarkers = [];
_createdTriggers = [];

/********************
 * TRIGGER CREATION *
 ********************/
z1 = createTrigger["EmptyDetector", [1779.8839, 5766.8853, 0]];
z1 setTriggerArea[75, 75, 103.77654, true];
z1 setTriggerActivation["NONE", "NOT PRESENT", false];
z1 setTriggerStatements["time > 5", "null= [""z1"",[1,0,0],[3,2,10,6],[2,2,10,6],[],[],[1,1,1,0]] spawn DAC_Zone;", ""];
z1 setTriggerTimeout[0, 0, 0, true];
_createdTriggers = _createdTriggers + [z1];

// return all created units in an array
[_createdUnits, _createdMarkers, _createdTriggers]
