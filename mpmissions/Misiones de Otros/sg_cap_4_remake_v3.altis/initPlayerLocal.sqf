/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

call compile preprocessFile "core\events\initPlayerLocal.sqf";

if(!(hasInterface || isDedicated)) exitWith {
    execVM "scripts\show_fps.sqf";
};

removeUniform player;

player forceAddUniform "arga_u_gen3_bosque_multicam";

for "_i" from 1 to 2 do {player addItemToUniform "ACE_epinephrine";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
player addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 3 do {player addItemToUniform "adv_aceSplint_splint";};
for "_i" from 1 to 10 do {player addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToUniform "ACE_packingBandage";};
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
player addItemToUniform "ACRE_PRC343";
player addItemToUniform "ACE_tourniquet";
player addItemToUniform "SmokeShellBlue";

//Nightstalkers theme
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1.1, 0.0, [0.0, 0.0, 0.0, 0.0], [1.0,0.7, 0.6, 0.60], [0.200, 0.600, 0.100, 0.0]];
"colorCorrections" ppEffectCommit 0;

/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
