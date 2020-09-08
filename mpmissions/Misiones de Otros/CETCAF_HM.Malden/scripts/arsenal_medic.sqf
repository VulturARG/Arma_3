
arsenal_medic = [
"ACE_CableTie",
"ACE_fieldDressing",
"ACE_elasticBandage",
"ACE_quikclot",
"ACE_packingBandage",
"ACE_adenosine",
"ACE_morphine",
"ACE_epinephrine",
"ACE_surgicalKit",
"ACE_personalAidKit",

"ACE_plasmaIV",
"ACE_plasmaIV_500",
"ACE_plasmaIV_250",

"ACE_bodyBag",

"ACE_bloodIV",
"ACE_bloodIV_500",
"ACE_bloodIV_250",

"ACE_salineIV",
"ACE_salineIV_500",
"ACE_salineIV_250",

"ACE_tourniquet",
"ACE_splint"

];

[arsenal_medic_object, arsenal_medic] call ace_arsenal_fnc_addVirtualItems;
[arsenal_medic_object, arsenal_medic, true] call BIS_fnc_addVirtualBackpackCargo;
[arsenal_medic_object, arsenal_medic, true] call BIS_fnc_addVirtualItemCargo;


