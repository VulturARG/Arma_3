/*
	Random Arty Script
	Written by Matt Horner
*/

artyactive = true;
artyradius = artyradius - closestrounds;
maxartytime = maxartytime - minartytime;

while {artyactive} do
{

	_artyposx = floor(random artyradius) + closestrounds;
	_artyposy = floor(random artyradius) + closestrounds;
	_dividerx = floor(random 2) + 1;
	_dividery = floor(random 2) + 1;
	_artyx = 0;
	_artyy = 0;
	
	_sleeptime = floor(random maxartytime) + minartytime;
	
	if (artydroppos distance artyorigin > artyradius) then {artydroppos setPos (getPos artyorigin);};
	
	if (_dividerx == 1) then
	{
		artydroppos setPos [(getPos artydroppos select 0) + _artyposx, getPos artydroppos select 1];
	};
	
	if (_dividerx == 2) then
	{
		artydroppos setPos [(getPos artydroppos select 0) - _artyposx, getPos artydroppos select 1];
	};
	
	if (_dividery == 1) then
	{
		artydroppos setPos [getPos artydroppos select 0, (getPos artydroppos select 1) + _artyposy];
	};
	
	if (_dividery == 2) then
	{
		artydroppos setPos [getPos artydroppos select 0, (getPos artydroppos select 1) - _artyposy];
	};
	
	sleep _sleeptime;
	
	_bomb = "Sh_122_HE" createVehicle (getPos artydroppos);
	
	sleep 0.25;
	
};
	


