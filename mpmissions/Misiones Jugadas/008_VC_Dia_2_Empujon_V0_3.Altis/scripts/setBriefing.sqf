///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _situacionGeneral = ["Hubo levantamiento a gran escala en toda la isla. ArgA sufrió ayer una emboscada de ayer con explosivos colocados en la ruta.
Si bien este ataque provocó graves pérdidas humanas y materiales no han conseguido su objetivo de borrar la presencia de la ONU, ni descabezar su comando. Los rebeldes han derribado un avión con misiles AA, por lo cual no recibiremos refuerzos en forma inmediata por via aérea. Se piensa que cuentan con pocos de ellos porque los helicópteros no han sido atacados con este tipo de arma. Parece que no consideran a nuestros helicópteros de trasporte una amenaza. Vamos a hacer que cambien de idea.

"];

private _recursos = [
"Aparecemos armados y listos para el combate.",
"Dos helicópteros en el punto de encuentro",
"Dos helicópteros en el Aeropuerto Internacional.",
"2 cajas médicas en el punto de encuentro y otra en la base Tadía.",
"1 Camión de reparación, combustible y municiones en el Aeropuerto Internacional",
"1 Camión de reparación, combustible y municiones en FOB Dorida",
"1 Camión de reparación, combustible y municiones en base Tardío",
"Los helicópteros tienen munición y suministros médicos."
];

private _enemigos = [
"Los insurgentes están armados con AK y AKM. Poseen camionetas off-Road con ametralladoras de 12.7 mm montadas en la caja.",
"No disponen de misiles AA en la zona.",
"Las patrullas en la zona rural al norte de la ciudad han sido eliminadas por los recientes combates. Se han detectado tropas en las ciudades del sur y varias camionetas off-road artilladas en dicha ubicación. Las fuerzas en dichas ciudades no son poderosas por lo que no es probable esperar contrataques de las fuerzas insurgentes de a pie luego de comenzado el asalto. No se excluye la posibilidad de que los insurgentes envíen camionetas artilladas al combate.",
"En la ciudad de Pyrgos los insurgentes han recuperado un cañón antiaéreo ZSU-23-4V, el cual usan para proteger la base. Evitar el espacio aéreo en torno a la base Pyrgos
"
];

private _objetivos = [
"Desplegar las tropas ArgA en las inmediaciones de la ciudad de Panagia, mediante una inserción por vía aérea.",
"Ocupar y mantener la ciudad hasta nuevas órdenes.",
"Se deberá mantener por lo menos un helicóptero en el aire en todo momento para dar soporte a las tropas desplegadas orbitando a una distancia prudencial de la ciudad. No es necesario que el o los helicópteros tengan más de un artillero por unidad. Si hay más de un piloto disponible luego de desembarcar las tropas, se procederá a la base Tardío donde uno de los pilotos pasará a oficiar de artillero, para luego regresar a dar apoyo a las tropas de tierra."
];



private _situacion = ["Nuestro ataque helitransportado sobre la ciudad de Charkia fue un éxito. En dos horas de intenso combate hemos capturado la ciudad y eliminado a todos los elementos insurgentes de los alrededores que convergieron a la ciudad para reforzar las defensas. ",
"Es el momento de dar un empujón más a los rebeldes. La captura de Panagia es prioridad para aliviar el asedio a la base Tardia y consolidar la ocupación del sector centro oriental de la isla.
"];

private _info = [
"Regreso a Casa, Día 2. Empujón",
"Carácter: No Oficial",
"Horario: 0645hs",
"Fecha: 20/05/2019",
"Clima: Variable",
"Ubicación: Altis"
];

private _importante = ["Todo personal que ingrese después de comenzada la misión deberá hacerlo en los slots marcados como ARGA BASE TARDIO, a no ser que sean autorizados por el Alto Mando a entrar como pilotos y operar un blackhawk.
"];

private _instrucciones = ["La tableta GPS reemplaza al GPS y permite recibir órdenes directas del mando de la ONU (tareas) y enviarle reportes, ya sea por contacto radial, celular o satelital encriptado.",
"Se activa oprimiendo la letra M y muestra nuestra posición en el mapa, como así toda marca que haya hecho el Alto Mando (AM) sobre la misma.",
"Cuando se reciben ordenes del AM se escucha un Beep Beep y las nuevas ordenes aparecen en el menú Tareas. Las marcas que realicemos en ella se retransmiten al resto de las unidades. Los mensajes pueden llegar con unos segundos de diferencia en las distintas tabletas.
"];

private _editores = "|ArgA|Vultur|Cbo";

[_recursos, _enemigos, _objetivos, _situacion, _situacionGeneral, _info, _editores, _importante, _instrucciones] call MANDI_fnc_setBriefing;
//[_situacionHistorica, _recursos, _enemigos, _objetivos, _situacion, _info, _editores] call MANDI_fnc_setBriefing;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
