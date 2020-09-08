_starL  = "<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa' align='left'/>";
_starL  = _starL;
_starR  = "<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa' align='right'/>";
_starR  = _starR;

_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>Você morreu!!</t>";
_text   = "<br />Espere 1 minuto para voltar a partida...";

hint parseText (_starL + _starR + _title + _text);

	0 enableChannel [false, false];
	1 enableChannel [false, false];
	2 enableChannel [false, false];
	3 enableChannel [false, false];
	4 enableChannel [false, false];
	5 enableChannel [false, false];
	6 enableChannel [false, false];
