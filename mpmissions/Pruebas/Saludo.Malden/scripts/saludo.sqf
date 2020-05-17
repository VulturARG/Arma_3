//nul = execVM "scripts\saludo.sqf";
a_1 setDir 270;

sleep 0.1;

// Saludo 1 del Capitan
a_1 playMoveNow "AmovPercMstpSnonWnonDnon_Salute";

sleep 1;

// Saludo 1 de la tropa
{
  if (_x != a) then {
    _x disableAI "ANIM";
    _x playMove "AmovPercMstpSnonWnonDnon_SaluteIn";
  };

} forEach units a;

sleep 2;

// Saludo 2 del Capitan
a_1 playMove "AmovPercMstpSnonWnonDnon_SaluteOut";

sleep 1;

// Saludo 2 de la tropa
{
  if (_x != a) then {
    _x playMove "AmovPercMstpSnonWnonDnon_SaluteOut";
  };
} forEach units group a;
