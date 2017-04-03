/*
	Adds a marker for Major Missions. Only runs once.
	DZMSMarkerLoop.sqf keeps this marker updated.
	Usage: [coordinates,missionname]
*/
private["_nul","_nil","_code","_codeMark","_codeDot"];
_code = _this select 2;
_codeMark = format ["DZMSMajMarker%1", _this select 2];
_codeDot = format ["DZMSMajDot%1", _this select 2];
call compile format ["DZMSMajCoords%1 = _this select 0;", _code];
call compile format ["DZMSMajName%1 = _this select 1;", _code];

_nul = createMarker [_codeMark, _this select 0];
_codeMark setMarkerColor "ColorRed";
_codeMark setMarkerShape "ELLIPSE";
_codeMark setMarkerBrush "Grid";
_codeMark setMarkerSize [175,175];
_nil = createMarker [_codeDot, _this select 0];
_codeDot setMarkerColor "ColorBlack";
_codeDot setMarkerType "Vehicle";
_codeDot setMarkerText (_this select 1);