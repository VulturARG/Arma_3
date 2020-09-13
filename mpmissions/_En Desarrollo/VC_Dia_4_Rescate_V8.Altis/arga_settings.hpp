/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

#define NAME "Regreso a Casa-D4-Rescate"            // Colocar nombre de mision
#define COMPLETE_NAME "Regreso a Casa-D4-Rescate v8"// Nombre y versión de la misión
#define IMAGE "imgs\portada.jpg"                    // Colocar nombre y extension de la imagen de portada, ej "imgs\portada.jpg"
#define DESCRIPTION "Toco y me voy..."              // Colocar descripcion de la mision entre las comillas

author = "|ArgA|Vultur|Cbo¹";                       // Editor (Pone tu nombre)
IMG_LOGO = "imgs\PlacaVulturII.paa";                // Nota: Las imagenes deberian estar en
COLOR_AUTOR = "#76a8f7";                            // formato .paa y en proporcion 2x1 (1024x512)
ES_CAMPANIA = 0;                                    // tamaño logo: 323px x 323px
NOMBRE_CAMPANIA = "";
INTRO_PERSONALIZADA = 0;                            // 1 Si la deseas cargar una intro personalizada (propia)
                                                    // y en el parametro INTRO la dirección del archivo entre comillas
                                                    // EJ. INTRO_PERSONALIZADA = 1; INTRO = "scripts\intro_propia.sqf";
INTRO = 2;                                          // Intros: 1 y 2. Para desactivar: 0

MAX_DIST_VISION = 2500;
MIN_DIST_VISION = 800;                              // Distancia de visión reducida por marcador
DESACTIVAR_EQUIPAMIENTO_PERSONALIZADO = 1;          // Equipamiento guardado en arsenal virtual. 0: activado, 1: desactivado
ACTIVAR_COMPUTADORA_ARTILLERIA = 1;                 // Habilita computadora artilleria poner 1. Para que no aparezca poner 0
ACTIVAR_ROL_AUTOMATICO = 1;                         // Habilita la carga de rol al entrar a la misión por descripción de rol
                                                    // Para verificar que los roles estan bien escritos activar todas las IAs y entrar
COLOCAR_GPS = 0;                                    // Agrega GPS vanilla en rol automático o caja. 1: agrega, 0: remueve

ACTIVAR_INSIGNIA_AUTOMATICO = 0;                    // Añadir a arga_settings
INSIGNIA_IR = 0;                                    // Establece si las insignias son IR o normales

ACTIVAR_SETUP_PERSONALIZADO_RADIOS = 1;             // Activa el setup de las radios de ACRE2. 1: activado, 0: desactivado


/* 
EQUIPAMIENTO
    Camuflajes disponibles:          Tipos disponibles:
       - Bosque                        - Multicam 
       - Desierto                      - Marpat
       - Selva                         - Liso
       - Negro

       - Personalizado (se debe ingresar mas abajo la clase del uniforme, chaleco, casco y mochila)
       - No editar (no se le modificara ninguna de las 4 cosas al jugador, solo arma y equipo interno)

         Las opciones Personalizada y No editar pueden llevar a comportamientos inesperados.
         Por lo que el editor queda a cargo de checkear y revisar el correcto funcionamiento.
*/
CAMUFLAJE = ["Bosque", "Multicam"];
GAFAS_INICIALES = "";
UNIFORME_PERSONALIZADO = "";
CASCO_PERSONALIZADO = "";
CHALECO_PERSONALIZADO = "";
MOCHILA_PERSONALIZADO = "";
MOCHILA_CHICA_PERSONALIZADO = "";
////////////////////////////////////////////////////////////////////////////////

