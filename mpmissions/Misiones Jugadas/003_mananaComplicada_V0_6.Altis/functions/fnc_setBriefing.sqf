///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

params["_recursos", "_enemigos", "_objetivos", "_situacion", "_situacionGeneral", "_info", "_editores", "_instrucciones"];

player createDiaryRecord["Diary", ["Editor", "<br/><p align='center'><font color='#76a8f7' size='28'>"+_editores+"</font></p><br/><img image= 'imgs\logo.paa' width='323' height='323'/><br/>"]];
//player createDiaryRecord["Diary", ["Editores", "<br/><p align='center'><font color='#76a8f7' size='28'>|ArgA|Vultur|Sdo¹</font></p><br/><img image= 'imgs\logo.paa' width='323' height='323'/><br/>"]];

player createDiaryRecord["Diary", ["TabletaGPS", ([_instrucciones, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Nuestros Recursos", ([_recursos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Fuerzas Enemigas", ([_enemigos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Objetivos", ([_objetivos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n", ([_situacion, false] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n General", ([_situacionGeneral, false] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Informaci"+toString[243]+"n", ([_info, true] call MANDI_fnc_makeInfo)]];

true;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
