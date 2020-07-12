/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

#define NAME Op.                            // Colocar nombre de mision (un espacio despues de Op. y sin comillas ni nada)
#define VERSION v1                          // Versión de la misión
#define IMAGE "imgs\portada.paa"            // Colocar nombre y extension de la imagen de portada, ej "imgs\portada.jpg"
#define DESCRIPTION ""                      // Colocar descripcion de la mision entre las comillas

author = "Arga";                            // Editor (Pone tu nombre)
IMG_LOGO = "imgs\logo.paa";                 // Nota: Las imagenes deberian estar en
COLOR_AUTOR = "#76a8f7";                    // formato .paa y en proporcion 2x1 (1024x512)
ES_CAMPANIA = 0;                            // tamaño logo: 323px x 323px
NOMBRE_CAMPANIA = "";
INTRO = 2;                                  // Intros: 1 y 2. Para desactivar: 0
MAX_DIST_VISION = 4000;
DESACTIVAR_EQUIPAMIENTO_PERSONALIZADO = 1;  // Equipamiento guardado en arsenal virtual
PERMITIR_COMPUTADORA_ARTILLERIA = 1;        // Habilita computadora artilleria poner true. Para que no aparezca poner false
PERMITIR_ROL_AUTOMATICO = 0;                // Habilita la carga de rol al entrar a la misión por descripción de rol

//EQUIPAMIENTO
// Camuflajes disponibles:          Tipos disponibles:
//      - Bosque                        - Multicam 
//      - Desierto                      - Marpat
//      - Selva
//
//      - Personalizado (se debe ingresar mas abajo la clase del uniforme, chaleco, casco y mochila)
//      - No editar (no se le modificara ninguna de las 4 cosas al jugador, solo arma y equipo interno)
//
//        Las opciones Personalizada y No editar pueden llevar a comportamientos inesperados.
//        Por lo que el editor queda a cargo de checkear y revisar el correcto funcionamiento.

CAMUFLAJE = ["Desierto", "Marpat"];
GAFAS_INICIALES = "";
UNIFORME_PERSONALIZADO = "";
CASCO_PERSONALIZADO = "";
CHALECO_PERSONALIZADO = "";
MOCHILA_PERSONALIZADO = "";
MOCHILA_CHICA_PERSONALIZADO = "";

//BRIEFING
// Cada elemento del array es un parrafo
// Ejemplo: ["Primer parrafo", "Segundo parrafo"]
CARACTER = "No Oficial";
HORARIO = "";
FECHA = "";
CLIMA = "";
UBICACION = "";
SITUACION = [""];               
SITUACION_HISTORICA = [""];     
EXTRACTO_INTELIGENCIA = [""];
OBJETIVOS = ["", ""];
RECURSOS = ["", ""];
ENEMIGOS = ["", ""];
////////////////////////////////////////////////////////////////////////////////

//IA - CONFIGURACION
DESACTIVAR_IA_DE_GRUPO = 1; // 0 Permite la IA del Grupo de los jugadores, 1 la desactiva.
DESACTIVAR_TODO_BLUFOR = 1; // 0 Permite la IA del Blufor, 1 la desactiva.
DIFICULTAD_IA_PERSONALIZADA = 0;
AIMING_ACCURACY = 0.01; //precision de apuntado
AIMING_SHAKE = 0.99; 	//dispersión de apuntado
AIMING_SPEED = 0.1; 	//velocidad de apuntado
SPOT_DISTANCE = 0.3; 	//distancia de avistamiento
SPOT_TIME = 0.5; 		//tiempo de avistamiento
COURAGE = 0.25; 		//coraje
RELOAD_SPEED = 0.25; 	//velocidad de recarga
COMMANDING = 0.75; 		//liderazgo
////////////////////////////////////////////////////////////////////////////////

/* Modificar desde los define arriba de todo, no tocar directamente */
onLoadName = NAME;	                        // Nombre de carga
briefingName = NAME VERSION;                // Nombre en briefing
onLoadMission = DESCRIPTION;                // Pie de carga
overviewText = DESCRIPTION;                 // Pie en seleccion de mision
overviewPicture = IMAGE;                    // Imagen en seleccion de mision
loadScreen = IMAGE;                         // Imagen en carga

/*******************************************************************************
                         Realizado por |ArgA|Vultur|Cbo¹
*******************************************************************************/