/* 
BRIEFING
    Cada elemento del array es un parrafo
    Ejemplo: ["Primer parrafo", "Segundo parrafo"] 
*/
ACTIVAR_BRIEFING = 1;
CARACTER = "No Oficial";
HORARIO = "0330";
FECHA = "21 de mayo de 2019";
CLIMA = "Despejado";
UBICACION = "Altis";
SITUACION = ["Debemos rescatar a las autoridades legales que se encuentran como rehenes en la ciudad de Pyrgos.","Para eso se infiltrará un equipo desde la Base Tardío siguiendo el camino marcado en mapa. La excusa es que se ha capturado a un alto oficial ArgA y se lo lleva para interrogatorio.","Un equipo de asalto efectuará un ataque de distracción a la Base Pyrgos. El objetivo de este asalto es atraer a la mayor cantidad de efectivos posible de la ciudad para permitir la evacuación del equipo infiltrado y los rehenes."];               
SITUACION_HISTORICA = ["Hubo levantamiento a gran escala en toda la isla. Si bien este ataque provocó graves pérdidas humanas y materiales no han conseguido su objetivo de borrar la presencia de la ONU, ni descabezar su comando.","Nuestro engaño fingiendo una derrota y expulsión por parte de los rebeldes de los bloqueos norte y sur de la base temporal y la posterior evacuación de la misma ha tranquilizado a los líderes del levantamiento. El restablecimiento de la comunicación entre Pyrgos con las ciudades del sur via el camino costero, permite realizar una operación de rescate."];
EXTRACTO_INTELIGENCIA = ["Existen patrullas de camionetas artilladas en el camino costero. Hay gran número de insurgentes desplegados en Pyrgos y en la base aledaña.","Morteros en base Pyrgos. Marcan sus blancos con humo rojo o bengalas.","En dicha base hay un cañón antiaéreo ZSU-23-4V, el cual usan para proteger la base. Evitar el espacio aéreo en torno a la base Pyrgos hasta la destrucción del mismo.","<img image='imgs\Intel-4.jpg' width='400' height='300'/>","Los rehenes se encuentran en el viejo hospital, cerca del complejo gubernamental.","<img image='imgs\Intel-3.jpg' width='400' height='400'/>"];
OBJETIVOS = ["Insertar un equipo infiltrado en la ciudad de Pyrgos desde la Base Tardío. SE DEBE SEGUIR EXACTAMENTE EL CAMINO INDICADO EN MAPA.  Cualquier otra via sería sospechosa y difícil de explicar, probablemente perderíamos nuestra cobertura.", "El equipo infiltrado debe partir inmediatamente por el camino marcado. Es imperativo que la inserción se haga de noche.", "Protocolo de convoy: Velocidad Máxima 40 km/h. No intentar sobrepasar vehículos enemigos. Ir a la banquina en caso que vengan de frente.", "Ingresar únicamente por el puesto de control ubicado en [168 120]. En la zona enemiga se pueden mover con libertad en la ciudad y en cercanías de la base. No alejarse de dichos lugares.", "Plantar explosivos en el ZSU-23-4V para su destrucción remota. NO DETONAR HASTA TENER A LOS REHENES ASEGURADOS Y LOS EQUIPOS DE ASALTO ESTÉN LISTOS PARA ATACAR LA BASE PYRGOS.", "Infiltrarse en el viejo hospital aledaño al complejo gubernamental de Pyrgos. Localizar a los rehenes y tomar control del complejo. Desplazar a los rehenes a la terraza para facilitar la extracción aérea. NO SACAR LOS REHENES DEL HOSPITAL", "Recibido el aviso que el equipo infiltrado pasó el punto de control de ingreso a Pyrgos, las fuerzas ubicadas en el Aeropuerto Internacional deberán desplazarse al LZ ubicado en [187 142 K5]. El ingreso al LZ deberá hacerse desde el NE (inmediaciones de Nifi) para usar la cota 73 al SW del LZ como cobertura del ZSU-23.", "A partir de la llegada al LZ se deberán disponer las tropas de acuerdo las condiciones observadas en el terreno, para atacar la Base Pyrgos. El objetivo de dicho ataque no es tomar la base, sino atraer a la mayor cantidad de tangos lejos del equipo encubierto.", "El inicio del ataque será coordinado entre ambos equipos. La destrucción del ZSU-23-4V marcará el comienzo del ataque. ", "Cuando el líder del equipo de infiltración lo indique se deberán enviar al menos dos helicópteros para evacuar por vía aérea a los rehenes.", "Con los rehenes a salvo en el aeropuerto la fuerza de asalto debe romper el contacto y regresar al LZ para su extracción al Aeropuerto Internacional.", "Nota: El equipo infiltrado deberá evitar realizar cualquier disparo para no perder su estado encubierto. Solo se podrá disparar con la pistola con silenciador sin que los tangos lo vean desenfundar, debiendo eliminar a todos los testigos en un lapso menor a 15 segundos, para no perder su estado encubierto."]; 
RECURSOS = ["Aparecemos armados y listos para el combate.", "Arsenal limitado en el Aeropuerto Internacional y en la base Tardío.", "Cuatro helicópteros en el Aeropuerto Internacional.", "Dos camionetas artilladas y un camión para el equipo de infiltración en Base Tardío.", "Los helicópteros y vehículos tienen munición y suministros médicos.", "Camiones de reparación y suministros en el Aer. internacional, en la base Dorida y en la base Tardío.", "<t font='PuristaBold'>Instrucciones para el uso de la tableta GPS:</t> Esta reemplaza al GPS y permite recibir órdenes directas del mando de la ONU (tareas) y enviarle reportes, ya sea por contacto radial, celular o satelital encriptado. Se activa oprimiendo la letra M y muestra nuestra posición en el mapa, como así toda marca que haya hecho el Alto Mando (AM) sobre la misma."];
ENEMIGOS = ["Los insurgentes están armados con AK y AKM.","Poseen camionetas off-Road con ametralladoras de 12.7 mm montadas en la caja.", "Un ZSU en cercanias de la base Pyrgos","No disponen de misiles AA en la zona.","Morteros en Base Pyrgos"];
////////////////////////////////////////////////////////////////////////////////

