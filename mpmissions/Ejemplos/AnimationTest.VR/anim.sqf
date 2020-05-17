
officer switchmove "WeaponMagazineReloadStand";
sleep 1;
WaitUntil {animationState officer != "WeaponMagazineReloadStand"};

officer AssignAsCargo heli;
sleep 1;
officer switchMove "";
heli setFuel 1;
[officer] orderGetIn true;