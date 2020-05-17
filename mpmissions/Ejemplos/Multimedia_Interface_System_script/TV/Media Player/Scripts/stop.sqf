detach media_player;
media_player setPos [1,1,1];
removeallactions tv;
nul = execVM "TV\Media Player\Scripts\openPlayer.sqf";
tv say3D 'bip'; 