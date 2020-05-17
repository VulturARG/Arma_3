

[] execVM "scripts\setBriefing.sqf";
call compile preprocessFileLineNumbers "Engima\Civilians\Init.sqf";

MAC_fnc_switchMove =
{
   private["_object","_anim"];
   _object = _this select 0;
   _anim = _this select 1;
 
   _object switchMove _anim;
};
	
enableSentences false;


// Deshabilita el radio largo alcance automatico en mochila
tf_no_auto_long_range_radio = true;
TF_give_microdagr_to_soldier = false;

// FLARE FIX - recommended for vanilla missions and assets only, with mods you might have problems

// flare intensity, replace 30 with desired value
al_flare_intensity = 50;
publicvariable "al_flare_intensity";

// flare range, replace 500 with desired value
al_flare_range = 300;
publicvariable "al_flare_range";

al_mortar_flare_intensity = 400;
publicvariable "al_mortar_flare_intensity";

al_mortar_flare_range = 550;
publicvariable "al_mortar_flare_range";

// If you want to use FLARE FIX do not edit or remove lines bellow
player addEventHandler ["Fired",{private ["_al_flare"]; _al_flare = _this select 6;[[_al_flare],"AL_flare_fix\al_flare_enhance.sqf"] remoteExec ["execVM",0,true]}];

// FOR vanilla mortars place this line inside their init field.
// this addEventHandler ["Fired",{private ["_al_flare"]; _al_flare = _this select 6;[[_al_flare],"AL_flare_fix\al_flare_enhance.sqf"] remoteExec ["execVM",0,true]}];


if(isServer && isNil "init_done") then 
{
	fn_EnfermarATodos = {
	[] execVM "scripts\enfermarATodos.sqf";
	};
	[] remoteExec ["fn_EnfermarATodos", 0, true];
	init_done = true;
};

