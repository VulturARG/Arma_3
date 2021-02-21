_string = "";
for "_i" from 0 to 10000 do { 
	for "_i" from 0 to 9 do { 
		_string = _string + str _i; 
	};
};
hint (_string select [99998,1]);
