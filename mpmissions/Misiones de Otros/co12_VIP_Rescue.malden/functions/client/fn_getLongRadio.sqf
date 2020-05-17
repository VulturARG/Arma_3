/*Classnames for different radios:

*/

_caller = _this select 1;
_backpackcontents = [];

_backpack = backpack player;
if (_backpack != "" && _backpack != "B_Parachute" ) then {
	_backpackcontents = backpackItems player;	
};

removeBackpack _caller;
_caller addBackpack "tf_rt1523g_big";

if ( _backpack != "" && _backpack != "B_Parachute" ) then {	
	clearAllItemsFromBackpack player;
	{player addItemToBackpack _x } foreach _backpackcontents;
};

systemChat "A long range radio backpack has replaced your backpack. Standby for channel configuration...";
//longe range radio channels
sleep 6; //wait for the unique ID to be assigned to the radio

[(call TFAR_fnc_activeLrRadio), 1, "50"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeLrRadio), 2, "52"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeLrRadio), 3, "54"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeLrRadio), 4, "56"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeLrRadio), 5, "58"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeLrRadio), 6, "60"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeLrRadio), 7, "62"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeLrRadio), 8, "64"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeLrRadio), 9, "30"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, 2] call TFAR_fnc_setLrStereo;
[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, 5] call TFAR_fnc_setAdditionalLrChannel;
[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, 1] call TFAR_fnc_setAdditionalLrStereo;	

systemChat "Your long range radio has been programmed.";