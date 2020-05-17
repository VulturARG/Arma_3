///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _distanciaVision = 5000;

setViewDistance _distanciaVision;

setTerrainGrid 40;

nopop = true;
m = false;
m2 = false;
publicVariable "m";
publicVariable "m2";

comp = "|ArgA|ZePp|Cte";
publicVariable "comp";

if(hasInterface)then{
  removeGoggles player;
  null = [_distanciaVision, 800] execVM "scripts\dist_vis.sqf";
  [] execVM "scripts\3rdView Restrictions.sqf";
  null = [] execVM "scripts\intro.sqf";
};

bandera addAction ["<t color='#819FF7'>Himno</t> <t color='#FFFFFF'>nacional</t> <t color='#819FF7'>argentino</t>",
{
    if (!m)then
    {
        "sonido2" remoteExec ["playSound", -2];
        m = true;
        publicVariable "m";
        sleep 60;
        m = false;
        publicVariable "m";
    };
 }];

 bandera_1 addAction ["<t color='#60D292'>Tocar trompeta</t>",
 	{
 	    if (!m2)then
 	    {
 	        "sonido1" remoteExec ["playSound", -2];
 	        m2 = true;
 	        publicVariable "m2";
 	        sleep 14;
 	        m2 = false;
 	        publicVariable "m2";
 	    };
 	 }];

/*   uniforme = "arga_u_marpatw";
   chaleco = "arga_c_marpatw";
   casco = "arga_cas_marpatw";
   mochila = "arga_m_marpatw_p";

   rol addAction ["<t color='#64D66A'>Fusilero</t>", "scripts\roles.sqf", "Fusilero"];
   rol addAction ["<t color='#64D66A'>Granadero</t>", "scripts\roles.sqf", "Granadero"];
   rol addAction ["<t color='#64D66A'>Medico</t>", "scripts\roles.sqf", "Medico"];
   rol addAction ["<t color='#64D66A'>Ametrallador M240B</t>", "scripts\roles.sqf", "M240B"];
   rol addAction ["<t color='#64D66A'>Ametrallador M249</t>", "scripts\roles.sqf", "M249"];
   rol addAction ["<t color='#64D66A'>Fusilero AT</t>", "scripts\roles.sqf", "AT"];
   rol addAction ["<t color='#64D66A'>Tirador</t>", "scripts\roles.sqf", "Tirador"];
   rol addAction ["<t color='#64D66A'>Piloto helicoptero</t>", "scripts\roles.sqf", "Helicoptero"];
   rol addAction ["<t color='#64D66A'>Experto en explosivos</t>", "scripts\roles.sqf", "Experto"];

   stand addAction ["<t color='#5882FA'>Levantar Blancos</t>", { ["marker_8","cdm_fnc_popupTarget"] call BIS_fnc_MP; }];
   stand_1 addAction ["<t color='#5882FA'>Levantar Blancos</t>", { ["marker_6","cdm_fnc_popupTarget"] call BIS_fnc_MP; }];*/
///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
