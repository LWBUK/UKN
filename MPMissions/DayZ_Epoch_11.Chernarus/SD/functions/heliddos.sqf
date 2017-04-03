if (hasInterface) then {
	while {true} do {
		while {vehicle player != player} do {
			_veh = vehicle player;
			if (_veh isKindOf "Air" && !(_veh isKindOf "ParachuteBase")) then {
				if (driver _veh == player) then {
					_vehProtected = _veh getVariable ["donn_protect",false];
					if (!_vehProtected) then {
						_veh setVariable ["donn_protect",true,true];
						donn_heli_monitor = _veh;
						publicVariableServer "donn_heli_monitor";
					};
					uiSleep 5;
				} else {
					uiSleep 5;
				};
			} else {
				uiSleep 5;
			};
			uiSleep 3;
		};
		uiSleep 5;
	};
};

if (isServer) then {
	"donn_heli_monitor" addPublicVariableEventHandler {
		_veh = _this select 1;
		_veh spawn {
			_veh = _this;
			_crew = crew _veh;_crewOk = [];
			waitUntil {uiSleep 1.5;_crewOk = _crew;_crew = crew _veh;count _crew == 0};
			_mans = nearestObjects [getPosATL _veh,["CAManBase"],100];
			_air = (getPosATL _veh) nearEntities ["Air",100];
			_DDOS = true;
			{if (_x in _mans) exitwith {_DDOS = false;};} forEach _crewOk;
			{_passenger = _x;{if (_passenger in crew _x) exitwith {_DDOS = false;};} forEach _air;} forEach _crewOk;
			if (_DDOS && ((getPosATL _veh) select 2) > 1.5) then {
				private ["_vPosNew"];
				_vPos = getPosATL _veh;_mapCenter = getMarkerPos "center";_vehSafeRadius = (sizeOf typeOf _veh)/2 + 4;
				for "_k" from 1 to 100 do {
					_vPosNew = [[_vPos select 0,_vPos select 1,0],(18+(_k-1)*2)*(_k-1),(18+_k*2)*_k,_vehSafeRadius,0,15,0,[],[_mapCenter,[0,0,0]]] call BIS_fnc_findSafePos;
					_x1 = round (_mapCenter select 0);_y1 = round (_mapCenter select 1);
					_x2 = round (_vPosNew select 0);_y2 = round (_vPosNew select 1);
					if !(_x1 == _x2 && _y1 == _y2) exitWith {};
				};
				_vPosNew = [_vPosNew select 0,_vPosNew select 1,0.5];
				_veh setPosATL _vPosNew;
				_veh setVectorUp surfaceNormal _vPosNew;
				_veh setVelocity [0,0,0];
				_fuel = fuel _veh;
				_veh setFuel 0;
				uiSleep 2.5;
				_veh setFuel _fuel;
			};
			_veh setVariable ["donn_protect",false,true];
		};
	};
};