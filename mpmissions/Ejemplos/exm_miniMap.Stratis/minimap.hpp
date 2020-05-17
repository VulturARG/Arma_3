
class myMap
{

	idd = 20000;
	duration = 1e10;
	fadein = 0;
	fadeout = 0;

	class controlsBackground
	{

		class theMiniMap : RscMapControl
		{

			idc = 38555;
			type = 101;
			style = 48;
			moveOnEdges = 0;
			x = 0.2 * safeZoneX;
			y = 0.2 * safeZoneY;
			w = 0.6 * safeZoneW;
			h = 0.6 * safeZoneH;

			onDraw = "_this call fnc_updateMiniMap";
		};

	};
};