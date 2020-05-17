/*
	terceraPersona.sqf
	
	Descripción:
	Restringe el tipo de cámara del jugador en caso que éste no tenga la configuración
    de dificultad correcta.

	Parámetros:
    --
	Retorna:
	--
*/

if (difficultyOption "thirdPersonView" == 1) then
{
    while {(true)} do
    {
        if (cameraView == "External") then
        {
            player switchCamera "Internal";
        };
        sleep 0.1;
    };
};