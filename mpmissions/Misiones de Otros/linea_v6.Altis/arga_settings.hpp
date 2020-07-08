/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

#define NAME "Op. Contra la Línea V6"
#define IMAGE "imgs\portada.paa"                   
#define DESCRIPTION "Defender y contraatacar."                  

author = "Maxi e Ignacio";                       
onLoadName = NAME;	                    
briefingName = NAME;                      
onLoadMission = DESCRIPTION;                     
overviewText = DESCRIPTION;                      
overviewPicture = IMAGE;   
loadScreen = IMAGE;        
IMG_LOGO = "imgs\logo.paa";             
COLOR_AUTOR = "#44CC00";               
ES_CAMPANIA = 0;                        
NOMBRE_CAMPANIA = "NO ES UNA CAMPAÑA";
INTRO = 2;                               
MAX_DIST_VISION = 2000;
DESACTIVAR_EQUIPAMIENTO_PERSONALIZADO = 1;

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

CAMUFLAJE = ["No editar", "Marpat"];
GAFAS_INICIALES = "rhsusf_shemagh2_gogg_tan";
UNIFORME_PERSONALIZADO = "rhs_uniform_cu_ocp";
CASCO_PERSONALIZADO = "rhsusf_ach_helmet_headset_ocp";
CHALECO_PERSONALIZADO = "rhsusf_mbav_rifleman";
MOCHILA_PERSONALIZADO = "B_Kitbag_cbr";
MOCHILA_CHICA_PERSONALIZADO = "rhsusf_falconii_coy";

//BRIEFING
// Cada elemento del array es un parrafo
// Ejemplo: ["Primer parrafo", "Segundo parrafo"]
CARACTER = "Cooperativa";
HORARIO = "0600hrs";
FECHA = "13/06/2020";
CLIMA = "Despejado";
UBICACION = "Altis";
SITUACION = ["Hace ya varios días que el ejercito ruso esta movilizando sus tropas hacia la frontera, creemos que pueden estar a punto de cometer un ataque. Ante la incertidumbre la ONU mando al Ejercito Español y el Ejercito Argentino a cuidar la frontera. Tendremos que estar preparados para lo peor"];     
SITUACION_HISTORICA = ["Desde diciembre de 2019 la isla de Altis se vio envuelta en un conflicto interno que llevo a una guerra civil. Rusia aliada del gobierno de la isla intervino militarmente. Aplicando mano firme puso fin a la guerra y llevo 'estabilidad' a la zona. Debido a la extraña aparición de Rusia en la zona la ONU decido realizar una investigación de lo que estaba pasando en la isla. Al en encontrar irregularidades en las medidas del ejercito ruso, la ONU le puso fecha limite para retirar la sus tropas y dejar solamente las necesarias. Llego Febrero de 2020 y Rusia no cumplió con el tratado, por lo que la ONU decidió intervenir militarmente. En Marzo debido a conflictos de intereses entre la ONU y Rusia se llego a un acuerdo en que se dividiría la isla y cada facción se quedaría con una parte de la misma. Pasado un mes y mas conflictos, se construyo una frontera entre ambos sectores dividiendo la isla definitivamente."];               
EXTRACTO_INTELIGENCIA = [""];
OBJETIVOS = ["Jujuy: Defender la línea", "Corrientes: Defender la línea", "Toledo: Defender la línea", "Mendoza: Rescatar civiles", "Jaén: Tomar punto clave", "Valencia: Tomar punto clave", "Murcia: Destruir puesto de artillería y antiaéreos", "Chaco: Destruir arsenal", "Chubut: Tomar base enemiga y despejar la zona"];
RECURSOS = ["Aparecemos armados", "Cajas con munición, misceláneos y equipo médico", "1 C-130 Hércules (Transporte)", "1 AH-1Z", "1 AS532UL Cougar (Armado)", "1 AS532UL Cougar (Transporte)", "1 UH-60M", "1 UH-60M MEV (ESSS)", "1 CH-47D (Cargo)", "1 CH-47F", "3 RHIB", "1 Mk. V SOC", "2 M1025A2 (M2)", "1 M1097A2", "2 VAMTAC (M2)", "1 VAMTAC TRANSPORTE", "1 M1025A2 (M2)", "1 M1078A1P2-B", "1 VAMTAC (M2)", "1 M250 Cubierto (Transporte)", "Morteros", "1 M1025A2 (M2)", "1 M1097A2", "1 M1078A1P2-B", "1 VAMTAC (M2)", "1 VAMTAC TRANSPORTE", "1 M250 Cubierto (Transporte)"];
ENEMIGOS = ["Ejercito ruso (bien armados y entrenados)", "Vehiculos blindados pesados", "Vehiculos blindados Medianos", "Vehiculos ligeros", "Puesto de artilleria", "Puesto antiaéreo"];
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
                          Realizado por |ArgA|MandI
*******************************************************************************/
