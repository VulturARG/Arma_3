/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params [["_missionState", "mission_end"]];

private ["_query", "_values"];

_query = "INSERT INTO log (`log_type_id`, `mission_name`, `mission_time`) VALUES";

_values = format [
	"((SELECT id from log_type WHERE name = '%1'), '%2', %3);",
	_missionState,
	missionName,
	time
];

_query = [_query, _values] joinString " ";

_query execVM "scripts\db\connect_db.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/