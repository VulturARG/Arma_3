/*
	initBriefing.sqf
	
	Descripción:
	Este script agrega los datos del briefing de la misión a cada uno de los jugadores. 

	El editor debe tomar nota y llenar su briefing desde el último hasta el primero, porque la forma en que se agregan
	las entradas al diario está invertida.

	Parámetros:
	--

	Retorna:
	--
*/

//Final
player createDiaryRecord["Diary", ["Final", "<p align='center'> 
<br/><font size='18' color='#29a329'>- Final: </font>
<br/>
Replegar a base de inicio y dar por finalizada la misión con la escuadra completa <font color='#ffcc00'>(5pts)</font>
<br/><br/>
<font size='15' color='#ff0000'>NOTA:</font>Todos deben llegar a base, de lo contrario restará -1 por cada miembro que no haya llegado a base al momento de finalizar misión.
</p>"]];

//Tareas
player createDiaryRecord["Diary", ["Tareas", "<p align='center'> 
<br/><font size='18' color='#29a329'>- Tareas: </font>
<br/>
1. Destruir lancha enemiga <font color='#ffcc00'>(2 pts)</font><br/>
<br/><br/>
2. Destruir lancha enemiga <font color='#ffcc00'>(2 pts)</font><br/>
<br/><br/>
3. Destruir lancha enemiga <font color='#ffcc00'>(2 pts)</font><br/>
<br/><br/>
</p>"]];

//Objetivos secundarios
player createDiaryRecord["Diary", ["Objetivos Secundarios", "<p align='center'> 
<br/><font size='18' color='#29a329'>- Secundarios: </font>
<br/>
1. Tomar los documento de los registros de vuelo que se encuentran en algún sitio del Aeropuerto Juancho<font color='#ffcc00'>(4 pts)</font><br/>
2. Tomar información de la oficina de El Don<font color='#ffcc00'>(4pts)</font>
<br/><br/>
</p>"]];



// Objetivos
player createDiaryRecord["Diary", ["Objetivos", "<p align='center'> 
<br/><font size='18' color='#29a329'>- Principal:</font>
<br/>
<font size='14' color='#ffffff'>1. Matar a Sempala Onyekuru</font> <font size='18' color='#ffcc00'>(15pts)</font>
<br/><br/></font>
<font size='14' color='#ffffff'>2. Eliminar a Ivankov que se encuentra en el Aeropuerto Juancho, posterior a la realización del disparo a Onyekuru</font> <font size='18' color='#ffcc00'>(5pts)</font>
<br/><br/></font>
<img image='1.jpg' align='center' width='367' height='407' />

</p>"]];

player createDiaryRecord["Diary", ["Recursos en base", 
"<p align='justify'>
2 botes semirrígidos
<br/><br/>Pequeñas cajas limitadas en armamento en USS Liberty
<br/><br/>
</p>"]];

player createDiaryRecord["Diary", ["Informaci"+toString[243]+"n Operativa", 
"<p align='justify'>
<br/><br/>Los Estados Unidos nos han facilitado el USS Liberty y acercado a la zona de la isla, obviamente a cambio de algo importante para ellos, los registros de vuelo de ingreso y egreso de la isla y cualquier información de “El Don”. 
<br/><br/>Desde el barco, deben bajar dos gomones semirígidos y dirigirse a la isla para ingresar por los dos únicos sectores de ingreso posible, el Aeropuerto Juancho o Fort Bay.
<br/><br/>Toda la isla está vigilada por personal de Semión Moguilévich en guardia permanente.
<br/><br/>Ingresando por la noche con nuestra visión nocturna con el mayor sigilo posible y evitando un enfrentamiento innesesario, se deberá llegar a la torre central.
<br/><br/>Puede haber personal de vigilancia en la zona, no es seguro.
<br/><br/>La torre central es la posición ideal para observar prácticamente toda la isla.
<br/><br/>Una vez libre y asegurada la torre, hacer noche ahí y mantenerse hasta el horario en que Onyekuru llega a su encuentro con El Don, que será alrededor de las 15:30 - 16:00 hs local.
<br/><br/>Con su francotirador y apoyo del observador asignados para la tarea deberán matar a Sempala Onyekuru en su única oportunidad.
<br/><br/>Se sabe que el tiempo que se mantendrá en tierra no será mayor a 5 minutos y puede que sea demasiado poco tiempo, por eso hay que estar más que preparado para realizar el disparo en el momento que se tenga oportunidad.
<br/><br/>Hay dos oficinas en las que se maneja “El Don”, pero no tenemos seguridad en cual se realizará el encuentro, si en Winward Sade o en St. Jhon’s.
<br/><br/>Con el disparo realizado y la eliminación o no de Onyekuru, toda la guardia de la isla ira en su búsqueda sin dudarlo.
<br/><br/>Deberán salir del sector y dirigirse de inmediato al USS Liberty para estar a salvo; pero antes, ir en busca de la información que EEUU nos solicita.
<br/><br/>Eliminar al responsable de la seguridad de la isla, el ruso Vyacheslav Ivankov, será de importancia para generar descontrol al momento de salir.
<br/><br/>Y al salir de la zona, destruir sus medios de transporte por agua sería importante para evitar que los sigan.
<br/><br/>Nota importante: No hacer daño a El Don Semión Moguilévich ni daños materiales importantes a su isla.
<br/><br/>

</p>"]];

player createDiaryRecord["Diary", ["Informaci"+toString[243]+"n Tactica", 
"<p align='justify'>
<br/><br/>La Isla de Saba es un municipio especial integral de los Países Bajos, tiene apenas 13 km² y se encuentra en el mar caribe. 
<br/><br/>En esa pequeña isla tiene su residencia quien se cree que en los años 90 era el Jefe de Jefes de la mayoría de los sindicatos de la mafia rusa El Don Semión Moguilévich.
<br/><br/>Ya retirado pero con influencias intactas y negocios aún en curso sigue siendo una persona muy importante con la cual Sempala tiene negociados y cada mes lo visita rigurosamente; seguramente para realizar un pago en persona.
<br/><br/>Nuestra investigación, luego de meses de seguimiento, asegura que a mediados de mes se encuentran en la casa de El Don por un muy breve lapso de tiempo.
<br/><br/>Como es una isla muy pequeña con control total de Moguilévich su reunión es sumamente tranquila y despreocupada, pero saben muy bien que lo deben hacer rápido para que los satélites de EEUU no sospechen.
<br/><br/>
</p>"]];

// Situación
player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n", 
"<p align='justify'>
Con un trabajo muy fino y con algunas complicaciones, se pudo rescatar con vida a Bastian Mc Douglas.
<br/><br/>Luego de 5 meses de su captura, pudo recuperar su salud y su estado físico y anímico y ya se dedica a su gran obra con la ONG Corazón de León, que lógicamente sufrió mucho su ausencia.
<br/><br/>Se están realizando las investigaciones necesarias para no dejar impune los hechos acontecidos y que la justicia haga pagar a los responsables todo lo mal que han hecho.
<br/><br/>Es ya de conocimiento que el máximo responsable es Sempala Onyekuru y el B.L.A.S., pero es imposible llegar a él a través de las vías legales convencionales.
<br/><br/>Se maneja en un círculo impenetrable tanto físicamente como judicialmente.
<br/><br/>El apoyo con que cuenta internacionalmente de políticos corruptos y de mafias de todo tipo es muy amplio.
<br/><br/>La única opción para desbaratar la organización y poder regresar a las labores de ayuda humanitaria es la eliminación de Onyekuru.
<br/><br/>Volver a Loholoho no es opción, ya que han reforzado la vigilancia y no va a ingresar nadie, ni civiles ni nada que no tenga un control riguroso.
<br/><br/>Se investigan todas las opciones y los movimientos que realiza.
<br/><br/>Sempala Onyekuru sale de su sector seguro en muy pocas ocasiones y siempre por temas de negocios.
<br/><br/>Siempre lleva su guardia personal y en sectores más cercanos realizan una movilización importante.
<br/><br/>Una vez al mes realiza un viaje relámpago a una isla muy alejada, esa puede ser nuestra oportunidad para terminar con él.
<br/><br/>
</p>"]];


	
enableSentences false;

