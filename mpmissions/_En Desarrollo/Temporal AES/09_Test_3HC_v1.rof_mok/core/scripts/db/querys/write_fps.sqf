/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

params [["_logType", "info"], "_sourcestr", "_fps", "_localgroups", "_localunits","_totalunits","_humanPlayers"];

if (!(call MIV_fnc_isLogSystemEnabled)) exitWith { };

if (isNil "_sourcestr") exitWith { };

private ["_query", "_values"];

_query = "INSERT INTO fps (`log_type_id`,`source`, `fps`, `local_groups`, `local_units`, `total_units`, `players`, `mission_name`, `server_name`) VALUES";

_values = format [
	"((SELECT id from log_type WHERE name = '%1'), '%2', %3, %4, %5, %6, '%7', '%8', '%9');",
	_logType,
	_sourcestr,
	_fps,
	_localgroups,
	_localunits,
	_totalunits,
	_humanPlayers,
	missionName,
	serverName
];

_query = [_query, _values] joinString " ";

_query execVM "core\scripts\db\connect_db.sqf";

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

