
private mnt = [
	mnt_02,
	mnt_03,
	mnt_04,
	mnt_05
];

private cam_r = [];

private cam_array = [
	cam_2,
	cam_3,
	cam_4,
	cam_5
];

{
	mnt select _forEachIndex setObjectTextureGlobal [0, "#(argb,512,512,1)r2t(rtt"+_forEachIndex+",1.0)"];

	cam_r append ["camera"+_forEachIndex camCreate [0,0,0]];
	
	cam_r select _forEachIndex cameraEffect ["External", "Back", "rtt"+_forEachIndex];
	
	cam_r select _forEachIndex attachTo [cam_array select _forEachIndex, [0,0,0]]; 
}forEach mnt;

