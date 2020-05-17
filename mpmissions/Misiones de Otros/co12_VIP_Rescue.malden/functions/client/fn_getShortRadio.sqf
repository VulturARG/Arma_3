 _caller = _this select 1;

_caller addItem "tf_anprc152";
_caller assignItem "tf_anprc152";


systemChat "A short range radio has replaced your radio. Standby for channel configuration...";
//TFR set Radio Channel Frequencies
sleep 6; //wait for the unique ID to be assigned to the radio

[(call TFAR_fnc_activeSwRadio), 1, "100"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 2, "102"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 3, "104"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 4, "106"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 5, "108"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 6, "200"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 7, "202"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 8, "204"] call TFAR_fnc_SetChannelFrequency;
//[(call TFAR_fnc_activeSwRadio), 5] call TFAR_fnc_setAdditionalSwChannel;//this actually sets it to channel 6 when set to 5
[(call TFAR_fnc_ActiveSWRadio), 1] call TFAR_fnc_setSwStereo;
//[(call TFAR_fnc_ActiveSWRadio), 0] call TFAR_fnc_setAdditionalSwStereo;

systemChat "Your short range radio has been programmed.";