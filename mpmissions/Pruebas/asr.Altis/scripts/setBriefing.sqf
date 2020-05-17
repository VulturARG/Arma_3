///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _situacionGeneral = ["Durante seis meses ArgA a estado a las órdenes del comando Suroriental de las fuerzas de paz de la ONU en Altis. Nuestra misión ha transcurrido sin mayores inconvenientes durante todo el período de despliegue. Como parte del calendario de rotación de tropas de los diferentes países que han acordado desplegar tropas en la isla, la estancia de ArgA en Altis toca a su fin.",
"Dado que ArgA llegó cuando la insurgencia civil había terminado no hemos estado involucrados en combates. La ONU nos ha tenido estas ultimas semanas probando su nueva tableta GPS de combate, la cual reemplazará uso del mapa en un futuro. Por nuestra ayuda en las pruebas de las mismas la ONU nos ha cedido las tabletas que probamos para usarlas en nuestras tareas en las fuerzas de paz.
"];

private _recursos = [
"4 Humvees artillados",
"3 Humvees de transporte con capacidad médica",
"2 cajas de suministros médicos",
"GPS convencionales solamente en los vehiculos"
];

private _enemigos = [
"Desde hace varios meses atrás no hubo actividad de insurgentes. Inteligencia de la ONU no prevé amenazas. En nuestros patrullajes no encontramos inconvenientes, pero en las ultimas semanas hemos visto a la distancia hombres armados que rápidamente se alejaban de nosotros. Podrían ser cazadores, pero la conducta es sospechosa."
];

private _objetivos = [
"Realizar una patrulla con nuestros vehículos desde la Base Aeroclub hasta la Base Tardío.",
"Recoger personal en dicha base con destino a Pyrgos o el aeropuerto internacional, si lo hubiera.",
"Continuar la patrulla cubriendo el camino rural entre Panagia y la base militar en Pyrgos, detras de un convoy de la ONU.",
"Este comenzará la marcha cuando nos situemos detras del mismo. Se deberá ir por lo menos 50 m por detrás del convoy de la ONU, sin adelantarlo nunca, ni perderlo de vista. En caso que alguna unidad de la ONU tenga algún inconveniente, se le ayudará a reanudar la marcha.",
"Continuar la patrulla desde la base Pyrgos por la carretera principal hacia el Aeropuerto Internacional."
];



private _situacion = ["Hemos empacado y enviado el grueso de nuestra logística a la base de la ONU ubicada en el Aeropuerto Internacional de Altis. Se embarcará inmediatamente en los vehículos y se procederá a realizar una patrulla hasta la Base Tardío (203097) según el camino indicado por mando.",
"En la Base Tardío se recogerá a otro personal que esté en transito hacia el aeropuerto internacional y nos uniremos a un convoy de la ONU con destino a la base militar en Pyrgos.",
"Debemos seguir al convoy hasta dicha base por el camino rural que une dicha ciudad con Panagia y luego continuar por carretera al Aeropuerto Internacional donde embarcaremos de regreso a Argentina.
"];

private _info = [
"Regreso a Casa",
"Carácter: No Oficial",
"Horario: 0700hs",
"Fecha: 20/05/2019",
"Clima: Variable",
"Ubicación: Altis"
];

private _importante = ["Todo personal que ingrese después de comenzada la misión deberá hacerlo en los slots marcados como ARGA TARDIO.
"];

private _instrucciones = ["La tableta GPS reemplaza al GPS y permite recibir órdenes directas del mando de la ONU (tareas) y enviarle reportes, ya sea por contacto radial, celular o satelital encriptado.",
"Se activa oprimiendo la letra M y muestra nuestra posición en el mapa, como así toda marca que haya hecho el Alto Mando (AM) sobre la misma.",
"Cuando se reciben ordenes del AM se escucha una serie de Beeps. Las ordenes aparecen en el menú Tareas. Las marcas que realicemos en ella se retransmiten al resto de las unidades. Los mensajes pueden llegar con unos segundos de diferencia en las distintas tabletas.
"];

private _editores = "|ArgA|Vultur|Sdo¹";

[_recursos, _enemigos, _objetivos, _situacion, _situacionGeneral, _info, _editores, _importante, _instrucciones] call MANDI_fnc_setBriefing;
//[_situacionHistorica, _recursos, _enemigos, _objetivos, _situacion, _info, _editores] call MANDI_fnc_setBriefing;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
