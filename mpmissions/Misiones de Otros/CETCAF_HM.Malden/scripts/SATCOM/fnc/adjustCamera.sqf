private["_type","_text"];

_type = _this select 0;

if (_type == 1) then
{
ppEffectDestroy SAT_ppGrain;
};
if (_type == 2) then
{
	SAT_ppGrain = ppEffectCreate ["filmGrain",2005];
	SAT_ppGrain ppEffectEnable true;
	SAT_ppGrain ppEffectAdjust [0.02,1,1,0,1];
	SAT_ppGrain ppEffectCommit 0;
};
switch (_type) do
{
	case 3:	{true setCamUseTi 1;};
	case 4:	{true setCamUseTi 0;};
	case 5:	{true setCamUseTi 7;};
	default
	{
		false setCamUseTi 0;
		false setCamUseTi 1;
	};
};
_text = "";
switch (_type) do
{
	case 3:	{_text = "MODO B-FLIR";};
	case 4:	{_text = "MODO W-FLIR";};
	case 5:	{_text = "MODO P-FLIR";};
	default
	{
		_text = "MODO NORMAL";
	};
};
ctrlSetText [1005,_text];