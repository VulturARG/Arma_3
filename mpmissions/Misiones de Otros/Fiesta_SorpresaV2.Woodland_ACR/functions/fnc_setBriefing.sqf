params["_recursos", "_enemigos", "_objetivos", "_situacion", "_extractoSinModificar", "_situacionReal", "_situacionHistorica", "_info", "_imagenes", "_editores"];

player createDiaryRecord["Diary", ["Editores", "<br/><p align='center'><font color='#76a8f7' size='28'>"
+_editores+"</font></p><br/><img image= 'imgs\LogoArgA.jpg' width='303' height='303'/><br/>"]];

player createDiaryRecord["Diary", ["Imagenes", "<br/><p align='center'><font color='#ffffff' size='28'>"
+_imagenes+"</font></p><br/><img image= 'imgs\Fotografia1.jpg' width='303' height='303'/><img image= 'imgs\Fotografia2.jpg' width='303' height='303'/><br/>"]];

player createDiaryRecord["Diary", ["Nuestros Recursos", ([_recursos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Fuerzas Enemigas", ([_enemigos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Objetivos", ([_objetivos, true] call MANDI_fnc_makeInfo)]];

if((_extractoSinModificar select 0) != "")then{
  player createDiaryRecord["Diary", ["Extracto sin modificar", ([_extractoSinModificar, false] call MANDI_fnc_makeInfo)]];
};

player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n", ([_situacion, false] call MANDI_fnc_makeInfo)]];

if((_situacionHistorica select 0) != "")then{
  player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n hist"+toString[243]+"rica", ([_situacionHistorica, false] call MANDI_fnc_makeInfo)]];
};

if((_situacionReal select 0) != "")then{
  player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n real", ([_situacionReal, false] call MANDI_fnc_makeInfo)]];
};

player createDiaryRecord["Diary", ["Informaci"+toString[243]+"n", ([_info, true] call MANDI_fnc_makeInfo)]];

true;

