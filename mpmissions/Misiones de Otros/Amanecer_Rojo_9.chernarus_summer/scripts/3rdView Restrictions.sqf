if (difficultyOption "thirdPersonView" == 1) then
{
    while {(false)} do
    {
        if (cameraView == "External") then
        {
            player switchCamera "Internal";
        };
        sleep 0.1;
    };
};