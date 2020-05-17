if (profileName == "|ArgA|Zepp|Cmd")then
{
  player setVariable["Saved_Loadout",getUnitLoadout player];
}
else
{
  removeGoggles player;
  player setVariable["Saved_Loadout",getUnitLoadout player];
};
