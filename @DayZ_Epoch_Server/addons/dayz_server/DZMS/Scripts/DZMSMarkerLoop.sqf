/*
	Marker Resetter by Vampire
	Marker Resetter checks if a Mission is running and resets the marker for JIPs
*/
private["_run","_nul","_nil"];

diag_log text format ["[DZMS]: Mission Marker Loop for JIPs Starting!"];

//Lets start the timer
_run = true;
while {_run} do
{
    [25,5] call DZMSSleep; // sleep 25 seconds
	//If the marker exists (meaning the mission is active) lets delete it and re-add it
	for "_x" from 1 to DONN_DZMS_Maj_n do {
		private ["_code","_codeMark","_codeDot"];
		_code = _x;
		_codeMark = format ["DZMSMajMarker%1", _x];
		_codeDot = format ["DZMSMajDot%1", _x];
		if (!(getMarkerColor _codeMark == "")) then {
			deleteMarker _codeMark;
			deleteMarker _codeDot;
			//Re-Add the markers
			_nul = createMarker [_codeMark, call compile format ["DZMSMajCoords%1", _code]];
			_codeMark setMarkerColor "ColorRed";
			_codeMark setMarkerShape "ELLIPSE";
			_codeMark setMarkerBrush "Grid";
			_codeMark setMarkerSize [175,175];
			_zap = createMarker [_codeDot, call compile format ["DZMSMajCoords%1", _code]];
			_codeDot setMarkerColor "ColorBlack";
			_codeDot setMarkerType "Vehicle";
			_codeDot setMarkerText (call compile format ["DZMSMajName%1", _code]);
		};
	};
	//Lets do the same for the minor mission
	for "_x" from 1 to DONN_DZMS_Min_n do {
		private ["_code","_codeMark","_codeDot"];
		_code = _x;
		_codeMark = format ["DZMSMinMarker%1", _x];
		_codeDot = format ["DZMSMinDot%1", _x];
		if (!(getMarkerColor _codeMark == "")) then {
			deleteMarker _codeMark;
			deleteMarker _codeDot;
			//Re-Add the markers
			_nil = createMarker [_codeMark, call compile format ["DZMSMinCoords%1", _code]];
			_codeMark setMarkerColor "ColorRed";
			_codeMark setMarkerShape "ELLIPSE";
			_codeMark setMarkerBrush "Grid";
			_codeMark setMarkerSize [150,150];
			_zip = createMarker [_codeDot, call compile format ["DZMSMinCoords%1", _code]];
			_codeDot setMarkerColor "ColorBlack";
			_codeDot setMarkerType "Vehicle";
			_codeDot setMarkerText (call compile format ["DZMSMinName%1", _code]);
		};
	};
	//Now we wait another 25 seconds
};