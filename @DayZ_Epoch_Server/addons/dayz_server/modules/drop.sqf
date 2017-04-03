private["_model","_startpos","_endpos","_rand_player","_spawnchance","_spawnroll","_position","_aircraftpos","_chutePos","_var","_posATL","_CBLBase","_weights","_cntWeights","_num","_lootPos"];

	_model            = ["MV22","AN2_DZ","C130J_US_EP1"] call BIS_fnc_selectRandom;
	_startpos        = [[1000.0,2.0],[3500.0,2.0],[5000.0,2.0],[7500.0,2.0],[9712.0,663.067],[12304.0,1175.07],[14736.0,2500.0],[16240.0,5000.0],[16240.0,7500.0],[16240.0,10000.0]] call BIS_fnc_selectRandom;
	_rand_player    = playableUnits call BIS_fnc_selectRandom;
	
	_spawnChance	= 50; // Percent chance of spawning a crash number between 0 - 100 
	_spawnRoll		= round(random 100);   
 
if (_spawnRoll <= _spawnChance) then
{

	if((isPlayer _rand_player) && (alive _rand_player)) then {

		_rand_num        = ceil(random 1);
		_playerpos        = [_rand_player] call FNC_GetPos;
		_number            = 0;

		for "_i" from 1 to _rand_num do {
		
			_number = (_number + 1);

			[_number,_model,_startpos,_playerpos] spawn {

				private["_aircraft","_aigroup","_pilot","_wp1","_wp2","_cor_y","_cor_x"];
				
				_number     = _this select 0;
				_model         = _this select 1;
				_startpos     = _this select 2;
				_playerpos     = _this select 3;            
				_endpos        = [0,16000,200];

				call {
					if(_number == 1) exitWith {
						_cor_y = 0;
						_cor_x = 0;
					};					
				};

				_aircraft     = createVehicle [_model,[((_startpos select 0) + _cor_y),((_startpos select 1) + _cor_x),200],[],0,"FLY"];
				_aircraft     engineOn true;
				_aircraft     flyInHeight 200;

				_aigroup     = creategroup civilian;

				_pilot         = _aigroup createUnit ["SurvivorW2_DZ",[_aircraft] call FNC_GetPos,[],0,"FORM"];
				_pilot         setCombatMode "BLUE";
				_pilot         moveindriver _aircraft;
				_pilot         assignAsDriver _aircraft;

				_wp1         = _aigroup addWaypoint [[((_playerpos select 0) + _cor_y),((_playerpos select 1) + _cor_x),200],0];
				_wp1         setWaypointType "MOVE";
				_wp1        setWaypointBehaviour "CARELESS";

				_wp2         = _aigroup addWaypoint [[(_endpos select 0),(_endpos select 1),200],0];
				_wp2         setWaypointType "MOVE";
				_wp2         setWaypointBehaviour "CARELESS";
				
				//MattL's carepackage script (edited by dgx) 
				_position = [((_playerpos select 0) + _cor_y),((_playerpos select 1) + _cor_x),200];
				waitUntil { (_aircraft distance _position < 50) };
				_aircraftpos = [_aircraft] call FNC_GetPos;
				_chute = createVehicle ["ParachuteMediumEast", _aircraftpos, [], 0, "FLY"];
				_chutePos = getPos _chute;
				_FlyingSupplyBox = createVehicle ["Supply_Crate_DZE", _chutePos, [], 0, "FLY"];
				_FlyingSupplyBox attachTo [_chute, [0,0,3]];
				_FlyingSupplyBox setVariable ["permaLoot",true];
				_FlyingSupplyBox setVariable ["ObjectID", ""];
				_FlyingSupplyBox addEventHandler ["handleDamage", {false}];
				_chute setVariable ["ObjectID", ""];
				_smoke = "SmokeShellYellow" createVehicle (getPos _FlyingSupplyBox);
				_smoke attachTo [_FlyingSupplyBox, [0,0,0]];
				_var = floor((random 2) + 1);



				while {getPos _FlyingSupplyBox select 2 > 4} do
				{
					_chute SetVelocity [0,0,-5];
					uiSleep 0.1;
				};
				detach _FlyingSupplyBox;
				while {getPos _FlyingSupplyBox select 2 > 0} do {
					_FlyingSupplyBox setPos [getPos _FlyingSupplyBox select 0, getPos _FlyingSupplyBox select 1, (getPos _FlyingSupplyBox select 2) - .25]
				};
				deleteVehicle _chute;
				_posATL = getPosATL _FlyingSupplyBox;
				deleteVehicle _FlyingSupplyBox;
				_SupplyBox = "Supply_Crate_DZE" createVehicle _posATL;
				_SupplyBox setVariable ["permaLoot",true];
				_SupplyBox enableSimulation false;
				//MattL's Carepackages script end
				
				//supply_drop.sqf code
				if (DZE_MissionLootTable) then {
					dgx_itemTypes = [] + getArray (missionConfigFile >> "CfgBuildingLoot" >> "SupplyDrop" >> "lootType");
					} else {
					dgx_itemTypes = [] + getArray (configFile >> "CfgBuildingLoot" >> "SupplyDrop" >> "lootType");
					};
				_CBLBase = dayz_CBLBase find (toLower("SupplyDrop"));
				_weights = dayz_CBLChances select _CBLBase;
				_cntWeights = count _weights;
				_num = (round(random 8)) + 4;
				for "_x" from 1 to _num do {
				//create loot
				_maxLootRadius = (random 4) + 4;
				_lootPos = [_posATL, _maxLootRadius, random 360] call BIS_fnc_relPos;
				_index1 = floor(random _cntWeights);
				_index2 = _weights select _index1;
				_itemType = dgx_itemTypes select _index2;
				[_itemType select 0, _itemType select 1, _lootPos, 5] call spawn_loot;
				};

				// ReammoBox is preferred parent class here, as WeaponHolder wouldn't match MedBox0 && other such items.
				_nearby = _position nearObjects ["ReammoBox", sizeOf("Supply_Crate_DZE")];
				{
				_x setVariable ["permaLoot",true];
				} count _nearBy;
				
				//supply_drop.sqf code end
				
				waitUntil { (_aircraft distance _endpos < 500) };
				deleteVehicle _aircraft;
				deleteGroup _aigroup;
				deleteVehicle _pilot;
			};
		};
	};
};