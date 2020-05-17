///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _situacionGeneral = ["Las exitosas recuperaciones de las ciudades realizadas por ArgA en estos dos días ha aislado la ciudad de Pyrgos y puesto nerviosos a los cabecillas del levantamiento...",
"<i>¿Como? Un momento... Esto ya lo viví. Esta misión ya la hicimos. Morimos todos defendiendo el sur. ¿Estoy loco? ¿Como puedo haber muerto si estoy escuchando el briefing?</i>"];

private _recursos = [
"En cada defensa preparada hay una caja con municiones",
"En la casa de la Base Temporal hay cajas de municiones y suministros médicos"
];

private _enemigos = [
"Los insurgentes están armados con AK y AKM. No se esperan camionetas off-Road armadas"
];

private _objetivos = [
"Defender la posición de bloqueo sur denominada Línea de Defensa Sur 1 (LDS1)",
"Causar el mayor numero posible de bajas al enemigo",
"Replegar a la posición Línea de Defensa Sur 2 (LDS2) al recibir la orden del AM. Si el líder de misión considera que las bajas son muy elevadas, puede replegar a LDS2 anticipadamente",
"Mantener LDS2 hasta recibir la orden del AM. SI a criterio del líder la situación es insostenible puede evacuar anticipadamente",
"Replegar hacia Base Temporal y defender la misma hasta recibir la orden de evacuación general",
"Evacuar hacia los botes, para regresar al Aeropuerto Internacional."
];



private _situacion = ["Nuestra sección se hará cargo de la defensa del bloqueo sur. Otra sección ArgA independiente de la nuestra, defenderá el bloqueo norte. ",
"Ha llegado el aviso que los insurgentes atacaran dentro de los próximos 15 o 20 minutos. ",
"Debemos resistir en la posición inicial hasta que el Alto Mando (AM) nos de la orden de ir a la siguiente línea de defensa. ",
"Cuando llegue esta orden hay que evacuar inmediatamente la posición hasta la próxima posición preparada. ",
"",
" Debido a que estamos en un camino entre cotas más elevadas es fundamental enviar tropas a cubrir dichas cotas, sin descuidar el centro.
"];

private _info = [
"Regreso a Casa. Dia 3. Parte II. Deja Vu",
"Carácter: No Oficial",
"Fecha: 21/05/2019",
"Horario: 0700hs",
"Clima: Lluvia y niebla",
"Ubicación: Altis"
];

private _importante = ["Todo personal que ingrese después de comenzada la misión deberá hacerlo en los slots marcados como USAR SOLO SI SE INGRESA CON LA MISION INICIADA.
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
