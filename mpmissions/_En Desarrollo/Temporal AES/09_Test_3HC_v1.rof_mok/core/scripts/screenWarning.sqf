/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/

params [["_authorUID",[]]];

if (hasInterface && (getPlayerUID player in _authorUID || count _authorUID == 0)) then {
	private _text = "<t align='left'>";
	_text = format["%1<t color='#FF0000' align='center' size = '1'>El template básico esta desactualizado</t><br/><br/>",_text];
	_text = format["%1<t color='#ffffff' align='center' size = '1'>Actualicelo por favor</t><br/><br/>",_text];
	_text = format["%1<t color='#FF0000' align='center' size = '1'>El template básico esta desactualizado</t>",_text];
	_text = format["%1</t>",_text];

	for "_i" from 1 to 2 do {
		[_text,0,0.4,60,1,0] spawn BIS_fnc_dynamicText;
		sleep 90;
	};	
};

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/
// ["UIDs:",_authorUID,getPlayerUID player,count _authorUID] call MIV_fnc_log;