Minas =
{
  _mina = createVehicle ["R_80mm_HE", (getMarkerPos (_this select 0)),[],0,"NONE"];
  _mina setDamage 1;
  //"M_RPG32_AA_F" createVehicle (getMarkerPos (_this select 0));
};

switch ((_this select 0)) do
{
    case (1):
    {
      ["marker_133"] call Minas;
      sleep 0.5;
      ["marker_132"] call Minas;
    };
    case (2):
    {
      ["marker_135"] call Minas;
      sleep 1;
      ["marker_134"] call Minas;
    };
    case (3):
    {
      ["marker_136"] call Minas;
      sleep 0.2;
      ["marker_137"] call Minas;
    };
    case (4):
    {
      ["marker_138"] call Minas;
      sleep 0.7;
      ["marker_139"] call Minas;
    };
};
