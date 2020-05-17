removeallactions tv;
tv setobjecttextureglobal [0, "TV\Facebook\Pictures\screen.jpg"];
tv addAction ["Close Facebook", "TV\close.sqf"];
tv addAction ["Menu screen", "TV\Facebook\Scripts\screen.sqf"]; 




tv addAction ["Open home page", "TV\Facebook\Scripts\action1.sqf"];
tv addAction ["View profiles", "TV\Facebook\Scripts\action2.sqf"]; 
tv addAction ["Send private messages", "TV\Facebook\Scripts\action3.sqf"]; 
tv addAction ["Browse games", "TV\Facebook\Scripts\action4.sqf"];




tv say3D 'bip'; 