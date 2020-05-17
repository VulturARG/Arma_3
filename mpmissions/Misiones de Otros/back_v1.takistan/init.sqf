///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _distanciaVision = 5000;

setViewDistance _distanciaVision;

[] execVM "scripts\civiles.sqf";

private _recursos = [
"Aparecemos Armados",
"3 CGR CAT1 A2 (M2)",
"1 CGR CAT1 A2 (MK19)",
"2 CRG CAT1 A2 (Unarmed)",
"1 M1230 A1 (Medevac)",
"Cajas de munición",
"Cajas con elementos médicos"
];

private _enemigos = [
"Guerrilleros",
"Vehículos ligeros",
"Vehículos medios"
];

private _objetivos = [
"Desplazar a los insurgentes",
"<marker name = 'o1'>Pueblo 1</marker>",
"<marker name = 'o2'>Pueblo 2</marker>",
"<marker name = 'o3'>Pueblo 3</marker>",
"<marker name = 'o4'>Pueblo 4</marker>"
];

//private _situacionReal = ["India se encuentra en un gran problema socioeconómico, producto de una mala administración de las tierras y recursos luego de la independización.
//Uno de estos problemas es una organización guerrillera llamados los naxalitas, un grupo insurgente que se apoderó de tierras, principalmente en la selva hace ya tiempo en la India, comenzaron como una revolución maoísta. Hoy en dia es un complejo sistema revolucionario el cual tiene gran poder militar y económico. Ya que controla las principales zonas de extracción de carbón y otros minerales en India.
//El estado no está pudiendo lidiar con el problema, se liberan batallas sangrientas y asaltos a aldeas indefensas, principalmente las que son habitadas por pueblos originarios, como los Adivasis.
//"];

//private _extractoSinModificar = ["
//Por mucha fuerza que les proporcionaran las reivindicaciones sociales legítimas, sin duda se mantenía el terror que los naxalitas podían inspirar. La brutalidad de su guerra se reveló una mañana de primavera en Chhattisgarh. Me interné en el sur del estado, cerca de la ciudad de Bijapur, en seguimiento de un informe vago de la policía acerca de un ataque maoísta a una aldea adivasi. Al hacer un alto en Kutru, aldea en las faldas de Abujmarh, mire a través de la selva hacia el punto donde la //carretera, que ya no era más que surcos descagastados, finalmente se angostaba y dividía para diluirse en una media docena de senderos antes de desaparecer en el verde.
//"];

//private _situacionHistorica = ["Al parecer el ejercito hindu se dio cuenta que hicimos una copia de la informacion obtenida en la misión anterior en la mina de cielo abierto.
//El ejercito hindu capturo al alto mando ArgA y los tienen alguna prisión clandestina, en donde planean ejecutarlos a las 0900hs. El capitán que rescatamos nos concedió las ubicaciones de ambas, una se encuentra en el poblado de Tanouka y la otra en Oil Rig.
//"];

private _situacion = ["En los últimos meses se ha detectado actividad insurgente en los pueblos cercanos a la planta tratadora de petroleo.
Por lo que se dio orden de evacuación a los habitantes para poder hacer incursiones y desplazar a los insurgentes de los pueblos.
Debido a la orden de evacuación toda persona que se encuentre en los pueblos es considerada un posible hostil."];

private _info = [
"Nombre de la misión: I'm Back",
"Carácter: No Oficial",
"Horario: 0530hs",
"Fecha: 11/04/2019",
"Clima: Despejado",
"Ubicación: Takistan"
];

[_recursos, _enemigos, _objetivos, _situacion, _extractoSinModificar, _situacionReal, _situacionHistorica, _info] call MANDI_fnc_setBriefing;

setTerrainGrid 40;

if(hasInterface)then{
  removeGoggles player;
  player addGoggles "rhsusf_shemagh2_gogg_od";
  null = [_distanciaVision, 800] execVM "scripts\dist_vis.sqf";
  [] execVM "scripts\3rdView Restrictions.sqf";
  waitUntil {time > 0};
  null = [] execVM "scripts\intro.sqf";
};

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
