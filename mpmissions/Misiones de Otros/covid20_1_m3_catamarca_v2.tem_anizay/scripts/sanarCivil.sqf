params["_civil"];

private _inventario = items player;
if!("ACE_adenosine" in _inventario) exitWith{
    hintSilent "¡No tienes ADENOSINA en tu inventario!";
};


player playMove "Acts_TreatingWounded02";
_civil setVariable ["estaEnfermo", false, true];
civilesSanados = civilesSanados + 1;
publicVariable "civilesSanados";
player removeItem "ACE_adenosine";
sleep 8;

fn_cambiarAnim = {
    params["_civil"];
    _civil playMove "Acts_CivilInjuredGeneral_1";
};
[_civil] remoteExec ["fn_cambiarAnim", 0, true];
