/*******************************************************************************
                          	Modify by |ArgA|Vultur|Cbo¹
*******************************************************************************/

params ["_Mortar","_Unit","_Position"];

Private _Mag = currentMagazine _Mortar;

//systemChat format ["_Mortar %1 _Unit %2 _Position %3",_Mortar,_Unit,_Position];

_Unit doWatch [(_Position select 0),(_Position select 1),((_Position select 2) + 1000)];
_Mortar addMagazine _Mag;
_Mortar Fire (CurrentWeapon _Mortar)

/*******************************************************************************
                          	Modify by |ArgA|Vultur|Cbo¹
*******************************************************************************/