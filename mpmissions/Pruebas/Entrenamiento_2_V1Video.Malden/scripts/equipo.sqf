if (_this select 3 select 0)then
{
    (_this select 1) setVariable["Equipo",getUnitLoadout (_this select 1)];
    removeAllWeapons (_this select 1);
    removeGoggles (_this select 1);
    removeHeadgear (_this select 1);
    removeVest (_this select 1);
    removeUniform (_this select 1);
    removeAllAssignedItems (_this select 1);
    clearAllItemsFromBackpack (_this select 1);
    removeBackpack (_this select 1);
    (_this select 0) removeAction (_this select 2);
    (_this select 0) addAction ["<t color='#58FA82'>Cargar equipo</t>", "scripts\equipo.sqf", [false]];
}
else
{
    removeAllWeapons (_this select 1);
    removeGoggles (_this select 1);
    removeHeadgear (_this select 1);
    removeVest (_this select 1);
    removeUniform (_this select 1);
    removeAllAssignedItems (_this select 1);
    clearAllItemsFromBackpack (_this select 1);
    removeBackpack (_this select 1);
    (_this select 1) setUnitLoadout((_this select 1) getVariable["Equipo",[]]);
    (_this select 0) removeAction (_this select 2);
    (_this select 0) addAction ["<t color='#58FA82'>Guardar equipo</t>", "scripts\equipo.sqf", [true]];
};