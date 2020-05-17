private _recursos = [
"Nuestros Recursos:",
"//Base ONU:
//",
"1 M1117.",
"2 M113.",
"3 Camiones de transporte de suministros.",
"1 Camion de Logistica.",
"1 Pick Up de Ingenieros.",
"1 Transporte Ligero Jeep.",
"1 UH-1 Medevac modificado para Comandancia Aérea.",
"1 UH-1 Huey Transporte.",
"Arsenal."
];

private _enemigos = [
"
-Desconocidas."
];

private _objetivos = [
"-Despejar los almacenes o estructuras similares de la Ruta.",
"-Apoyar el FOB al Echo del pueblo.",
"-Despejar la fabrica y viejos edificios militares del sector.",
"-Distribuir recursos en iglesia de Poliakko y almacen del puerto Neochori.",
"-Limpiar el campo minado al Sierra de nuestra base.",
"*Nuestra prioridad son las vidas civiles."
];

private _situacionReal = [""];

private _extractoSinModificar = ["Perdido contacto radial con el FOB T-27 minutos"];

private _situacionHistorica = [];

private _situacion = ["Debido a nuestra anterior operación, el ejercito griego pudo aprovechar para operar mejor en la isla,
 y por ello nos prestaran ayuda para analizar la información extraída de Nikos Povlev. Mientras la información es analizada por la inteligencia de la ONU y los griegos,
 ArgA se estableció en un aerodromo, mientras un pequeño FOB griego fue emplazado al Whisky de Zaros.",
"Por la noche habitantes reportaron actividad de mucho personal armado y diferentes luces entre la fabrica y un antiguo puesto militar al Whisky del aeropuerto principal de la isla.",
"A su vez, el FOB griego reportó ser atacado momentos antes del amanecer, apoyo por medio de helicoptero fue enviado pero el mismo fue derribado y el espacio aereo del sector esta prohibido
 hasta eliminar la amenaza antiaerea, por ello se encomendo a la ONU apoyar a las unidades del FOB y una vez asegurado el espacio aereo, solicitar apoyo contra el enemigos lejanos a la población.",
"Tras estos informes se reporta que el enemigo opera utilizando empresas como fachada para almacenar armas, por ello se nos trazo una ruta para despejar
 todo almacen o estructura sospechosa de ser utilizada para este fin a lo largo de la misma. Por el conflicto regional algunas empresas poseen personal de seguridad armado,
 pero no debemos confiarnos que sea milicia enemiga disfrazada, en esta operación tenemos autoridad total para ingresar a todo establecimiento, como de desarmar cualquier civil,
 detonar cualquier almacen con armas y extraer las mismas de personal enemigo abatido.",
"Aquellas fuerzas de seguridad privada que se confirmen limpias se encuentran habilitadas para continuar su portación.",
"A su vez tenemos la tarea de dejar 2 pallets de comida y 3 de agua en la iglesia de Poliakko; 1 de comida y 3 de agua el almacen del puerto de Neochori.",
"Por último una mina el Echo de Drimea, detono un vehículo civil, se encomienda a la ONU realizar una limpieza de minas del área, sea con racimos como infanteria de ingenieros."
];

private _info = [
"Auxilium",
"Carácter: Oficial",
"Horario: 07:17 hs",
"Fecha: 22/08/2019",
"Clima: Ligeramente Despejado",
"Ubicación: Altis"
];

private _editores = "Sdo¹ Shaggy, Sdo¹ DiBoi";

[_recursos, _enemigos, _objetivos, _situacion, _extractoSinModificar, _situacionReal, _situacionHistorica, _info, _editores] call MANDI_fnc_setBriefing;

