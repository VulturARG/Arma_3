//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)
class FAM_pantallaFinal
{
	idd = -1;
	
	class ControlsBackground
	{
		class FONDO
		{
			type = 0;
			idc = -1;
			x = 0.00000023;
			y = 0.00000026;
			w = 1.00000004;
			h = 1.00000008;
			style = 80;
			text = "";
			colorBackground[] = {0,0,0,0.6428};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	class Controls
	{
		class boton_salida
		{
			type = 1;
			idc = -1;
			x = 0.40000018;
			y = 0.12500036;
			w = 0.22500001;
			h = 0.27500001;
			style = 0;
			text = "";
			borderSize = 0;
			colorBackground[] = {0.0392,0.7725,0.7176,0};
			colorBackgroundActive[] = {1,0,0,0};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,0};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,0};
			colorFocused[] = {0.2,0.2,0.2,0};
			colorShadow[] = {0,0,0,0};
			colorText[] = {0.9608,0.2275,0.2824,0};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			
		};
		class FAM
		{
			type = 0;
			idc = -1;
			x = 0.40000027;
			y = 0.12500035;
			w = 0.22500003;
			h = 0.27500001;
			style = 48+2048;
			text = "GUI\fam.paa";
			colorBackground[] = {0.6863,0.1608,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onLoad = "";
			onMouseButtonDown = "closeDialog 0;";
			
		};
		class texto
		{
			type = 0;
			idc = -1;
			x = 0;
			y = 0.025;
			w = 1;
			h = 0.10000005;
			style = 2;
			text = "RESULTADO FINAL";
			colorBackground[] = {1,1,1,0};
			colorText[] = {1,1,1,1};
			font = "PuristaSemiBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class objetivosPrimarios
		{
			type = 0;
			idc = 123401;
			x = safeZoneX + safeZoneW * 0.32708334;
			y = safeZoneY + safeZoneH * 0.45185186;
			w = safeZoneW * 0.12552084;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Objetivos Primarios: 1";
			colorBackground[] = {0.5765,0.2941,0.3647,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class objetivosSecundarios
		{
			type = 0;
			idc = 123402;
			x = safeZoneX + safeZoneW * 0.328125;
			y = safeZoneY + safeZoneH * 0.5;
			w = safeZoneW * 0.15052084;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Objetivos Secundarios: 2";
			colorBackground[] = {0.5765,0.2941,0.3647,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class tareasCompletas
		{
			type = 0;
			idc = 123403;
			x = safeZoneX + safeZoneW * 0.328125;
			y = safeZoneY + safeZoneH * 0.55;
			w = safeZoneW * 0.15052084;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Tareas: 3";
			colorBackground[] = {0.5765,0.2941,0.3647,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class vehiculosNeutralizados
		{
			type = 0;
			idc = 123404;
			x = safeZoneX + safeZoneW * 0.328125;
			y = safeZoneY + safeZoneH * 0.6;
			w = safeZoneW * 0.15052084;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Vehículos neutralizados: 4";
			colorBackground[] = {0.5765,0.2941,0.3647,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class bonoBandera
		{
			type = 0;
			idc = 123405;
			x = safeZoneX + safeZoneW * 0.328125;
			y = safeZoneY + safeZoneH * 0.65;
			w = safeZoneW * 0.15052084;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Bono bandera: 5";
			colorBackground[] = {0.5765,0.2941,0.3647,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class aliadosBajas
		{
			type = 0;
			idc = 123406;
			x = safeZoneX + safeZoneW * 0.5265625;
			y = safeZoneY + safeZoneH * 0.45092593;
			w = safeZoneW * 0.10052084;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Bajas aliadas: 6";
			colorBackground[] = {0.5765,0.2941,0.3647,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class civilesBajas
		{
			type = 0;
			idc = 123407;
			x = safeZoneX + safeZoneW * 0.52760417;
			y = safeZoneY + safeZoneH * 0.50092593;
			w = safeZoneW * 0.10052084;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Bajas civiles: 7";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class vehiculosPerdidos
		{
			type = 0;
			idc = 123408;
			x = safeZoneX + safeZoneW * 0.528125;
			y = safeZoneY + safeZoneH * 0.54907408;
			w = safeZoneW * 0.15052084;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Vehículos perdidos: 8";
			colorBackground[] = {0.5765,0.2941,0.3647,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class penaBandera
		{
			type = 0;
			idc = 123409;
			x = safeZoneX + safeZoneW * 0.528125;
			y = safeZoneY + safeZoneH * 0.64907408;
			w = safeZoneW * 0.15052084;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Penalización Bandera: 9";
			colorBackground[] = {0.5765,0.2941,0.3647,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class puntajeFinal
		{
			type = 0;
			idc = 123410;
			x = safeZoneX + safeZoneW * 0.428125;
			y = safeZoneY + safeZoneH * 0.725;
			w = safeZoneW * 0.15052084;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "PUNTAJE FINAL: 10";
			colorBackground[] = {0.5765,0.2941,0.3647,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	
};



//action = "closeDialog 0; ""EveryoneWon"" call BIS_fnc_endMissionServer;";