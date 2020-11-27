/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

#define NAME "Capítulo IX"    
#define COMPLETE_NAME "Capítulo IX - El Señor de la Guerra v3" 
#define IMAGE "imgs\portada.paa"               
#define DESCRIPTION "Desactivar el dispositivo"

author = "Maxi e Ignacio";    
IMG_LOGO = "imgs\logo.paa";                         // Nota: Las imagenes deberian estar en
COLOR_AUTOR = "#44CC00";                            // formato .paa y en proporcion 2x1 (1024x512)
ES_CAMPANIA = 1;                                    // tamaño logo: 323px x 323px
NOMBRE_CAMPANIA = "El Señor de la Guerra";
INTRO_PERSONALIZADA = 1;                            // 1 Si la deseas cargar una intro personalizada (propia)
                                                    // y en el parametro INTRO la dirección del archivo entre comillas
                                                    // EJ. INTRO_PERSONALIZADA = 1; INTRO = "scripts\intro_propia.sqf";
INTRO = "scripts\intro_3.sqf";                      // Intros: 1 y 2. Para desactivar: 0

MAX_DIST_VISION = 1500;
MIN_DIST_VISION = 800;                              // Distancia de visión reducida por marcador
DESACTIVAR_EQUIPAMIENTO_PERSONALIZADO = 1;          // Equipamiento guardado en arsenal virtual. 0: activado, 1: desactivado
ACTIVAR_COMPUTADORA_ARTILLERIA = 1;                 // Habilita computadora artilleria poner 1. Para que no aparezca poner 0
ACTIVAR_ROL_AUTOMATICO = 0;                         // Habilita la carga de rol al entrar a la misión por descripción de rol
                                                    // Para verificar que los roles estan bien escritos activar todas las IAs y entrar
COLOCAR_GPS = 1;                                    // Agrega GPS vanilla en rol automático o caja. 1: agrega, 0: remueve

ACTIVAR_INSIGNIA_AUTOMATICO = 1;                    // Añadir a arga_settings
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
CAMUFLAJE = ["Negro", "Multicam"];
GAFAS_INICIALES = "avon_fm12";
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
CARACTER = "Oficial";
HORARIO = "0700hrs";
FECHA = "03/09/2020";
CLIMA = "Parcialmente nublado";
UBICACION = "Ruguen/Rügen";
SITUACION = ["Nos encontramos divididos en los tres puntos estratégicos. Se procede a detallar cada objetivo en particular:", "Objetivo Barracuda: el equipo de operaciones especiales de ArgA (Yaguar 3) deberá hacer una incursión a los astilleros de Rügen donde los coreanos están realizando tareas de mantenimiento a un submarino nuclear. Sabemos que Young Mi se encuentra en las instalaciones. Es la persona detrás de todo esto. Deben capturarlo con vida. Encuentren una vía o vehículos de escape.", "Objetivo Gato: el equipo Cóndor se encuentra fuera de unas instalaciones fuertemente defendidas de Corea. Se sabe que en unas instalaciones subterráneas de esta base se encuentra el dispositivo biológico a punto de trasladarse a Stralsund. El dispositivo ya esta activo y dependen de Yaguar para desactivarlo. (Activo pero no detonado). Se sabe que el dispositivo esta programado para detonar a las 0900. Por lo que tenemos exactamente 2 Horas para realizar la operación. Caso contrario habremos fallado y Rügen se encontrara sumergido en una nube toxica matando así a miles de inocentes civiles.", "Objetivo Perro: el equipo Yaguar deberá acceder al laboratorio de Rügen donde deberán acceder a los servidores para descubrir los codigos y procedimientos de desactivación de la bomba.", "Dato de vital importancia: se tarda 15 minutos en el proceso de desactivación. Por lo que tenemos hasta las 0845 horas para iniciar el proceso de desactivación o toda la operación habrá fallado rotundamente.", "Al terminar la operación dirigirse con los aéreos a la séptima flota."];               
SITUACION_HISTORICA = ["Un equipo especial ruso completo el objetivo Lémur de la pasada operación. Consiguiendo así valiosa información de los servidores coreanos.", "En la información obtenida se detecto que el próximo 3 de septiembre piensan detonar la bomba en la principal ciudad de la isla.", "La coalición preparó un ataque coordinado a tres puntos de vital importancia. No podemos fallar. Rügen depende de nosotros."];     
EXTRACTO_INTELIGENCIA = ["<img image='imgs\youngmi.paa' width='323' height='323'/>"];
OBJETIVOS = ["<marker name='barracuda'>Barracuda</marker>: Capturar a Young Mi. Escapar de la zona.", "<marker name='perro'>Perro</marker>: Conseguir procedimientos de desactivación en los laboratorios", "<marker name='gato'>Gato</marker>: Encontrar y desactivar el dispositivo biológico"];
RECURSOS = ["Armamento brindado por la OTAN", "5 M1240 (M2) (MRAP) y 2 UH-60 por pelotón", "Yaguar 3: 4 SVD", "Mascaras de gas."];
ENEMIGOS = ["Ejercito coreano", "Fuerzas especiales chinas", "Instalaciones fuertemente defendidas", "Vehículos fuertemente blindados"];
////////////////////////////////////////////////////////////////////////////////

/* Borrado de IAs enemigas muertas y vehículos destruidos */
ACTIVAR_RECOLECTOR_BASURA = 1;                      // Activa la funcion que borra las IAs muertas y vehículos destruidos. 1: Activado, 0: Desactivado
RB_TIEMPO_ESPERA_HOMBRES = 120;                     // Tiempo en segundos de espera para eliminar soldados enemigos. 0 Desactiva el borrado de enemigos
RB_TIEMPO_ESPERA_VEHICULOS = 0;                     // Tiempo en segundos de espera para eliminar vehículos enemigos. 0 Desactiva el borrado de vehículos
RB_TIEMPO_ESPERA_BLINDADOS = 0;                     // Tiempo en segundos de espera para eliminar blindados enemigos. 0 Desactiva el borrado de blindados
RB_TIEMPO_ESPERA_AEREOS = 0;                        // Tiempo en segundos de espera para eliminar aereos enemigos. 0 Desactiva el borrado de aereos
RB_DISTANCIA_JUGADORES = 200;                       // Distancia en metros a los jugadores a partir de la cual se borra. 0 desactiva el borrado por distancia
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