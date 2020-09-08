//create UI event keyspressed
disableSerialization;

sleep 0.1;

SAT_keyEventHandler = (findDisplay 1000) displayAddEventHandler ["KeyDown","_this call SAT_keyEventFunction"];
SAT_mouseWheelEventHandler = (findDisplay 1000) displayAddEventHandler ["MouseZChanged","_this call SAT_mouseZChanged"];