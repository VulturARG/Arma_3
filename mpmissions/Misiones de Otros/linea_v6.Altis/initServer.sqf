/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

private _customSkillsIA = getMissionConfigValue ["DIFICULTAD_IA_PERSONALIZADA", 1];
private _aimingAccuracy = getMissionConfigValue ["AIMING_ACCURACY", 0.01];
private _aimingShake = getMissionConfigValue ["AIMING_SHAKE", 0.99];
private _aimingSpeed = getMissionConfigValue ["AIMING_SPEED", 0.1];
private _spotDistance = getMissionConfigValue ["SPOT_DISTANCE", 0.2];
private _spotTime = getMissionConfigValue ["SPOT_TIME", 0.5];
private _courage = getMissionConfigValue ["COURAGE", 0.25];
private _reloadSpeed = getMissionConfigValue ["RELOAD_SPEED", 0.25];
private _commanding = getMissionConfigValue ["COMMANDING", 0.75];
private _disableGroupIA = getMissionConfigValue ["DESACTIVAR_IA_DE_GRUPO", 1];
private _disableBluforIA = getMissionConfigValue ["DESACTIVAR_TODO_BLUFOR", 0];

if(_customSkillsIA == 1)then{
    {
        if (!(isPlayer  _x))then
        {
            (group _x) setVariable ["VCM_Skilldisable",true];
            _x setSkill ["aimingAccuracy", _aimingAccuracy];
            _x setSkill ["aimingShake", _aimingShake];
            _x setSkill ["aimingSpeed", _aimingSpeed];
            _x setSkill ["spotDistance", _spotDistance];
            _x setSkill ["spotTime", _spotTime];
            _x setSkill ["courage", _courage];
            _x setSkill ["reloadSpeed", _reloadSpeed];
            _x setSkill ["commanding", _commanding];
        }
    } forEach allUnits;
};

{
  if (!(isPlayer  _x))then { 
    _x addeventhandler ["Killed", {_this execVM "scripts\remove_dead.sqf"}];
    if( !(isNull objectParent _x)) then {
        _vehicleUnit = vehicle _x;
        _vehicleUnit addeventhandler ["Killed", {_this execVM "scripts\remove_dead.sqf"}];
    };
  };
} forEach allUnits;

// Deshabilita el movimiento de la IA para todas las IA que 
// esten en el mismo grupo que un jugador humano
if(_disableGroupIA == 1)then{
    {
        private _group = (group _x);
        {
            doStop _x;
            _x disableAI "MOVE";
            _x action ["SwitchWeapon", _x, _x, 100];
            _x setUnitPos "middle";
        } forEach units _group;     
    } forEach allPlayers;
};

if(_disableBluforIA == 1) then {
  {
    if(side _x == west) then {
      doStop _x;
      _x disableAI "MOVE";
      _x action ["SwitchWeapon", _x, _x, 100];
      _x setUnitPos "middle";
    };
  }foreach allUnits;
};

execVM "scripts\init_objs_server.sqf";

execVM "scripts\smart_tank\smart.sqf";

execVM "scripts\init_mortero.sqf";

waitUntil { time > 0 };

execVM "scripts\defensa.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/