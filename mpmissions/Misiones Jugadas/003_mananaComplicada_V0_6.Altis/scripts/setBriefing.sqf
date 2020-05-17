///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _situacionGeneral = ["Durante la “supuestamente” última misión de ArgA en Altis, se desató una rebelión en toda la isla. Grupos insurgentes atacaron instalaciones militares y policiales. El convoy realizado en conjunto con otras fuerzas de la ONU, fue atacado. Se pudo repeler el ataque, aunque la fuerza aliada no sobrevivió. El Alto Mando (AM) informó de este ataque por radio y dio instrucciones por el sistema de tabletaGPS de comprobar el estatus de la base Pyrgos. Esta sufrió un ataque a gran escala y se encuentra prácticamente destruida en poder del enemigo. Luego el AM ordenó tomar por asalto el FOB Dorida y limpiar la ciudad.
"];

private _recursos = [
"Armamento que salvamos de la emboscada",
"Arsenal limitado de municiones y explosivos",
"Cajas de suministros médicos",
"Vehículos civiles abandonados"
];

private _enemigos = [
"Hasta el momento nos hemos encontrado con insurgentes armados con AK y AKM. No hemos visto que usen vehículos, excepto los destruidos en su ataque a la base. No hay indicios que hayan capturado vehículos militares."
];

private _objetivos = [
"Desplegarse hacia la ciudad de Charkia.",
"Evitar acercarse a la Base Pyrgos o la carretera principal costera del oeste.",
"Asaltar Charkia, eliminando toda oposición",
"Mantener la posición hasta nuevas órdenes."
];



private _situacion = ["Hemos asaltado y tomado el FOB Dorida y limpiado el pueblo. La población civil parece haber evacuado la ciudad. Completamos la orden de minar el puente objetivo y nos preparamos para evacuar la base.
"];

private _info = [
"Regreso a Casa. Una mañana complicada",
"Carácter: No Oficial",
"Horario: 1030hs",
"Fecha: 19/05/2019",
"Clima: Variable",
"Ubicación: Altis"
];

private _instrucciones = ["La tableta GPS reemplaza al GPS y permite recibir órdenes directas del mando de la ONU (tareas) y enviarle reportes, ya sea por contacto radial, celular o satelital encriptado.",
"Se activa oprimiendo la letra M y muestra nuestra posición en el mapa, como así toda marca que haya hecho el Alto Mando (AM) sobre la misma.",
"Cuando se reciben ordenes del AM se escucha una serie de Beeps. Las ordenes aparecen en el menú Tareas. Las marcas que realicemos en ella se retransmiten al resto de las unidades. Los mensajes pueden llegar con unos segundos de diferencia en las distintas tabletas.
"];

private _editores = "|ArgA|Vultur|Sdo¹";

[_recursos, _enemigos, _objetivos, _situacion, _situacionGeneral, _info, _editores, _instrucciones] call MANDI_fnc_setBriefing;
//[_situacionHistorica, _recursos, _enemigos, _objetivos, _situacion, _info, _editores] call MANDI_fnc_setBriefing;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
