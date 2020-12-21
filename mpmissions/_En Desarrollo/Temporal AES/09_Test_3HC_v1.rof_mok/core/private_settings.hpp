/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

TEMPLATE_VERSION     = "0.9.14";
TEMPLATE_LAST_UPDATE = "2020-11-26";                // Escribir la fecha en formato AAAA-M-D sin ceros en el mes o el día

/* Log system */
DEBUG = 1;                                          // 1: Habilita el modo debug, 0: Desabilita.
LOG_SYSTEM = 1;                                     // 1: Habilita el sistema de log, 0: Desabilita.
LOG_SYSTEM_ONLY_DEDICATED = 1;                      // 1: Habilita el sistema de log sólo si el servidor es dedicado (requiere LOG_SYSTEM = 1), 0: Desabilita.
FPS_MAP = 1;                                        // 1: Muestra fps en mapa del servidor y los headless client, 0: Desabilita.
FPS_LOG = 0;                                        // 1: Habilita loguear fps en archivo rpt del servidor y los headless client, 0: Desabilita.
FPS_DB = 1;                                         // 1: Habilita loguear fps en la base de datos del servidor y los headless client, 0: Desabilita.
FPS_IDLE_TIME = 30;                                 // Tiempo en segundos que tarde en iniciar la medición de los FPS
////////////////////////////////////////////////////////////////////////////////

/* Listas auxiliares */
AUXILIAR_ROLE_LIST = [["lider","Líder",34],["sub_lider","Sub Líder",35],["lider_peloton","Líder Pelotón",36],["ametrallador_m240","Ametrallador m240",37],["ametrallador_m249","Ametrallador m249",38],["granadero","Granadero",39],["granadero_bengalas","Granadero bengalas",40],["lanzador_at","Lanzador AT",41],["lanzador_aa","Lanzador AA",42],["tirador_fal","Tirador fal",43],["tirador_mk11","Tirador mk11",44],["francotirador","Francotirador",45],["ingeniero","Ingeniero",46],["observador","Observador",47],["piloto","Piloto",48],["radio_operador","Radio operador",49],["medico","Médico",50],["medico_combate","Médico de combate",51],["enfermero","Enfermero",52],["fusilero","Fusilero",53],["fusilero_ra","Fusilero RA",54],["entrenamiento","Entrenamiento",55],["desconocido","Desconocido",56],["lider_escuadra","Líder Escuadra",57],["lider_escuadra_1","Líder Escuadra 1",61],["lider_escuadra_2","Líder Escuadra 2",62],["lider_escuadra_3","Líder Escuadra 3",63],["lider","Cacique",1],["entrenamiento","Soldado",2],["sub_lider","teniente",3],["lider","Capitan",4],["sub_lider","Teniente ¹",5],["radio_operador","Radio operador",7],["lider_escuadra","Lider de Escuadra",8],["fusilero","Fusilero",9],["ametrallador_m249","Ametrallador",13],["granadero","Granadero",15],["ingeniero","Ingeniero",17],["lanzador_at","Anti Tanque",19],["tirador_mk11","Tirador",22],["enfermero","Enfermero",24],["medico","Medico",25],["piloto","Piloto",62],["lanzador_at","AT",71],["ingeniero","Sombra Especialista",72],["medico","Sombra Medico",73],["fusilero","Sombra",74],["lider_peloton","Lider Sombra",75],["sub_lider","Teniente Primero",148],["lanzador_at","Fusilero AT",149],["lider","Lider",193],["lanzador_aa","AA",197],["radio_operador","Fusilero Ro",204],["ametrallador_m240","Ametrallador 762",213],["tirador_fal","Tirador Designado CP",228],["sub_lider","Sub Lider",238],["entrenamiento","Cabo Primero",314],["entrenamiento","Instructor",321],["entrenamiento","Soldado Primero",327],["entrenamiento","Cabo",328],["entrenamiento","Recluta",337],["entrenamiento","Sargento Primero",356],["entrenamiento","Aspirante",357],["fusilero_ra","Fusilero R/A",391],["tirador_mk11","Tirador Designado",394],["lider_peloton","Matrero",396],["ametrallador_m249","Ametrallador 556",401],["sub_lider","Pampa",422],["desconocido","PRUEBA 3",463],["desconocido","any",471],["lanzador_aa","Fusilero AA",495],["lider_peloton","Lider-Tirador",502],["sub_lider","SubLider",672],["entrenamiento","Comandante",739],["entrenamiento","Sargento",769],["entrenamiento","PRUEBA 1",831],["entrenamiento","PRUEBA 2",833],["entrenamiento","Teniente¹",932],["granadero_bengalas","Granadero c/Bengalas",40],["lider_escuadra","Lider Escuadra 1",2820],["lider_escuadra","Lider Escuadra 2",2830],["lider_escuadra","Lider Escuadra 3",3270],["amunicionador","amunicionador",65]];

