// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_HITZONES         17
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_ITEMSLOT         103
#define CT_CHECKBOX         77

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0
#define ST_UPPERCASE      0xC0
#define ST_LOWERCASE      0xD0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar 
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4
#define MB_ERROR_DIALOG   8

// Fonts
#define GUI_FONT_NORMAL			PuristaMedium
#define GUI_FONT_BOLD			PuristaSemibold
#define GUI_FONT_THIN			PuristaLight
#define GUI_FONT_MONO			EtelkaMonospacePro
#define GUI_FONT_NARROW			EtelkaNarrowMediumPro
#define GUI_FONT_CODE			LucidaConsoleB
#define GUI_FONT_SYSTEM			TahomaB

// Grids
#define GUI_GRID_CENTER_WAbs		((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs		(GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W		(GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H		(GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X		(safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y		(safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)

class MED_RscText //Text Resource Class
{
    access = 0;
    type = 0;
    idc = -1;
    colorBackground[] = {0.75,0.75,0.75,1};
    colorText[] = {1,1,1,1};
    text = "";
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    style = 2;
    shadow = 2;
    font = GUI_FONT_NORMAL;
    sizeEx = "0.02/ (getResolution select 5)";
};

class RscCombo //Combo Resource Class
{
	access = 0;
	type = CT_COMBO;
	style = ST_LEFT + LB_TEXTURES;
	h = 0.05;
	default = 0; // Control selected by default (only one within a display can be used)
	blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.
	wholeHeight = 0.25;
	colorSelect[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.2,0.2,0.2,1};
	colorDisabled[] = {1,1,1,0.5}; // Disabled text color
	colorScrollbar[] = {1,1,1,1};
	colorSelectBackground[] = {0,0.5,0.5,1}; // Selected item fill color
	font = GUI_FONT_NORMAL; // Font from CfgFontFamilies
	sizeEx = 0.02/ (getResolution select 5);
	pictureColor[] = {0,0.5,0.5,1}; // Picture color
	pictureColorSelect[] = {1,1,1,1}; // Selected picture color
	pictureColorDisabled[] = {1,1,1,0.5}; // Disabled picture color
	tooltip = ""; // Tooltip text
	tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
	tooltipColorText[] = {1,1,1,1}; // Tooltip text color
	tooltipColorBox[] = {0,0.5,0.5,1}; // Tooltip frame color
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1}; // Sound played when the list is expanded
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1}; // Sound played when the list is collapsed
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1}; // Sound played when an item is selected
	maxHistoryDelay = 1.0;
	shadow = 0;
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa"; // Expand arrow
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa"; // Collapse arrow
	class ComboScrollBar
	{
		width = 0; // width of ComboScrollBar
		height = 0; // height of ComboScrollBar
		scrollSpeed = 0.01; // scrollSpeed of ComboScrollBar

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

		color[] = {1,1,1,1}; // Scrollbar color
	};
};

class RscSlider //Slider Resource Class
{
	access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
	type = CT_XSLIDER; // Type
	style = SL_HORZ; // Style
	default = 0; // Control selected by default (only one within a display can be used)
	blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.
	color[] = {1,1,1,1}; // Text and arrow color
	colorDisabled[] = {1,1,1,0.5}; // Disabled text and arrow color
	colorActive[] = {0,0.5,0.5,1}; // Text selection color
	tooltip = ""; // Tooltip text
	tooltipColorShade[] = {0,0,0,0.7}; // Tooltip background color
	tooltipColorText[] = {1,1,1,1}; // Tooltip text color
	tooltipColorBox[] = {0,0.5,0.5,1}; // Tooltip frame color
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa"; // Arrow
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa"; // Arrow when clicked on
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa"; // Fill texture
	thumb = "#(argb,8,8,3)color(1,1,1,1)"; // Dragging element (stretched vertically)
	class Title // Link to a title (obsolete?)
	{
		idc = -1; // Control IDC (has to be defined ABOVE the slider control)
		colorBase[] = {1,1,1,1}; // Text color
		colorActive[] = {0,0.5,0.5,1}; // Text color when the slider is active
	};
	class Value // Link to a control which will show slider value
	{
		idc = -1; // Control IDC (has to be defined ABOVE the slider control)
		format = "%.f"; // Text format, value is represented by variable %g (float) or %.f (integer)
		type = SPTPlain; // Format, can be SPTPlain or SPTPercents (multiplies the value by 100)
		colorBase[] = {1,1,1,1}; // Text color
		colorActive[] = {0,0.5,0.5,1}; // Text color when the slider is active
	};
};

