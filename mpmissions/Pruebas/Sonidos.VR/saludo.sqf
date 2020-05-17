//nul = [-1] execVM "AL_intro\intro.sqf";
soldado_1 playMove "AmovPercMstpSnonWnonDnon_Salute";
sleep 0.5;
soldado playMove "AmovPercMstpSnonWnonDnon_SaluteIn";
sleep 2;
soldado_1 playMove "AmovPercMstpSnonWnonDnon_SaluteOut";
sleep 0.5;
soldado playMove "AmovPercMstpSnonWnonDnon_SaluteOut";
/*
soldado switchMove "AmovPercMstpSrasWrflDnon";
[] spawn
{
	sleep 0.5;
	soldado playMove "AmovPpneMstpSrasWrflDnon"; // player goes prone
	soldado playMove "amovPknlMstpSrasWrflDnon"; // player gets up on one knee
};

/*
soldado_1 switchMove "amovpercmstpsraswrfldnon";
[] spawn
{
	sleep 0.5;
	soldado_1 playMove "AmovPpneMstpSrasWrflDnon"; // player never goes prone
	soldado_1 playMoveNow "AmovPknlMstpSrasWrflDnon"; // player goes down on one knee straight away
};
*/
