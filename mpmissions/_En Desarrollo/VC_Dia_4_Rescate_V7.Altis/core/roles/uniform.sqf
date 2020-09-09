/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/

private _allowGPS = getMissionConfigValue ["COLOCAR_GPS",  1] == 1;

_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_IR_Strobe_Item";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_Flashlight_XL50";
for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_tourniquet";};
for "_i" from 1 to 3 do {_unit addItemToUniform "adv_aceSplint_splint";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_epinephrine";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_CableTie";};

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ACE_Altimeter";
if (_allowGPS) then {
    _unit linkItem "ItemGPS";
};


/*******************************************************************************
                             Realizado por |ArgA|MIV
*******************************************************************************/
