/*******************************************************************************
                          Realizado por |ArgA|Ignacio
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

[] execVM "scripts\del_terrain.sqf";
if(_customSkillsIA == 1)then{
    {
        if (!(isPlayer  _x))then
        {
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

/*******************************************************************************
                          Realizado por |ArgA|Vultur
*******************************************************************************/
waitUntil { time > 1140}; //Apago las torres y suena la alarma a los 20 minutos de iniciado la partida
"alarma" remoteExec ["playSound", 0];
_luces = [Luz_1,Luz_2,Luz_3,Luz_4,Luz_5,Luz_6,Luz_7];
{
    _x setDamage 0.93;
} forEach _luces;
