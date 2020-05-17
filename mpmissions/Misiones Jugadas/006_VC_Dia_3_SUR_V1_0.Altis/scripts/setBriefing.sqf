///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _situacionGeneral = ["Las exitosas recuperaciones de las ciudades realizadas por ArgA en estos dos días ha aislado la ciudad de Pyrgos y puesto nerviosos a los cabecillas del levantamiento. Están amenazando con fusilar a los líderes del gobierno de Altis, aunque todavía no han presentado demandas.
El Gobierno Provisional de Altis, siempre tuvo más de provisional que de gobierno. Pero aun así es importante organizar un rescate del mismo. La unidad AA impide cualquier maniobra helitransportada para efectuar un rescate. Para crear una via de acceso a la capital y ganar un poco de tiempo, vamos a fingir una retirada de nuestro bloqueo a Pyrgos por la carretera oeste, que une dicha ciudad con el sur de la isla. Los insurgentes están desesperados por conectar Pyrgos con las ciudades del sur.
Por la observación satelital se ha descubierto una gran aglomeración de insurgentes armados dispuestos a atacar los bloqueos norte y sur."];

private _recursos = [
"En cada defensa preparada hay una caja con municiones",
"En la casa de la Base Temporal hay cajas de municiones y suministros médicos"
];

private _enemigos = [
"Los insurgentes están armados con AK y AKM. No se esperan camionetas off-Road armadas"
];

private _objetivos = [
"Fingir una retirada de las posiciones de bloqueo sur denominadas Línea de Defensa Sur 1 (LDS1) y Línea de Defensa Sur 2 (LDS2)",
"Causar el mayor numero posible de bajas al enemigo.",
"No abandonar la posición hasta recibir la orden del AM.",
"Hacer una defensa de la Base temporal hasta recibir la orden de evacuación.",
"Evacuar hacia los botes, para regresar al Aeropuerto Internacional."
];



private _situacion = ["Nuestra sección se hará cargo de la defensa del bloqueo sur. Otra sección ArgA independiente de la nuestra, defenderá el bloqueo norte. ",
"Ha llegado el aviso que los insurgentes atacaran dentro de los próximos 15 o 20 minutos. ",
"Debemos resistir en la posición inicial hasta que el Alto Mando (AM) nos de la orden de ir a la siguiente línea de defensa. ",
"Cuando llegue esta orden hay que evacuar inmediatamente la posición hasta la próxima posición preparada. ",
"",
"Debido a que estamos en un camino entre cotas más elevadas el líder de la misión deberá evaluar si envía tropas a cubrir dichas cotas.
"];

private _info = [
"Regreso a Casa. Dia 3. Parte II. El Sur Tambien Existe",
"Carácter: No Oficial",
"Fecha: 21/05/2019",
"Horario: 0700hs",
"Clima: Lluvia y niebla",
"Ubicación: Altis"
];

private _importante = ["Todo personal que ingrese después de comenzada la misión deberá hacerlo en los slots marcados como ARGA TARDIO.
"];

private _instrucciones = ["La tableta GPS reemplaza al GPS y permite recibir órdenes directas del mando de la ONU (tareas) y enviarle reportes, ya sea por contacto radial, celular o satelital encriptado.",
"Se activa oprimiendo la letra M y muestra nuestra posición en el mapa, como así toda marca que haya hecho el Alto Mando (AM) sobre la misma.",
"Cuando se reciben ordenes del AM se escucha un Beep Beep y las nuevas ordenes aparecen en el menú Tareas. Las marcas que realicemos en ella se retransmiten al resto de las unidades. Los mensajes pueden llegar con unos segundos de diferencia en las distintas tabletas.
"];

private _editores = "|ArgA|Vultur|Sdo¹";

[_recursos, _enemigos, _objetivos, _situacion, _situacionGeneral, _info, _editores, _importante, _instrucciones] call MANDI_fnc_setBriefing;
//[_situacionHistorica, _recursos, _enemigos, _objetivos, _situacion, _info, _editores] call MANDI_fnc_setBriefing;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
