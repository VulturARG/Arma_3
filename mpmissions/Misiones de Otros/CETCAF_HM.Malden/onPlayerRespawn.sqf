_null = (_this select 1) execVM "scripts\BuryCorpse.sqf";
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
	6 enableChannel [false, false];
	
