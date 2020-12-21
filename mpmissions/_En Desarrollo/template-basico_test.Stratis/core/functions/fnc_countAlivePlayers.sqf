/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

private _headlessClients = entities "HeadlessClient_F"; 
private _aliveHumanPlayers = (allPlayers select {alive _x}) - _headlessClients;

count _aliveHumanPlayers

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/