FAM_civilesEnfermos = allVariables missionNamespace select {_x find "civil_herido" == 0};
FAM_civilesEnfermos = FAM_civilesEnfermos apply {missionNameSpace getVariable _x};

FAM_civilesEnfermos apply {
    _x switchMove "Acts_CivilInjuredChest_1";  
};