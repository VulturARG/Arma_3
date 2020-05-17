removeallactions tv;
tv setobjecttextureglobal [0, "TV\Media Player\Pictures\screen.jpg"];
tv addAction ["Menu screen", "TV\Media Player\Scripts\screen.sqf"]; 
tv addAction ["Close Media Player", "TV\close.sqf"];




tv addAction ["Play Rap music", "TV\Media Player\Scripts\action1.sqf"]; 
tv addAction ["Play House music", "TV\Media Player\Scripts\action2.sqf"];
tv addAction ["Play Rock music", "TV\Media Player\Scripts\action3.sqf"];




tv say3D 'bip'; 