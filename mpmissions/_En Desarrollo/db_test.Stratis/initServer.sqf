/*******************************************************************************
                          Realizado por |ArgA|MIV
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

if(_customSkillsIA == 1) then {
    {
        if (!(isPlayer  _x)) then
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
    }forEach allUnits;
};

// Deshabilita el movimiento de la IA para todas las IA que 
// esten en el mismo grupo que un jugador humano
if (_disableGroupIA == 1) then {
    {
        private _group = (group _x);
        {
          if (!isPlayer _x) then {
            _x disableAI "MOVE";
            _x action ["SwitchWeapon", _x, _x, 100];
            // _x enableSimulationGlobal false;
            // _x hideObjectGlobal true;
          };
        } forEach units _group;     
    } forEach allPlayers;
};

if (_disableBluforIA == 1) then {
  {
    if(side _x == west && !isPlayer _x) then {
      _x disableAI "MOVE";
      _x action ["SwitchWeapon", _x, _x, 100];
      // _x enableSimulationGlobal false;
      // _x hideObjectGlobal true;
    };
  } foreach allUnits;
};

execVM "scripts\init_objs_server.sqf";

execVM "scripts\init_vcom_driving.sqf";

execVM "scripts\smart_tank\smart.sqf";

if (isDedicated) then {
  execVM "scripts\spawn_fnc.sqf";
  execVM "scripts\db\init_log_system.sqf";
};

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/