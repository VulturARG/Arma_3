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
1. Destruir antena de comunicaciones (Dar 1) <font color='#ffcc00'>(2 pts)</font><br/>
<br/><br/>
2. Colocar explosivos y detonar en estación de combustible (camión de combustible) (Tdis 1) <font color='#ffcc00'>(2 pts)</font><br/>
<br/><br/>
3. Colocar explosivos y detonar en estacionamiento (SUV de Onyekuru) (Tdis 2) <font color='#ffcc00'>(2 pts)</font><br/>
<br/><br/>
</p>"]];

//Objetivos secundarios
player createDiaryRecord["Diary", ["Objetivos Secundarios", "<p align='center'> 
<br/><font size='18' color='#29a329'>- Secundarios: </font>
<br/>
1. Tomar caja con armas en Base B.L.A.S. (Tas 1) y llevarlos a Larete.<font color='#ffcc00'>(4 pts)</font><br/>
2. Tomar caja con uniformes en depósito B.L.A.S (Tas 2) y llevarlos a Larete. <font color='#ffcc00'>(4 pts)</font>
<br/><br/>
</p>"]];



// Objetivos
player createDiaryRecord["Diary", ["Objetivos", "<p align='center'> 
<br/><font size='18' color='#29a329'>- Principal:</font>
<br/>
<font size='14' color='#ffffff'>1. Rescatar de su cautiverio a Bastian Mc Douglas y llevarlo Base</font> <font size='18' color='#ffcc00'>(15 pts)</font>
<br/><br/></font>
<font size='14' color='#ffffff'>2. Eliminar a Yamil Obi Mikel (estará condicionado por la liberación de Bastian Mc Douglas</font> <font size='18' color='#ffcc00'>(5 pts)</font>
<br/><br/></font>
<img image='1.jpg' align='center' width='367' height='407' />
</p>"]];

player createDiaryRecord["Diary", ["Recursos en base", 
"<p align='justify'>
2 MH-6M Little Bird. Uno Médico
<br/><br/>
2 lanchas tipo RHIB. Una médica
<br/><br/>Pequeñas cajas limitadas en armamento en base
<br/><br/>
</p>"]];


player createDiaryRecord["Diary", ["Informaci"+toString[243]+"n Tactica - Parte 2", 
"<p align='justify'>
<br/><br/>A posterior, se dirigirán a la residencia de Torcuato Rocco, al sur de Minanga (Pa 2), donde Torcuato les entregará a Yamil Obi Mikel y una caja con ropa similar a la de Mikel
Éste será llevado esposado en vehículos que Torcuato ha conseguido para la infiltración (Land Rovers y camionetas offroad) 
<br/><br/>Al Este de Bibung (Pa 3) se deberá dejar a Yamil Obi Mikel esposado, y un operativo deberá tomar el uniforme de la caja y caracterizarse como él.
<br/><br/>Llevar al “falso Mikel” esposado dentro de los vehículos, al principal puesto del B.L.A.S. y residencia más fuerte de Sempala Onyekuru, al norte de Loholoho (Ob 1).
<br/><br/>Sempala espera con ánsia la llegada de su prisionero por la calle oeste de la residencia y si o si con la mayor cantidad de efectivos que cuenten. Cualquier infiltrado fuera de lugar será sospechado y puede ser el fin de todo el equipo, de Bastian Mc Douglas y de Torcuato Rocco.
<br/><br/>Nuestro VIP (Mc Douglas) estará en el calabozo con guardias pegado a la residencia principal (Ob 2). Ahí se deberá llegar con el “falso Mikel” para simular el cambio de prisioneros.
<br/><br/>Antes de ingresar al edificio se recomienda crear tareas de distracción colocando sin despertar sospecha minas con detonación controladas en los vehículos de la estación de combustible (Tdis 1) y en el estacionamiento (Tdis 2)
<br/><br/>Prepararse para el momento X, que será cuando se hará el “intercambio” de prisioneros, o el rescate de Bastian.
<br/><br/>Preparar los vehículos que utilizaremos para salir de la zona en un sector que consideremos apto
<br/><br/>Liberar a nuestro “falso Mikel” disimuladamente para que combata con el equipo.
<br/><br/>Detonar los explosivos e inmediatamente sacar a nuestro VIP y salir de la zona.
<br/><br/>Si logran sacar del cautiverio a Bastian Mc Douglas, la unidad deberá eliminar al verdadero Yamil Obi Mikel  ya que si este cae en manos de Sempala Onyekuru nuestras próximas acciones estarán en riesgo.
<br/><br/>Nota : Cabe la posibilidad de encontrar en la zona de Loholoho o en su mansión la presencia de Sempala Onyekuru, la unidad no está autorizada a tomar ningún tipo de acción en contra del mismo.
<br/><br/>
</p>"]];


player createDiaryRecord["Diary", ["Informaci"+toString[243]+"n Tactica - Parte 1", 
"<p align='justify'>
<br/><br/>El mando conjunto del Teatro de Operaciones N°1 de la F.A.M., ha ordenado desplegar su unidad de inmediato en una base aliada de la ONU en las Islas Bajuni, con el objeto de realizar operaciones de infiltración en zonas enemigas y realizar el rescate de Bastian Mc Douglas.
<br/><br/>Haciendo uso de los helicópteros o de las Lanchas ubicadas en Base, deberán dirigirse a la localidad de Larete donde nuestro contacto local Poncho (Pa 1) les proveerá de dos vehículos tipo Land Rover para poder tomar armamento y uniformes enemigos y así poder infiltrarse posteriormente en sus filas.
<br/><br/>Previo al ataque de las pequeñas bases enemigas, se deberá cortar la comunicación entre la isla Pulau Monyet y Pulau Gurun y así evitar que la base principal sospeche de nuestra incursión posterior
La antena se encuentra al oeste de Tinobu (Dar 1)
<br/><br/>En la base de la antena (Tas 1) se encuentran las armas que debemos tomar. Están dentro de las barracas en una caja (tomar la caja completa)
<br/><br/>En simultáneo, para evitar comunicaciones por radio entre bases, tomar la caja de uniformes (caja completa), en Nirwana (Tas 2)
<br/><br/>Una vez tomadas las cajas dirigirse nuevamente a Larete (Pa 1) donde se devolverán los vehículos y procederán a cambiarse los uniformes y armas para simular los atuendos del B.L.A.S.
<br/><br/>
</p>"]];

// Situación
player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n", 
"<p align='justify'>
Distintos sucesos han ocurrido desde el secuestro de Bastian Mc Douglas.
<br/><br/>Se ha sabido que Menelik Okocha (el Indio mudo) fue asesinado a manos del B.L.A.S. cuando huía de Islas Bajuni en su lancha pesquera llevando una caja llena de dinero.
<br/><br/>El bombardeo realizado a la base del B.L.A.S. en el Delta del Río Niger no solo provocó acciones de venganza por parte de Sempala Onyekuru, si no que provocó una fractura en los mandos del B.L.A.S. tras la pérdida de los cargamentos de drogas y armas en aquel ataque.
<br/><br/>Yamil Obi Mikel, segundo lugar teniente de Sempala Onyekuru a desertado del B.L.A.S. llevándose grandes sumas de dinero, oro y joyas; traicionando a su jefe, quien pretende tomar venganza cortando su cabeza.
<br/><br/>Todavía contamos con nuestro contacto en Somalia, Poncho, quien nos contactó con un Empresario Ítalo Americano dedicado al cultivo de la caña de azúcar en Islas Bajuni, Torcuato Rocco quien dice no lograr expandir su actividad por culpa de Sempala Onyekuru y ser él quien tiene retenido a Yamil Obi Mikel 
<br/><br/>Torcuato Rocco acordó con Sempala Onyekuru la entrega de Yamil Obi Mikel a cambio de Bastian Mc Douglas y algunos negociados que no tenemos información, pero referentes a la producción e impuestos de la caña de azúcar.
<br/><br/>
</p>"]];


	
enableSentences false;

