///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////

private _posicion = [8065.88,10018.2,1];

for[{private _i = 5;}, {_i >=0;}, {_i = _i -1;}]do
{
    sleep 1;
    hint format["Cámara en  %1 seg.", _i];
};

_camera = "camera" camCreate _posicion;
_camera cameraEffect ["internal", "back"];

_camera camPrepareTarget camara;
_camera camPreparePos _posicion;
_camera camPrepareFov 0.8;
_camera camCommitPrepared 0;

sleep 5;

titleCut ["Intercambio Justo","BLACK OUT",2];
_camera cameraEffect ["terminate", "back"];
camDestroy _camera;
titleCut [" ","BLACK IN",2];

hint "Cámara finalizada";

///////////////////////////////////////////////////////////////////
///////////Realizado por |ArgA|Ignacio//////////////
//////////////////////////////////////////////////////////////////
