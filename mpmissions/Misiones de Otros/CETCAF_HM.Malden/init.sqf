enableSaving [false, false];
enableEnvironment [false, true];
//enableSentences false;
0 fadeRadio 0;
enableRadio false;
//player disableConversation true;
//player setVariable ["BIS_noCoreConversations", true]; 
[player ,"NoVoice"] remoteExec ["setSpeaker",0,true];


0 enableChannel [false, false];
1 enableChannel [false, false];
2 enableChannel [false, false];
3 enableChannel [false, false];
4 enableChannel [false, false];
5 enableChannel [true, false];
6 enableChannel [true, false];
	

if (hasInterface) then {btc_intro_done = [] spawn btc_fnc_intro;};

[] call compile preprocessFileLineNumbers "core\def\mission.sqf";
[] call compile preprocessFileLineNumbers "define_mod.sqf";

if (isServer) then {
    [] call compile preprocessFileLineNumbers "core\init_server.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\show_fps.sqf";
};

[] call compile preprocessFileLineNumbers "core\init_common.sqf";

if (!isDedicated && hasInterface) then {
    [] call compile preprocessFileLineNumbers "core\init_player.sqf";
};

if (!isDedicated && !hasInterface) then {
    [] call compile preprocessFileLineNumbers "core\init_headless.sqf";
};

//VIEW DISTANCE
tawvd_disablenone = true;
tawvd_maxRange = 15000;

#include "scripts\arsenal_medic.sqf";
#include "scripts\arsenal_fire.sqf";
[] execVM "Vcom\VcomInit.sqf";

null = [] execVM "scripts\SATCOM\compile.sqf";
null = [] execVM "scripts\MED_TREINAMENTO\compile.sqf";
null = [[mnt_01,mnt_02,mnt_03,mnt_04,mnt_05,mnt_06,mnt_07],playableUnits] execVM "scripts\MONITORAMENTO\Feedinit.sqf";
null = [sino,sino_1,sino_2] execVM "scripts\sino.sqf";