/*
class RscSlider
{
	access = 0;
	type = 3;
	style = 1024;
	w = 0.3;
	color[] = {1,1,1,0.8};
	colorActive[] = {1,1,1,1};
	shadow = 0;
	h = 0.025;
};*/
class RscButton //Button Resource Class
{
	access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
	type = CT_BUTTON; // Type
	style = ST_LEFT; // Style
	default = 1; // Control selected by default (only one within a display can be used)
	blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.
	colorBackground[] = {0.2,0.2,0.2,1}; // Fill color
	colorBackgroundDisabled[] = {0,0,0,0.5}; // Disabled fill color
	colorBackgroundActive[] = {0,0,0,1}; // Mouse hover fill color
	colorFocused[] = {0,0.5,0.5,1}; // Selected fill color (oscillates between this and colorBackground)
	text = "CT_BUTTON"; // Displayed text
	sizeEx = GUI_GRID_CENTER_H; // Text size
	font = GUI_FONT_NORMAL; // Font from CfgFontFamilies
	shadow = 1; // Shadow (0 - none, 1 - N/A, 2 - black outline)
	colorText[] = {1,1,1,1}; // Text color
	colorDisabled[] = {1,1,1,0.5}; // Disabled text color
	tooltip = ""; // Tooltip text
	tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
	tooltipColorText[] = {1,1,1,1}; // Tooltip text color
	tooltipColorBox[] = {0,0.5,0.5,1}; // Tooltip frame color
	borderSize = 0.01; // Left color width (border is a stripe of the control height on the left side)
	colorBorder[] = {1,1,1,1}; // Left border color
	colorShadow[] = {0,0,0,0.2}; // Background frame color
	offsetX = 0.0075; // Horizontal background frame offset
	offsetY = 0.01; // Vertical background frame offset
	offsetPressedX = 0.0075; // Horizontal background offset when pressed
	offsetPressedY = 0.01; // Horizontal background offset when pressed
	period = 1; // Oscillation time between colorBackground and colorFocused when selected
	periodFocus = 2; // Unknown?
	periodOver = 0.5; // Unknown?
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1}; // Sound played after control is activated in format {file, volume, pitch}
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1}; // Sound played when mouse cursor enters the control
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1}; // Sound played when the control is pushed down
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1}; // Sound played when the control is released after pushing down
};
class med_menu{
	idd = 1000;
	movingEnable = 0;
	onLoad = "[] spawn MED_menuOnLoad;";
	class Controls
	{	
		class s_inj_lev_head: RscSlider
		{
			idc = 1900;
			tooltip = " Altos valores => Ferimentos graves | AJUSTE COM MODERAÇÃO PARA NÃO MATAR O VOLUNTARIO";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "sliderNr = 0; call MED_setSliderValue; false";
		};
		class s_inj_lev_body: RscSlider
		{
			idc = 1901;
			tooltip = " Altos valores => Ferimentos graves | AJUSTE COM MODERAÇÃO PARA NÃO MATAR O VOLUNTARIO";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "sliderNr = 1; call MED_setSliderValue; false";
		};
		class s_inj_lev_hand_r: RscSlider
		{
			idc = 1902;
			tooltip = " Altos valores => Ferimentos graves | AJUSTE COM MODERAÇÃO PARA NÃO MATAR O VOLUNTARIO";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "sliderNr = 2; call MED_setSliderValue; false";
		};
		class s_inj_lev_hand_l: RscSlider
		{
			idc = 1903;
			tooltip = " Altos valores => Ferimentos graves | AJUSTE COM MODERAÇÃO PARA NÃO MATAR O VOLUNTARIO";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "sliderNr = 3; call MED_setSliderValue; false";
		};
		class s_inj_lev_leg_r: RscSlider
		{
			idc = 1904;
			tooltip = " Altos valores => Ferimentos graves | AJUSTE COM MODERAÇÃO PARA NÃO MATAR O VOLUNTARIO";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "sliderNr = 4; call MED_setSliderValue; false";
		};
		class s_inj_lev_leg_l: RscSlider
		{
			idc = 1905;
			tooltip = " Altos valores => Ferimentos graves | AJUSTE COM MODERAÇÃO PARA NÃO MATAR O VOLUNTARIO";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			onSliderPosChanged = "sliderNr = 5; call MED_setSliderValue; false";
		};
		class c_inj_typ_head: RscCombo
		{
			idc = 2100;
			tooltip = "Escolha entre muitos tipos de ferimentos";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;

		};
		class c_inj_typ_body: RscCombo
		{
			idc = 2101;
			tooltip = "Escolha entre muitos tipos de ferimentos";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;

		};
		class c_inj_typ_hand_r: RscCombo
		{
			idc = 2102;
			tooltip = "Escolha entre muitos tipos de ferimentos";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;

		};
		class c_inj_typ_hand_l: RscCombo
		{
			idc = 2103;
			tooltip = "Escolha entre muitos tipos de ferimentos";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;

		};
		class c_inj_typ_leg_r: RscCombo
		{
			idc = 2104;
			tooltip = "Escolha entre muitos tipos de ferimentos";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;

		};
		class c_inj_typ_leg_l: RscCombo
		{
			idc = 2105;
			tooltip = "Escolha entre muitos tipos de ferimentos";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;

		};
		class b_app_new: RscButton
		{
			idc = 1600;
			tooltip = "Aplicar dano ao voluntario";
			text = "Aplicar dano";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
			action = "[call MED_volunt] spawn MED_add_dmg; false";
		};
		class b_app_ex: RscButton
		{
			idc = 1601;
			tooltip = "Curar o voluntario";
			text = "Curar";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
			action = "[call MED_volunt] spawn MED_cura; false";
		};
		class b_close: RscButton
		{
			idc = 1602;
			text = "Fechar";
			x = 0.712031 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.044 * safezoneH;
			action = "closeDialog 0;";
		};
	};
	class ControlsBackground
	{
		class t_bg: MED_RscText
		{
			idc = 1000;
			colorBackground[] = {0.25,0.25,0.25,0.8};
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.572344 * safezoneW;
			h = 0.715 * safezoneH;
		};
		class t_header_bg: MED_RscText
		{
			idc = 1001;
			colorBackground[] = {0,0,0,0};
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class t_header: MED_RscText
		{
			idc = 1002;
			sizeEx = "0.03/ (getResolution select 5)";
			text = "Treinamento médico";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class t_inj_bdy_prt_bg: MED_RscText
		{
			idc = 1003;
			colorBackground[] = {0,0,0,0};
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class t_inj_bdy_prt: MED_RscText
		{
			idc = 1004;
			font = GUI_FONT_BOLD;
			text = "Partes do corpo:";
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class t_inj_lev_bg: MED_RscText
		{
			idc = 1005;
			colorBackground[] = {0,0,0,0};
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class t_inj_lev: MED_RscText
		{
			idc = 1006;
			font = GUI_FONT_BOLD;
			text = "Nivel de ferimento:";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class t_inj_typ_bg: MED_RscText
		{
			idc = 1007;
			colorBackground[] = {0,0,0,0};
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class t_inj_typ: MED_RscText
		{
			idc = 1008;
			font = GUI_FONT_BOLD;
			text = "Tipo de ferimento:";
			x = 0.60828 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class t_bdy_prt_head: MED_RscText
		{
			idc = 1009;
			text = "Cabeça";
			colorBackground[] = {0,0,0,0};
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class t_bdy_prt_body: MED_RscText
		{
			idc = 1010;
			text = "Corpo";
			colorBackground[] = {0,0,0,0};
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class t_bdy_prt_hand_r: MED_RscText
		{
			idc = 1011;
			text = "Braço direito";
			colorBackground[] = {0,0,0,0};
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class t_bdy_prt_hand_l: MED_RscText
		{
			idc = 1012;
			text = "Braço esquerdo";
			colorBackground[] = {0,0,0,0};
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class t_bdy_prt_leg_r: MED_RscText
		{
			idc = 1013;
			text = "Perna direita";
			colorBackground[] = {0,0,0,0};
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class t_bdy_prt_leg_l: MED_RscText
		{
			idc = 1014;
			text = "Perna esquerda";
			colorBackground[] = {0,0,0,0};
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class t_inj_lev_head: MED_RscText
		{
			idc = 1015;
			text = "0";
			colorBackground[] = {0,0,0,0};
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class t_inj_lev_body: MED_RscText
		{
			idc = 1016;
			text = "0";
			colorBackground[] = {0,0,0,0};
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class t_inj_lev_hand_r: MED_RscText
		{
			idc = 1017;
			text = "0";
			colorBackground[] = {0,0,0,0};
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class t_inj_lev_hand_l: MED_RscText
		{
			idc = 1018;
			text = "0";
			colorBackground[] = {0,0,0,0};
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class t_inj_lev_leg_r: MED_RscText
		{
			idc = 1019;
			text = "0";
			colorBackground[] = {0,0,0,0};
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class t_inj_lev_leg_l: MED_RscText
		{
			idc = 1020;
			text = "0";
			colorBackground[] = {0,0,0,0};
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
