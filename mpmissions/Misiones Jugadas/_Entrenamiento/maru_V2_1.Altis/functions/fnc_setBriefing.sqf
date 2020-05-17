///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

params["_recursos", "_enemigos", "_objetivos", "_situacion", "_situacionGeneral", "_info", "_editores"];

player createDiaryRecord["Diary", ["Editores", "<br/><p align='center'><font color='#76a8f7' size='28'>|ArgA|Vultur|Sdo</font></p><br/>"]];

player createDiaryRecord["Diary", ["Nuestros Recursos", ([_recursos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Fuerzas Enemigas", ([_enemigos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Objetivos", ([_objetivos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n", ([_situacion, false] call MANDI_fnc_makeInfo)]];

if((_situacionGeneral select 0) != "")then{
  player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n general", ([_situacionGeneral, false] call MANDI_fnc_makeInfo)]];
};

if((_extractoSinModificar select 0) != "")then{
  player createDiaryRecord["Diary", ["Extracto sin modificar", ([_extractoSinModificar, false] call MANDI_fnc_makeInfo)]];
};

if((_situacionReal select 0) != "")then{
  player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n real", ([_situacionReal, false] call MANDI_fnc_makeInfo)]];
};

player createDiaryRecord["Diary", ["Informaci"+toString[243]+"n", ([_info, true] call MANDI_fnc_makeInfo)]];

true;

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
