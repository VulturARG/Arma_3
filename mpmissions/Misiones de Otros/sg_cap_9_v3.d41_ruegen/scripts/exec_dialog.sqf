/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/

params ["_functionName", "_extraParams"];

switch (_functionName) do {
	case "MENU_PRINCIPAL": { call MENU_PRINCIPAL;};
	case "OBSERVAR_CABLES": { call OBSERVAR_CABLES;};
	case "OBTENER_SERIE": { call OBTENER_SERIE;};
	case "OBTENER_RECUPERACION": { call OBTENER_RECUPERACION;};
	case "CORTAR_CABLES": { call CORTAR_CABLES;};
	case "INGRESAR_PASSWORD": { call INGRESAR_PASSWORD;};
	case "CODIDO_DESACTIVACION": { call CODIDO_DESACTIVACION;};
	case "CORTAR_CABLE": { _extraParams call CORTAR_CABLE;};
	case "PULSAR_PASSWORD": { _extraParams call PULSAR_PASSWORD;};
	case "INGRESAR_CODIDO_DESACTIVACION": { _extraParams call INGRESAR_CODIDO_DESACTIVACION;};
	case "GUIA_DESACTIVACION": { call GUIA_DESACTIVACION;};
	case "PASOS_CABLES": { call PASOS_CABLES;};
	case "PASOS_PASSWORD": { call PASOS_PASSWORD;};
	case "PASOS_CODIGO": { call PASOS_CODIGO;};
	default { };
};


/*******************************************************************************
                          Realizado por |ArgA|MandI
*******************************************************************************/