///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _situacionGeneral = ["Hubo levantamiento a gran escala en toda la isla. Por ataques fallidos, se ha determinado que los insurgentes infiltraron explosivos en las bases mediante el uso de contratistas locales, con los cuales han procedido a colocarlos en edificios y vehículos militares, para luego detonarlos remotamente en simultaneo. Debido a que ArgA no usó contratistas civiles no pudieron colocar explosivos en nuestros vehículos, por lo cual la emboscada de ayer la hicieron con explosivos colocados en la ruta.
Si bien este ataque provocó graves pérdidas humanas y materiales no han conseguido su objetivo de borrar la presencia de la ONU, ni descabezar su comando. Los rebeldes han derribado un avión con misiles AA, por lo cual no recibiremos refuerzos en forma inmediata por via aérea. Se piensa que cuentan con pocos de ellos porque los helicópteros no han sido atacados con este tipo de arma. Parece que no consideran a nuestros helicópteros de trasporte una amenaza. Vamos a hacer que cambien de idea.
"];

private _recursos = [
"4 blackhawk artillados",
"2 Cajas de suministros médicos en el Aeropuerto Internacional",
"1 Camión de reparación, combustible y municiones en el Aeropuerto Internacional",
"1 Camión de reparación, combustible y municiones en FOB Dorida",
"Arsenal limitado en FOB Dorida"
];

private _enemigos = [
"Los insurgentes están armados con AK y AKM. Poseen camionetas off-Road con ametralladoras de 12.7 mm montadas en la caja.",
"No disponen de misiles AA en la zona.",
"Además de las fuerzas insurgentes en la ciudad se han detectado patrullas en la zona rural cercana a la ciudad. Se deben esperar contrataques de las fuerzas insurgentes luego de comenzado el asalto",
"En la ciudad de Pyrgos los insurgentes han recuperado un cañón antiaéreo ZSU-23-4V, el cual usan para proteger la base. Evitar el espacio aéreo en torno a la base Pyrgos
"
];

private _objetivos = [
"Desplegar las tropas ArgA en las inmediaciones de la ciudad de Chalkeia, mediante una inserción por vía aérea.",
"El acercamiento a la ciudad se hará por el Golfo de Pyrgos hasta el corredor seguro marcado en el mapa.",
"Ocupar y mantener la ciudad hasta nuevas órdenes.",
"Se deberá mantener por lo menos un helicóptero en el aire para dar soporte a las tropas desplegadas en todo momento orbitando a una distancia prudencial de la ciudad. Se considera el circulo azul alrededor de la cuidad seguro para vuelo a baja altura. No es necesario que el o los helicópteros tengan mas de un artillero por unidad. Si hay mas de un piloto disponible luego de desembarcar las tropas, se procederá a la base temporal donde uno de los pilotos pasará a oficiar de artillero, para luego regresar a dar apoyo a las tropas de tierra. Los aliados en base temporal marcaran la LZ con humo azul y luces de helipuerto portátiles."
];



private _situacion = ["Después de los duros combates por la mañana y la calma por la tarde de ayer fuimos relocalizados en el aeropuerto internacional, con la intención que nos rearmemos con los pocos elementos disponibles. Atacaremos con las primeras luces del día ya que nuestros equipos de visión nocturna han sido destruidos con los hunvees.",
"Nuestras acciones aislaron a la capital del país, Pyrgos, pero tanto la ciudad de Dorida como la base Tardía se enfrentan a amenazas desde dos direcciones. Nuestra misión será montar un ataque helitransportado sobre la ciudad de Charkia. Las fuerzas aliadas han establecido un bloqueo del camino del este y puesto seguro en las inmediaciones de Ekali (Coord. 167100). Se ha establecido ese punto como LZ segura, para que los helicópteros se reagrupen.

"];

private _info = [
"Regreso a Casa, Día 2",
"Carácter: No Oficial",
"Horario: 0415hs",
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

private _editores = "|ArgA|Vultur|Sdo¹";

[_recursos, _enemigos, _objetivos, _situacion, _situacionGeneral, _info, _editores, _importante, _instrucciones] call MANDI_fnc_setBriefing;
//[_situacionHistorica, _recursos, _enemigos, _objetivos, _situacion, _info, _editores] call MANDI_fnc_setBriefing;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
