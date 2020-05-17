///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _situacionHistorica = ["El 27 de junio de 1976, el vuelo 139 de Air France, procedente de Tel Aviv, Israel, que trasportaba 248 pasajeros y 12 tripulantes, despegó de Atenas con rumbo a París. Poco después de las 12:30 pm, el avión fue secuestrado por dos palestinos del Frente Popular para la Liberación de Palestina y dos alemanes de las Células Revolucionarias alemanas. Los secuestradores desviaron el avión hacia Bengasi, Libia. Allí permaneció por espacio de siete horas para aprovisionarse de combustible, y partio hacia Entebbe en Uganda.
En Entebbe, a los cuatro secuestradores se unieron por lo menos otros cuatro apoyados por las fuerzas pro-palestinas del presidente de Uganda, Idi Amin. El grupo exigió la liberación de cuarenta palestinos detenidos en Israel y otros trece encarcelados en Kenia, Francia, Suiza y Alemania Occidental. Amenazaron con que, si sus demandas no se hacían efectivas, empezarían a matar rehenes el 1 de julio siguiente. Los secuestradores dividieron los secuestrados en dos grupos: ciudadanos israelíes junto a los judíos no israelíes por un lado y el resto por el otro. Los mantuvieron por una semana en la sala de tránsito del Aeropuerto de Entebbe. Algunos rehenes fueron liberados, pero 105 pasajeros israelíes y judíos no israelíes permanecieron cautivos. Los secuestradores persistían con la amenaza de asesinarlos si el estado de Israel no accedía a sus exigencias. Israel manifestó su intención de cumplir con lo pedido por los terroristas y estos cambiaron la fecha limite para el 4 de julio de 1976.
"];

private _recursos = [
"4 C-130",
"1 auto civil",
"3 Land Rover civiles (Último ambulancia)",
"2 APC de origen soviético",
"AK-74 con mira de hierro",
"PKM con mira de hierro",
"4 radios (Lideres y Sublideres)",
"Munición en los vehículos",
"2 Cajas de suministros médicos",
"Mapas obsoletos. Hubo demoliciones de edificios y construcción de otros"
];

private _enemigos = [
"8 Terroristas",
"Soldados Ugandeses, número desconocido"
];

private _objetivos = [
"Simular un convoy de Idi Amin siguiendo las flechas hasta la aerostación civil (Condor)",
"Despejar la zona de los edificios de la terminal (Condor)",
"Mantener el área segura hasta la llegada de Yaguareté (Condor)",
"Reforzar a Condor en terminal (Yaguareté)",
"Atacar y neutralizar la torre de control",
"Eliminar toda amenaza a la operación",
"Evacuar a los rehenes hasta los C-130",
"Destruir el escuadrón de aviones de combate"
];



private _situacion = ["Después de un viaje de 4000 km los C130 han aterrizado y estacionado en una de las cabeceras de la pista, sin haber alertado a las tropas enemigas. Se descargaron los vehículos transportados. Para no levantar sospechas se usan uniformes similares a los del ejercito ugandés y AK-47. Cóndor simulará ser Idi Amin con sus escoltas para llegar sin levantar sospechas a la terminal. Yaguareté reforzará a Condor. Deberá llegar 7 minutos después del comienzo del tiroteo para simular el tiempo que tardó en llegar el segundo avión con los refuerzos
"];

private _info = [
"Rescate en Entebbe",
"Carácter: No Oficial",
"Horario: 2300hs",
"Fecha: 04/07/1976",
"Clima: Despajado",
"Ubicación: Entebbe, Uganda (Bukovina)"
];

private _editores = "|ArgA|Vultur|Sdo";

[_recursos, _enemigos, _objetivos, _situacion, _situacionHistorica, _info, _editores] call MANDI_fnc_setBriefing;
//[_situacionHistorica, _recursos, _enemigos, _objetivos, _situacion, _info, _editores] call MANDI_fnc_setBriefing;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
