/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

#define NAME "Traza Italiana"  // Colocar nombre de mision
#define IMAGE "imgs\TI.paa"             // Colocar nombre y extension de la imagen de portada, ej "imgs\portada.jpg"
#define DESCRIPTION ""                  // Colocar descripcion de la mision entre las comillas

author = "|ArgA|Vultur|Cbo¹";           // Editor (Pone tu nombre)
onLoadName = NAME;	                    // Nombre de carga
briefingName = NAME;                    // Nombre en briefing
onLoadMission = DESCRIPTION;            // Pie de carga
overviewText = DESCRIPTION;             // Pie en seleccion de mision
overviewPicture = IMAGE;                // Imagen en seleccion de mision
loadScreen = IMAGE;                     // Imagen en carga
IMG_LOGO = "imgs\PlacaVulturII.paa"     // Nota: Las imagenes deberian estar en
COLOR_AUTOR = "#76a8f7";                // formato .paa y en proporcion 2x1 (1024x512)
ES_CAMPANIA = 0;                        // tamaño logo: 323px x 323px
NOMBRE_CAMPANIA = "";
INTRO = 2;                               // Intros: 1 y 2. Para desactivar: 0
MAX_DIST_VISION = 2000;
DESACTIVAR_EQUIPAMIENTO_PERSONALIZADO = 1; // Equipamiento guardado en arsenal virtual

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
STAND_MEDICO = "standMedico";
STAND_INGENIERO = "standIngeniero";
STAND_PILOTO = "standPiloto";

//BRIEFING
// Cada elemento del array es un parrafo
// Ejemplo: ["Primer parrafo", "Segundo parrafo"]
CARACTER = "No Oficial";
HORARIO = "0230hs";
FECHA = "26 de junio de 2020";
CLIMA = "Variable";
UBICACION = "Altis";
SITUACION = ["ArgA esta estacionada en la base El Salitral. Dicha base fue construida por algún ingeniero con reminiscencias de la fortificación del siglo XV, llamada traza italiana. La base cuenta con pertrechos necesarios para una adecuada defensa. Hay reportes de fuerzas enemigas en las cercanías. Se estima que el ataque ocurrirá dentro de 15 a 30 minutos."];
SITUACION_HISTORICA = ["La isla de Altis está sufriendo un ataque en gran escala. Los puertos y el Aeropuerto Internacional están bajo ataque por fuerzas blindadas y helitransportadas. Dada la carencia del enemigo de portaaviones es fundamental impedir que capturen la pista del aeropuerto internacional y la pista del salitral. Estas son las únicas en la isla capaces de recibir aviones de gran porte o cazas enemigos."];
EXTRACTO_INTELIGENCIA = ["El enemigo a desembarcado tropa regular a pie, así como también tropas en transportes blindados. Utiliza helicópteros de transporte para la inserción de tropas desde sus barcos. No cuenta con helicópteros de combate. Hay reportes sin confirmar avistamiento de tanques de combate enemigos."];
OBJETIVOS = ["Minar la entrada y los alrededores de la base (Antipersonal y anti vehículos)", "Defender la base hasta recibir refuerzos o abatir a todos los enemigos."];
RECURSOS = ["Aparecemos armados y listos para el combate.","3 morteros emplazados con munición HE.","Caja de recarga de mortero en puesto de mando.","3 morteros emplazados con 32 rondas bengalas cada uno.", "3 cajas de recargas de bengalas para los morteros.","Cajas de munición bajo las torres metálicas en las murallas.", "Cajas de munición cerca a los fortines periféricos.","Cajas de explosivos y minas cerca de la entrada.", "Cajas vacías para dejar elementos sobrantes.","Cuatro cuatriciclos cargados con minas para los ingenieros.", "Un polaris para uso de los ingenieros.","Tubos AA y AT con su munición en las cajas.", "Cinco puestos médicos con cajas de suministros médicos en c/u.","Puesto de mando centralizado.", "Líder y sublíder general, líderes de los pelotones Alfa hasta Foxtrot, junto con los ingenieros, cuentan con visión nocturna.m","Alarma de alerta temprana y apagado de torres de iluminación automáticos."];
ENEMIGOS = ["Fuerzas regulares a pie","Paracaidistas","Transportes blindados livianos","Helicopteros de transporte","Existencia de vehículos blindados pesados sin confirmar"];
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

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/
