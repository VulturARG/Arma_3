/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params [["_missionState", "mission_end"]];

if (!(call MIV_fnc_isLogSystemEnabled)) exitWith { };

private ["_query", "_values"];

_query = "INSERT INTO log (`log_type_id`, `mission_name`, `mission_time`, `server_name`) VALUES";

_values = format [
	"((SELECT id from log_type WHERE name = '%1'), '%2', %3, '%4');",
	_missionState,
	missionName,
	time,
	serverName
];

_query = [_query, _values] joinString " ";

_query execVM "scripts\db\connect_db.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/