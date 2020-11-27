/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params ["_group"];

if(!isServer) exitWith { };

private _pos = [3783.79,6110.34,0];

if( !(isNull objectParent (leader _group))) then {
    private _vehicle = vehicle (leader _group);
    _vehicle setVehicleLock "LOCKED";
};

{
	doGetOut _x;
} forEach units _group;

sleep 2;

(units _group) doMove _pos;



/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/