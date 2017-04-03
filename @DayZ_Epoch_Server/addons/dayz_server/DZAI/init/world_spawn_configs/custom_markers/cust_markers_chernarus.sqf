/*
	Custom Marker Requirements:
	
	Spawn markers: The area covered by the marker will be used as the patrol and spawning area.
	
		1. Marker shape must be Ellipse (Could be rectangular but the function will consider the marker as elliptical regardless)
		2. Marker should have identical x and y dimensions. If they are different, the smaller dimension will be used instead.
	
	Blacklist markers: If a player is within this area, they will not be selected as a target for dynamic AI spawns.
	
		1. Marker shape may be Ellipse or Rectangle
		2. Marker dimensions should cover the area to be blacklisted.
	
	Example Marker (Note: the marker name must be unique! In this example, it's named "dzaicustomspawntest"):
	
	_this = createMarker ["dzaicustomspawntest", [6650.9883, 9411.541, -6.1035156e-005]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [200, 200];
	_this setMarkerAlpha 0;
	_dzaicustomspawntest = _this;		//_dzaicustomspawntest must be a unique name
	
	Note: This marker is used in the example found in the custom_spawns config files.
*/

//----------------------------Add your custom markers below this line ----------------------------



_this = createMarker ["Novy", [9324.17,11502,0.00137329]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [40, 40];
	_this setMarkerAlpha 0;
	_Novy = _this;	
	
	_this = createMarker ["Dichina", [4473.84,8291.04,0.00140381]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [40, 40];
	_this setMarkerAlpha 0;
	_Dichina = _this;	

	_this = createMarker ["NWAF1", [4165.21,10791.6,0.00143433]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [30, 30];
	_this setMarkerAlpha 0;
	_NWAF1 = _this;	
	
		_this = createMarker ["NWAF2", [4585.35,10433,0.00143433]];
	_this setMarkerShape "ELLIPSE";
	_this setMarkerType "Empty";
	_this setMarkerBrush "Solid";
	_this setMarkerSize [30, 30];
	_this setMarkerAlpha 0;
	_NWAF2 = _this;	
	
	
	//Qdoba City
	/*
	_this = createMarker ["Qdoba1", [4473.3506, 8569.3252, 9.1552734e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10]; _this setMarkerAlpha 0; _Qdoba1 = _this;
    _this = createMarker ["Qdoba2", [4414.8174, 8502.6533, 13.456329]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10];	_this setMarkerAlpha 0;	_Qdoba2 = _this;
    _this = createMarker ["Qdoba3", [4372.9541, 8604.3926, 16.643679]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10]; _this setMarkerAlpha 0; _Qdoba3 = _this;
    _this = createMarker ["Qdoba4", [4074.4199, 8627.6328, 0.000000000]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10]; _this setMarkerAlpha 0; _Qdoba4 = _this;
    _this = createMarker ["Qdoba5", [4057.6604, 8591.5439, 0]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10]; _this setMarkerAlpha 0; _Qdoba5 = _this;
    _this = createMarker ["Qdoba6", [4065.574, 8607.2803, 3.0517578e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10]; _this setMarkerAlpha 0; _Qdoba6 = _this;
    _this = createMarker ["Qdoba7", [4069.5039, 8618.4619, 6.1035156e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10]; _this setMarkerAlpha 0; _Qdoba7 = _this;
    _this = createMarker ["Qdoba8", [4034.1091, 8598.1855, 0]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10];	_this setMarkerAlpha 0;	_Qdoba8 = _this;
    _this = createMarker ["Qdoba9", [4046.5571, 8583.1963, 3.0517578e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10];	_this setMarkerAlpha 0;	_Qdoba9 = _this;
    _this = createMarker ["Qdoba10", [4079.7427, 8591.793, 0]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10]; _this setMarkerAlpha 0; _Qdoba10 = _this;
    _this = createMarker ["Qdoba11", [4102.689, 8618.4141, -0.00012207031]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10]; _this setMarkerAlpha 0; _Qdoba11 = _this;
    _this = createMarker ["Qdoba12", [4164.832, 8626.1973, -3.0517578e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10]; _this setMarkerAlpha 0; _Qdoba12 = _this;
    _this = createMarker ["Qdoba13", [4182.1699, 8569.6348, 9.1552734e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10];	_this setMarkerAlpha 0;	_Qdoba13 = _this;
    _this = createMarker ["Qdoba14", [4389.4707, 8677.584, 0]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10]; _this setMarkerAlpha 0; _Qdoba14 = _this;
    _this = createMarker ["Qdoba15", [4251.3823, 8591.6045, -9.1552734e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10]; _this setMarkerAlpha 0; _Qdoba15 = _this;
    _this = createMarker ["Qdoba16", [4213.0542, 8436.2031, -3.0517578e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10]; _this setMarkerAlpha 0; _Qdoba16 = _this;
    _this = createMarker ["Qdoba17", [4235.2007, 8427.5283, 0]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10];	_this setMarkerAlpha 0;	_Qdoba17 = _this;
    _this = createMarker ["Qdoba18", [4260.4355, 8431.7715, -3.0517578e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10]; _this setMarkerAlpha 0; _Qdoba18 = _this;
    _this = createMarker ["Qdoba19", [4344.1152, 8348.6875, -6.1035156e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10]; _this setMarkerAlpha 0; _Qdoba19 = _this;
    _this = createMarker ["Qdoba20", [4390.7388, 8376.7646, -6.1035156e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10]; _this setMarkerAlpha 0; _Qdoba20 = _this;
    _this = createMarker ["Qdoba21", [4399.1934, 8519.4805, 0]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10]; _this setMarkerAlpha 0; _Qdoba21 = _this;
    _this = createMarker ["Qdoba22", [4406.0049, 8555.9668, 3.0517578e-005]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10]; _this setMarkerAlpha 0; _Qdoba22 = _this;
    _this = createMarker ["Qdoba23", [4445.7148, 8499.3984, 0]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10];	_this setMarkerAlpha 0;	_Qdoba23 = _this;
    _this = createMarker ["Qdoba24", [4513.373, 8444.3164, 0]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [75, 10]; _this setMarkerAlpha 0; _Qdoba24 = _this;
    _this = createMarker ["Qdoba25", [4524.3301, 8593.1494, 0]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10]; _this setMarkerAlpha 0; _Qdoba25 = _this;
    _this = createMarker ["Qdoba26", [4524.3301, 8593.1494, 0]]; _this setMarkerShape "ELLIPSE"; _this setMarkerType "Empty"; _this setMarkerBrush "Solid"; _this setMarkerSize [50, 10]; _this setMarkerAlpha 0; _Qdoba26 = _this;
*/