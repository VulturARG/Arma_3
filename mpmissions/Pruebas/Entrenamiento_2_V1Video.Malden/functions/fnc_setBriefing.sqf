///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

params["_recursos", "_enemigos", "_objetivos", "_situacion", "_extractoSinModificar", "_situacionReal", "_situacionHistorica", "_info"];

player createDiaryRecord["Diary", ["Editores", "<br/><p align='center'><font color='#44CC00' size='28'>Maxi e Ignacio</font></p><br/><img image= 'imgs\logo.paa' width='323' height='323'/><br/>"]];

player createDiaryRecord["Diary", ["Nuestros Recursos", ([_recursos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Fuerzas Enemigas", ([_enemigos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Objetivos", ([_objetivos, true] call MANDI_fnc_makeInfo)]];

//player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n", ([_situacion, false] call MANDI_fnc_makeInfo)]];

//player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n hist"+toString[243]+"rica", ([_situacionHistorica, false] call MANDI_fnc_makeInfo)]];

//player createDiaryRecord["Diary", ["Extracto sin modificar", ([_extractoSinModificar, false] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n real", ([_situacionReal, false] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Informaci"+toString[243]+"n", ([_info, true] call MANDI_fnc_makeInfo)]];

true;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