/* Borrado de IAs enemigas muertas y vehículos destruidos */
ACTIVAR_RECOLECTOR_BASURA = 1;                      // Activa la funcion que borra las IAs muertas y vehículos destruidos. 1: Activado, 0: Desactivado
RB_TIEMPO_ESPERA_HOMBRES = 60;                      // Tiempo en segundos de espera para eliminar soldados enemigos. 0 Desactiva el borrado de enemigos
RB_TIEMPO_ESPERA_VEHICULOS = 0;                     // Tiempo en segundos de espera para eliminar vehículos enemigos. 0 Desactiva el borrado de vehículos
RB_TIEMPO_ESPERA_BLINDADOS = 0;                     // Tiempo en segundos de espera para eliminar blindados enemigos. 0 Desactiva el borrado de blindados
RB_TIEMPO_ESPERA_AEREOS = 0;                        // Tiempo en segundos de espera para eliminar aereos enemigos. 0 Desactiva el borrado de aereos
RB_DISTANCIA_JUGADORES = 0;                         // Distancia en metros a los jugadores a partir de la cual se borra. 0 desactiva el borrado por distancia
////////////////////////////////////////////////////////////////////////////////

/* Camuflaje */
ACTIVAR_COEFICIENTES_CAMUFLAJE = 0;                 // 1 Activa esta función. 0 la desactiva.
COEFICIENTE_AUDICION = 1;                           // Valores menores hacen al jugador mas difícil de escuchar. Valores decimales ente 0 y 1.
COEFICIENTE_CAMUFLAJE = 1;                          // Valores menores hacen al jugador mas difícil de detectar. Valores decimales ente 0 y 1.
////////////////////////////////////////////////////////////////////////////////

/* IA - CONFIGURACION */
DESACTIVAR_IA_DE_GRUPO = 1;                         // 0 No desactiva la IA del Grupo de los jugadores, 1 la desactiva.
DESACTIVAR_TODO_BLUFOR = 1;                         // 0 No desactiva la IA del Blufor, 1 la desactiva.
DIFICULTAD_IA_PERSONALIZADA = 0;
AIMING_ACCURACY = 0.01;                             //precision de apuntado
AIMING_SHAKE = 0.99; 	                            //dispersión de apuntado
AIMING_SPEED = 0.1; 	                            //velocidad de apuntado
SPOT_DISTANCE = 0.3; 	                            //distancia de avistamiento
SPOT_TIME = 0.5; 		                            //tiempo de avistamiento
COURAGE = 0.25; 		                            //coraje
RELOAD_SPEED = 0.25; 	                            //velocidad de recarga
COMMANDING = 0.75; 		                            //liderazgo
////////////////////////////////////////////////////////////////////////////////

/* Modificar desde los define que estan arriba de todo.
NO TOCAR LO QUE ESTA ABAJO DE ESTA LINEA             */
onLoadName = NAME;	                                // Nombre de carga
briefingName = COMPLETE_NAME;                       // Nombre en briefing
onLoadMission = DESCRIPTION;                        // Pie de carga
overviewText = DESCRIPTION;                         // Pie en seleccion de mision
overviewPicture = IMAGE;                            // Imagen en seleccion de mision
loadScreen = IMAGE;                                 // Imagen en carga
////////////////////////////////////////////////////////////////////////////////

/*******************************************************************************
                         Realizado por |ArgA|MIV
*******************************************************************************/