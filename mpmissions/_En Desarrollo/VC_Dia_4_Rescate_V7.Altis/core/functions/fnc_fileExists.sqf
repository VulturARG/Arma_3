/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/

params ["_fileName"];

private _existsFile = true;
private _fileLoaded = "";

try{
	_fileLoaded = loadFile _fileName; }
catch{ 
	_existsFile = false;
};

if (_fileLoaded == "") then { _existsFile = false; };

_existsFile

/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/