private["_mouseWheelTurns","_return","_z"];

// ------------------ Parse Arguments -----------------

_mouseWheelTurns = _this select 1;

_return = false;

#define FACTOR 5

// ----------------------- Main Function ---------------------

_z = (_mouseWheelTurns * (-1));
if ((_z / (abs _z)) < 0) then
{
	if ((SAT_SatelliteZoom + (0.02 * FACTOR)) <= 47) then
	{
		SAT_SatelliteFOV = SAT_SatelliteFOV - (0.0005 * FACTOR);
		SAT_SatelliteZoom = SAT_SatelliteZoom + (0.02 * FACTOR);
		call SAT_updateCamera;
	};
}
else
{
	if ((SAT_SatelliteZoom - (0.02 * FACTOR)) >= 0.1) then
	{
		SAT_SatelliteFOV = SAT_SatelliteFOV + (0.0005 * FACTOR);
		SAT_SatelliteZoom = SAT_SatelliteZoom - (0.02 * FACTOR);
		call SAT_updateCamera;
	};
};
_return;