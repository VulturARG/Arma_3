///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _situacionGeneral = [
"La invasión de la parte oriental de la isla de Atlis se mantiene estable desde hace un tiempo. Después de la captura de Pyrgos por parte del enemigo los aliados lograron detener el avance enemigo y confinarlo en la parte suroriental de la isla. El enemigo ha perdido su capacidad de ataque aéreo y su artillería AA es limitada, aunque mantiene un gran número de tropas la cual es refrenada por nuestra superioridad aérea. Nuestra inferioridad numérica ha hecho que la situación sea caiga en un impasse."
];

private _recursos = [
"4 UH-60 Black Hawk",
"Arsenal virtual",
"Cajas médicas"
];

private _enemigos = [
"Soldados, número desconocido",
"Camionetas artilladas",
"ZSU-23-4 en Pyrgos"
];

private _objetivos = [
"Rescatar la inteligencia escondida",
"Abandonar la zona enemiga antes de los 30 minutos de nuestra llegada"
];

private _situacion = [
"Un desertor que trabajaba en el cuartel general enemigo ocultó en un edificio abandonado, detrás de una pila de basura, importante información sobre los planes y capacidades del enemigo, en la ciudad de Chalkeia. Por una cantidad insana de billetes, nos ha dado la ubicación del lugar donde fue escondida esa información.
La Fuerza Aérea a destruido las defensas antiaéreas de la ciudad de Chalkeia y creado un corredor de acceso seguro para la fuerza helitransportada. El enemigo está tratando de reponer las AA, pero no podrá hacerlo rápidamente. Debido a la distancia a la línea del frente y la cantidad de tropas enemigas en esta, no se podrá desplegar tropa mecanizada para reforzar o evacuar la misión. Existe en este momento una ventana de oportunidad que no durará mucho tiempo para un asalto helitransportado. El poblado esta defendido actualmente por una gran cantidad de milicianos escasamente entrenados y pobremente armados. En Pyrgos existe un asentamiento de fuerzas regulares y de élite, fuertemente armados. Se debe extraer la información antes de la llegada de los mismos o nuestras fuerzas serán superadas en número y posiblemente destruidas.
"];

private _info = [
"Entrenamiento Aerotransportado",
"Carácter: Entrenamiento",
"Horario: 1500hs",
"Fecha: 24/06/2019",
"Clima: Despajado",
"Ubicación: Altis"
];

private _extractoSinModificar = [];

private _situacionReal = [];

private _editores = ["|ArgA|Vultur|Sdo¹"];

[_recursos, _enemigos, _objetivos, _situacion, _situacionGeneral, _info, _editores] call MANDI_fnc_setBriefing;
//[_situacionHistorica, _recursos, _enemigos, _objetivos, _situacion, _info, _editores] call MANDI_fnc_setBriefing;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
