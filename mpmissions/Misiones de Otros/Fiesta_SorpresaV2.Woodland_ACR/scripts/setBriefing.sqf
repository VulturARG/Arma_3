private _recursos = [
"Nuestros Recursos:",
"2 UH-1 Huey; 1 Artillado y 1 Médevac.",
"2 Humvees.",
"1 AAV-7A1.",
"1 Camión de logística.",
"1 Lancha rapida.",
"Arsenal.",

"//Base improvisada de Mogilevka://",
"1 M113 .50.",
"4 Humvees."
];

private _enemigos = [
"
- Desconocidas."
];

private _objetivos = [
"Extraer al ministro de defensa [Mike]."
];

private _situacionReal = [""];

private _extractoSinModificar = [""];

private _situacionHistorica = ["Como parte de diversos tratados diplomaticos y comerciales entre Argentina y Ucrania,
 se encomendo a ArgA prestar apoyo en capacitación de las fuerzas terrestres ucranianas. para ello se nos cedió un sector del puerto de Elektrozavodsk.",
"Recientemente estalló un conflicto armado por operaciones de una guerrilla autodenominada Zersk, la cual pretende un territorio propio
 anexando territorio tanto de Bielorrusia como de Ucrania, esta guerrilla esta muy fuertemente armada tanto con equipo de la guerra fría como
 armamento sospechosamente moderno, permitiéndose llegar a ocupar distintos territorios a un lado y otro de la frontera,
 pero la pericia de los combate destaca la falta de una comunicación de radio coordinada de la misma, operando mayormente con medios locales.
Propio a nuestro sector, a 4km al Norte, algunas poblaciones partidarias a la guerrilla ya están en manos de la misma,
 pero el avance hacia nuestra dirección se ve impedido de puestos del ejercito ucraniano."
];

private _situacion = [
"El ministro de defensa Ucraniano se reunió en secreto con autoridades locales de la capital regiones Chernigov/Chernogorsk [Charlie].
 Paralelo a esto un avance por el Oeste sorpresa de la guerrilla llego a capturar la ciudad y diferentes territorios, el estado del ministro es desconocido
 pero se informo del avistamiento de uno de los cabecillas de la guerrilla, Gravas Rospichtik [Golf] en la ciudad, el cual normalmente opera en las localidades Lima, Oscar o Papa.
 A su vez el ejercito ucraniano saturado por este avance sólo pudo contenerlo en la base improvisada de Mogilevka, no se descarta otro ataque.
 Ante este marco se encomendó un permiso total a ArgA para participar del rescate del Ministro y su personal.",
"Para ejecutar esta operación se nos trazo un camino para sorprender al enemigo y atacarlo por la retaguardia de su avance ya que avanzadillas del mismo
 estableció bloqueos al Echo de Charlie. Yaguarete Usara el AAV-7 para rodear el rió e ingresar por el SO de Charlie mientras que en paralelo Condor debe eliminar
 la planta transformadora en su ramal Sur de las coordenadas 002 021, para ello desplegará en los UH-1 un asalto al mismo para impedir la comunicación enemiga hacia el afuera de Charlie,
 y luego asaltara en paralelo la misma, en la visita el ministro tenia asignado visitar el edificio de bomberos, el municipio y las oficinas de inteligencia del ejercito. ",
"Debemos recordar que la mayoria de nuestros vehículos de tierra se encuentran en la base improvisada de Mogilevka."
];

private _info = [
"Fiesta Sorpresa",
"Carácter: No Oficial",
"Horario: 12:20 hs",
"Fecha: 21/08/2019",
"Clima: Despejado",
"Ubicación: Frontera norte de Ucrania con Bielorusia y Rusia, 150 km al N.E. de Kiev."
];

private _imagenes = 
"Fotografias de Mike y Golf"
;

private _editores = "Sdo¹ Shaggy"
;

[_recursos, _enemigos, _objetivos, _situacion, _extractoSinModificar, _situacionReal, _situacionHistorica, _info, _imagenes, _editores] call MANDI_fnc_setBriefing;

