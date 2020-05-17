//Declarando uniforme completo de BLUFOR

//uniforme
FAM_uniformeBLUFOR = "rhs_uniform_g3_m81";
FAM_cascoBLUFOR = "rhsusf_ach_helmet_M81";


player addEventHandler ["Take", {
	params ["_unit", "_container", "_item"];

    if (FAM_descubierto)exitWith {};

    if ((uniform player != FAM_uniformeBLUFOR) AND 
        (headgear player != FAM_cascoBLUFOR) AND  
        (vest player == "")) then{
            player setCaptive true;
    }else{
        player setCaptive false;
    };
}];

player addEventHandler ["Put", {
	params ["_unit", "_container", "_item"];

    if (FAM_descubierto)exitWith {};

    if ((uniform player != FAM_uniformeBLUFOR) AND 
        (headgear player != FAM_cascoBLUFOR) AND  
        (vest player == "") AND 
        (goggles player != "")) then{
            player setCaptive true;
    }else{
        player setCaptive false;

    };
}];

