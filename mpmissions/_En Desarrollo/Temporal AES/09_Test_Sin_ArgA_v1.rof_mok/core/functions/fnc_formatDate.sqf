/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

/*
	Recibe una fecha del formato: [2020,7,12]
	Devuelve una string con el formato: "2020-07-12"

	Recibe una fecha del formato: [2020,7,12,19,59,5]
	Devuelve una string con el formato: "2020-07-12 19:48:22"
*/
params [["_date",""]];

if (count _date == 0) exitWith { "" };

if (count _date == 3) exitWith {
	private _format = ["%1-%2-%3"];
	_format append _date;
	_date = format _format;
	_date
};

if (count _date == 6) exitWith {
	private _format = ["%1-%2-%3 %4:%5:%6"];
	_format append _date;
	_date = format _format;
	_date
};

"";

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/