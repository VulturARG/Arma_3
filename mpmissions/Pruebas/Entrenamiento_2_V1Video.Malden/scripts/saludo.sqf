//nul = execVM "scripts\saludo.sqf";
sleep 0.5;

// Saludo 1 del Capitan
a_1 playMove "AmovPercMstpSnonWnonDnon_Salute";

sleep 0.5;

// Saludo 1 de la tropa
{
  _x disableAI "ANIM";
  _x playMove "AmovPercMstpSnonWnonDnon_SaluteIn";
} forEach units a;

sleep 2;

// Saludo 2 del Capitan
a_1 playMove "AmovPercMstpSnonWnonDnon_SaluteOut";

sleep 0.5;

// Saludo 2 de la tropa
{
    _x playMove "AmovPercMstpSnonWnonDnon_SaluteOut";
} forEach units group a;
