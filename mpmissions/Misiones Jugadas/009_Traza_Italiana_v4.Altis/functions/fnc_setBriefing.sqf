/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/

private _colorAuthor = getMissionConfigValue ["COLOR_AUTOR", "#76a8f7"];
private _logo = getMissionConfigValue ["IMG_LOGO", "imgs\PlacaVulturII.paa"];

params["_recursos", "_enemigos", "_objetivos", "_situation", "_extractodeInteligencia", "_storySituation", "_info", "_editores"];

player createDiaryRecord["Diary", ["Editor", "<br/><p align='center'><font color='"+_colorAuthor+"' size='28'>"+_editores+"</font></p><br/><t align='center'><img image= '"+_logo+"' width='256' height='256'/></t><br/>"]];

//Add when generalizable
/*player createDiaryRecord["Diary", ["Imagenes", "<br/><p align='center'><font color='#ffffff' size='28'>"
+_imagenes+"</font></p><br/><br/>"]];*/

player createDiaryRecord["Diary", ["Nuestros Recursos", ([_recursos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Fuerzas Enemigas", ([_enemigos, true] call MANDI_fnc_makeInfo)]];

player createDiaryRecord["Diary", ["Objetivos", ([_objetivos, true] call MANDI_fnc_makeInfo)]];

if((_extractodeInteligencia select 0) != "") then {
  player createDiaryRecord["Diary", ["Extracto de Inteligencia", ([_extractodeInteligencia, false] call MANDI_fnc_makeInfo)]];
};

if((_situation select 0) != "") then {
  player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n", ([_situation, false] call MANDI_fnc_makeInfo)]];
};

if((_storySituation select 0) != "") then {
  player createDiaryRecord["Diary", ["Situaci"+toString[243]+"n hist"+toString[243]+"rica", ([_storySituation, false] call MANDI_fnc_makeInfo)]];
};
player createDiaryRecord["Diary", ["Informaci"+toString[243]+"n", ([_info, true] call MANDI_fnc_makeInfo)]];

true;

/*******************************************************************************
                          Realizado por |ArgA|Ignacio
*******************************************************************************/
