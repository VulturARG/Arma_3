removeallactions tv;
tv setobjecttextureglobal [0, "TV\Twitter\Pictures\screen.jpg"];
tv addAction ["Close Twitter", "TV\close.sqf"];
tv addAction ["Menu screen", "TV\Twitter\Scripts\screen.sqf"]; 




tv addAction ["Read Tweets", "TV\Twitter\Scripts\action1.sqf"];
tv addAction ["View notifications", "TV\Twitter\Scripts\action2.sqf"];
tv addAction ["View top trending hashtag", "TV\Twitter\Scripts\action3.sqf"];
tv addAction ["Troll random pages", "TV\Twitter\Scripts\action4.sqf"];




tv say3D 'bip';  