ARGA_PLATOON_LIST = [["condor",["condor","cóndor"]],["yaguar",["yaguar","yaguarete","yaguareté"]]];

AVAILABLE_INSIGNIA_TYPES = ["arga","condor","yaguar","medico"];

BOX_ROLE_LIST = ["Capitán","Teniente","Líder","Sub Líder","Líder Pelotón","Líder Escuadra","Líder Escuadra 1","Líder Escuadra 2","Líder Escuadra 3","Ametrallador M240","Ametrallador M249","Amunicionador","Francotirador","Fusilero","Fusilero RA","Granadero","Granadero c/Bengalas","Ingeniero","Lanzador AA","Lanzador AT","Observador","Piloto","Radio Operador","Tirador FAL","Tirador MK11","Médico","Médico de Combate","Enfermero"];

RADIO_CHANNEL_NAME  = [["ACRE_PRC152",[[4, "AEREO"],[5, "INTERNA MANDO"],[6, "COMANDANCIA"],[7, "CONDOR"],[8, "YAGUARETE"],[9, "CONVOY"],[10, "MEDICOS"]]],["ACRE_PRC117F",[[4, "AEREO"],[5, "INTERNA MANDO"],[6, "COMANDANCIA"],[7, "CONDOR"],[8, "YAGUARETE"],[9, "CONVOY"],[10, "MEDICOS"]]]];
FIXED_CHANNEL_NAME  = ["AEREO","INTERNA MANDO","COMANDANCIA","CONVOY","MEDICOS"];
RADIO_CHANNEL_SETUP = [["lider",[["ACRE_PRC117F",6],["ACRE_PRC152",5],["ACRE_PRC343",5]]],["sub_lider",[["ACRE_PRC117F",6],["ACRE_PRC152",5],["ACRE_PRC343",5]]],["lider_peloton@condor",[["ACRE_PRC117F",6],["ACRE_PRC152",7],["ACRE_PRC343",5]]], ["lider_escuadra_1@condor",[["ACRE_PRC152",7],["ACRE_PRC343",1]]],["lider_escuadra_2@condor",[["ACRE_PRC152",7],["ACRE_PRC343",2]]], ["lider_peloton@yaguar",[["ACRE_PRC117F",6],["ACRE_PRC152",8],["ACRE_PRC343",5]]], ["lider_escuadra_1@yaguar",[["ACRE_PRC152",8],["ACRE_PRC343",11]]], ["lider_escuadra_2@yaguar",[["ACRE_PRC152",8],["ACRE_PRC343",12]]], ["lider_escuadra_3@yaguar",[["ACRE_PRC152",8],["ACRE_PRC343",13]]],["piloto",[["ACRE_PRC117F",6],["ACRE_PRC152",4],["ACRE_PRC343",5]]],["medico",[["ACRE_PRC152",10],["ACRE_PRC343",10]]],["medico_combate",[["ACRE_PRC152",10],["ACRE_PRC343",10]]],["enfermero",[["ACRE_PRC152",10],["ACRE_PRC343",10]]]];

ROLES_NEEDING_PLATOON = ["lider_peloton","lider_escuadra_1","lider_escuadra_2","lider_escuadra_3","sublider_escuadra_1","sublider_escuadra_2","sublider_escuadra_3"];

REVIEWER_UID = ["76561198026915573", "76561198091139370", "76561198030188168", "76561198010777357"];
////////////////////////////////////////////////////////////////////////////////

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

/*
    TODO: ESCRIBIR LOS TODO 
    File mpmissions\__cur_mp.rof_mok\core\scripts\check_template_version.sqf..., line 19
-------------------------------------------------------------------
2020/11/28,  4:10:48 Error in expression <_fnc_log;
if ((_minimun select 1) < (_x select 1)) then {
_minimun = _x;
};

} f>
2020/11/28,  4:10:48   Error position: <select 1)) then {
_minimun = _x;
};

} f>
2020/11/28,  4:10:48   Error Generic error in expression
2020/11/28,  4:10:48 File mpmissions\__cur_mp.rof_mok\scripts\eos\functions\aes_getHCSmalledUnits.sqf..., line 83
*/