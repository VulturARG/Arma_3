/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

#define NAME "Prueba EOS"                            // Colocar nombre de mision
#define COMPLETE_NAME "Prueba EOS v1"                // Nombre y versión de la misión
#define IMAGE "imgs\portada_EMB.jpg"                // Colocar nombre y extension de la imagen de portada, ej "imgs\portada.jpg"
#define DESCRIPTION "En el medio de la nada"                    // Colocar descripcion de la mision entre las comillas

author = "Shaggy - Vultur";                         // Editor (Pone tu nombre)
IMG_LOGO = "imgs\logoArgA.jpg";                         // Nota: Las imagenes deberian estar en
COLOR_AUTOR = "#76a8f7";                            // formato .paa y en proporcion 2x1 (1024x512)
ES_CAMPANIA = 1;                                    // tamaño logo: 323px x 323px
NOMBRE_CAMPANIA = "Una Serie de Eventos...";
INTRO_PERSONALIZADA = 0;                            // 1 Si la deseas cargar una intro personalizada (propia)
                                                    // y en el parametro INTRO la dirección del archivo entre comillas
                                                    // EJ. INTRO_PERSONALIZADA = 1; INTRO = "scripts\intro_propia.sqf";
INTRO = 0;                                          // Intros: 1 y 2. Para desactivar: 0

MAX_DIST_VISION = 2500;
MIN_DIST_VISION =  800;                             // Distancia de visión reducida por marcador
DESACTIVAR_EQUIPAMIENTO_PERSONALIZADO = 1;          // Equipamiento guardado en arsenal virtual. 0: activado, 1: desactivado
ACTIVAR_COMPUTADORA_ARTILLERIA = 1;                 // Habilita computadora artilleria poner 1. Para que no aparezca poner 0
ACTIVAR_ROL_AUTOMATICO = 0;                         // Habilita la carga de rol al entrar a la misión por descripción de rol
                                                    // Para verificar que los roles estan bien escritos activar todas las IAs y entrar
COLOCAR_GPS = 0;                                    // Agrega GPS vanilla en rol automático o caja. 1: agrega, 0: remueve

ACTIVAR_INSIGNIA_AUTOMATICO = 1;                    // Añade insignias por pelotón o médicas. 1: Añade, 0: No Añade
INSIGNIA_IR = 0;                                    // Establece si las insignias son IR (1) o normales (0).

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
CARACTER = "Oficial";
HORARIO = "0730 hs.";
FECHA = "01/10/2020";
CLIMA = "Despejado";
UBICACION = "Vihrolati";
SITUACION = ["La orden del Alto Mando conjunto internacional es patrullar las 2 rutas R.N 13 y R.N. 18, para finalmente ingresar en simultaneo a la ciudad fronteriza de Virojoki desde los accesos Norte y Sur de la misma. Deberán contactar con las fuerzas locales.","No deberán traspasar la frontera por ningún motivo, ni devolver un eventual fuego de las tropas de Duesia","ArgA no tiene permitido el fuego a excepción de respuesta."];
SITUACION_HISTORICA = ["La República de Viro, es un territorio estratégico cuya parte continental posee abundantes recursos naturales y a su vez contiene una serie de islas ubicadas estratégicamente. Debido a la diversidad geográfica y los cambios políticos nunca consolidó un sentimiento nacional único.","Actualmente el estado atraviesa una tensa calma después de la guerra civil que aconteció hace más de 5 años atrás en una situación que fue aprovechada por su vecino del norte, Duesia, una potencia regional. Una antigua provincia de Duesia, que desde la caída de la V.P.C.C. bajo administración de Viro, limítrofe a su anterior nación y con mayoría étnica de esta potencia fue donde se encendió la mecha de la guerra civil. Se sospecha que era apoyada estrechamente con armas y provisiones por Duesia. Se cree que nunca cesó ese apoyo. Una coalición internacional puso fin a la guerra civil y desde entonces mantiene presencia en todo el país para evitar que la historia se repita.","ArgA ha sido recientemente desplegado en la subprefectura de Virolahti, zona donde comenzó la guerra civil, sin embargo, ha permanecido relativamente calmada los últimos tiempos pese a la permisividad del mando anterior las de fuerzas internacionales."];
EXTRACTO_INTELIGENCIA = ["Los civiles no tienen un sentimiento nacional, responden a los intereses del momento. Son fieles a su ciudad y clan. Hacen y deshacen alianzas todo el tiempo. Pueden venir a desayunar a tu mesa a la mañana, combatir contra ti al medio día y traer carne para hacer un asado a la noche.","Existen patrullas armadas de vecinos en diferentes localidades."];
OBJETIVOS = ["Patrullar mediante convoy a lo largo de la R.N 13 y R.N. 18 desde las intersecciones con la R.P.R. 135 hasta la localidad de Virojoki.","No responder fuego de fuerzas regulares del país limítrofe.", "Solo abrir fuego eventualmente a modo de respuesta contra guerrilla local."];
RECURSOS = ["Múltiples Humvees.", "Arsenal Limitado."];
ENEMIGOS = ["No hay enemigos definidos."];
////////////////////////////////////////////////////////////////////////////////

/* Borrado de IAs enemigas muertas y vehículos destruidos */
ACTIVAR_RECOLECTOR_BASURA = 1;                      // Activa la funcion que borra las IAs muertas y vehículos destruidos. 1: Activado, 0: Desactivado
RB_TIEMPO_ESPERA_HOMBRES = 120;                     // Tiempo en segundos de espera para eliminar soldados enemigos. 0 Desactiva el borrado de enemigos
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
DESACTIVAR_TODO_BLUFOR = 0;                         // 0 No desactiva la IA del Blufor, 1 la desactiva.
DIFICULTAD_IA_PERSONALIZADA = 0;
AIMING_ACCURACY = 0.20;                             //precision de apuntado
AIMING_SHAKE = 0.90; 	                            //dispersión de apuntado
AIMING_SPEED = 0.20; 	                            //velocidad de apuntado
SPOT_DISTANCE = 0.30; 	                            //distancia de avistamiento
SPOT_TIME = 0.50; 		                            //tiempo de avistamiento
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
