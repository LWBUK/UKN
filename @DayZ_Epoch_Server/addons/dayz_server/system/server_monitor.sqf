private ["_nul","_result","_pos","_wsDone","_dir","_isOK","_countr","_objWpnTypes","_objWpnQty","_dam","_selection","_totalvehicles","_object","_idKey","_type","_ownerID","_worldspace","_inventory","_hitPoints","_fuel","_damage","_key","_vehLimit","_hiveResponse","_objectCount","_codeCount","_data","_status","_val","_traderid","_retrader","_traderData","_id","_lockable","_debugMarkerPosition","_vehicle_0","_bQty","_vQty","_BuildingQueue","_objectQueue","_superkey","_shutdown","_res","_hiveLoaded","_ownerPUID"];

dayz_versionNo = 		getText(configFile >> "CfgMods" >> "DayZ" >> "version");
dayz_hiveVersionNo = 	getNumber(configFile >> "CfgMods" >> "DayZ" >> "hiveVersion");

_hiveLoaded = false;

_cpcimmune =[
"Land_MBG_Garage_Single_A"
];

waitUntil{initialized}; 

diag_log "HIVE: Starting";

waituntil{isNil "sm_done"};
	
if(isnil "MaxVehicleLimit") then {
	MaxVehicleLimit = 50;
};

if(isnil "MaxDynamicDebris") then {
	MaxDynamicDebris = 100;
};

if(isnil "MaxAmmoBoxes") then {
	MaxAmmoBoxes = 3;
};

if(isnil "MaxMineVeins") then {
	MaxMineVeins = 50;
};

if (isServer && isNil "sm_done") then {

	serverVehicleCounter = [];
	_hiveResponse = [];

	for "_i" from 1 to 5 do {

		diag_log "HIVE: trying to get objects";

		_key = format["CHILD:302:%1:", dayZ_instance];
		_hiveResponse = _key call server_hiveReadWrite;  

		if ((((isnil "_hiveResponse") || {(typeName _hiveResponse != "ARRAY")}) || {((typeName (_hiveResponse select 1)) != "SCALAR")})) then {

			if ((_hiveResponse select 1) == "Instance already initialized") then {
				_superkey = profileNamespace getVariable "SUPERKEY";
				_shutdown = format["CHILD:400:%1:", _superkey];
				_res = _shutdown call server_hiveReadWrite;
				diag_log ("HIVE: attempt to kill.. HiveExt response:"+str(_res));
			} else {
				diag_log ("HIVE: connection problem... HiveExt response:"+str(_hiveResponse));
			};
			_hiveResponse = ["",0];
		} 
		else {
			diag_log ("HIVE: found "+str(_hiveResponse select 1)+" objects" );
			_i = 99;
		};
	};

	_BuildingQueue = [];
	_objectQueue = [];

	if ((_hiveResponse select 0) == "ObjectStreamStart") then {

		profileNamespace setVariable ["SUPERKEY",(_hiveResponse select 2)];

		_hiveLoaded = true;

		diag_log ("HIVE: Commence Object Streaming...");

		_key = format["CHILD:302:%1:", dayZ_instance];
		_objectCount = _hiveResponse select 1;
		_bQty = 0;
		_vQty = 0;

		for "_i" from 1 to _objectCount do {

			_hiveResponse = _key call server_hiveReadWriteLarge;

			if ((_hiveResponse select 2) isKindOf "ModularItems") then {
				_BuildingQueue set [_bQty,_hiveResponse];
				_bQty = _bQty + 1;
			} else {
				_objectQueue set [_vQty,_hiveResponse];
				_vQty = _vQty + 1;
			};
		};
		diag_log ("HIVE: got " + str(_bQty) + " Epoch Objects and " + str(_vQty) + " Vehicles");
	};
	
	_totalvehicles = 0;
	{
		_idKey = _x select 1;
		_type = _x select 2;
		_ownerID = _x select 3;

		_worldspace = _x select 4;
		_inventory = _x select 5;
		_hitPoints = _x select 6;
		_fuel = _x select 7;
		_damage = _x select 8;
		
		
		_dir = 0;
		_pos = [0,0,0];
		_wsDone = false;

		if (count _worldspace >= 2) then
		{
			_dir = _worldspace select 0;
			if (count (_worldspace select 1) == 3) then {
				_pos = _worldspace select 1;
				_wsDone = true;
			}
		};			

		if (!_wsDone) then {
			if (count _worldspace >= 1) then { _dir = _worldspace select 0; };
			_pos = [getMarkerPos "center",0,4000,10,0,2000,0] call BIS_fnc_findSafePos;
			if (count _pos < 3) then { _pos = [_pos select 0,_pos select 1,0]; };
			diag_log ("MOVED OBJ: " + str(_idKey) + " of class " + _type + " to pos: " + str(_pos));
		};
        
		_vector = [[0,0,0],[0,0,0]];
_vecExists = false;
_ownerPUID = "0";   
if (count _worldspace >= 3) then{
    if(count _worldspace == 3) then{
            if(typename (_worldspace select 2) == "STRING")then{
                _ownerPUID = _worldspace select 2;
            }else{
                 if(typename (_worldspace select 2) == "ARRAY")then{
                    _vector = _worldspace select 2;
                    if(count _vector == 2)then{
                        if(((count (_vector select 0)) == 3) && ((count (_vector select 1)) == 3))then{
                            _vecExists = true;
                        };
                    };
                };                  
            };

    }else{
        //Was not 3 elements, so check if 4 or more
        if(count _worldspace == 4) then{
            if(typename (_worldspace select 3) == "STRING")then{
                _ownerPUID = _worldspace select 3;
            }else{
                if(typename (_worldspace select 2) == "STRING")then{
                    _ownerPUID = _worldspace select 2;
                };
            };


            if(typename (_worldspace select 2) == "ARRAY")then{
                _vector = _worldspace select 2;
                if(count _vector == 2)then{
                    if(((count (_vector select 0)) == 3) && ((count (_vector select 1)) == 3))then{
                        _vecExists = true;
                    };
                };
            }else{
                if(typename (_worldspace select 3) == "ARRAY")then{
                    _vector = _worldspace select 3;
                    if(count _vector == 2)then{
                        if(((count (_vector select 0)) == 3) && ((count (_vector select 1)) == 3))then{
                            _vecExists = true;
                        };
                    };
                };
            };

        }else{
            //More than 3 or 4 elements found
            //Might add a search for the vector, ownerPUID will equal 0
        };
    };
}; 

		//{
		//if ((_pos distance _x) < 110) then {
		//	if (_damage > 0.1) then {
		//		_damage = 1;
			//	[_idKey,false,"SERVER"] call server_deleteObj;
			//	diag_log format["DELETING SAFEZONE VEHICLE: %1", [_idKey, _type]];
			//	};
			//	_ownerID = "0";
			//};
		//} forEach [zonebalota, zonenortheast, zonestary];		
		
		
		if (_damage < 1) then {

			_object = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
			if (typeOf (_object) in  DZE_DoorsLocked) then {
            _object setVariable ["doorfriends", _inventory, true];
        };
			_object setVariable ["lastUpdate",time];
			_object setVariable ["ObjectID", _idKey, true];
			if (typeOf (_object) == "Plastic_Pole_EP1_DZ") then {
	        _object setVariable ["plotfriends", _inventory, true];
	    };
			_object setVariable ["OwnerPUID", _ownerPUID, true];

			_lockable = 0;

			if(isNumber (configFile >> "CfgVehicles" >> _type >> "lockable")) then {
				_lockable = getNumber(configFile >> "CfgVehicles" >> _type >> "lockable");
			};

			if (_lockable == 4) then {
				_codeCount = (count (toArray _ownerID));
				if(_codeCount == 3) then {
					_ownerID = format["0%1", _ownerID];
				};
				if(_codeCount == 2) then {
					_ownerID = format["00%1", _ownerID];
				};
				if(_codeCount == 1) then {
					_ownerID = format["000%1", _ownerID];
				};
			};

			if (_lockable == 3) then {
				_codeCount = (count (toArray _ownerID));
				if(_codeCount == 2) then {
					_ownerID = format["0%1", _ownerID];
				};
				if(_codeCount == 1) then {
					_ownerID = format["00%1", _ownerID];
				};
			};

			_object setVariable ["CharacterID", _ownerID, true];

			clearWeaponCargoGlobal  _object;
			clearMagazineCargoGlobal  _object;
			
			if (_object isKindof "CSJ_GyroC") then {
        _mag = _object magazinesTurret [-1];
        diag_log ("AMMO LIST OF CSJ_GyroC: " + str(_mag));
        cpt = 0;
        {
            _object removeMagazinesTurret [_mag select cpt,[-1]];  
            diag_log ("REMOVE AMMO OF CSJ_GyroC: " + str(_mag select cpt));
            cpt = cpt + 1;
        } forEach _mag;
    };
			
//======================Vehicle weapons MOD========================
if (_object isKindOf "AN2_DZ") then {
_object addWeapon "M240_veh";
_object addMagazine "100Rnd_762x51_M240";
_object addMagazine "100Rnd_762x51_M240";
_object addMagazine "100Rnd_762x51_M240";
_object addWeapon "TwinVickers";
_object addMagazine "500Rnd_TwinVickers";
};
//if (_object isKindOf "GNT_C185U") then {
//_object addWeapon "M240_veh";
//_object addMagazine "100Rnd_762x51_M240";
//_object addMagazine "100Rnd_762x51_M240";
//_object addMagazine "100Rnd_762x51_M240";
//_object addWeapon "TwinVickers";
//_object addMagazine "500Rnd_TwinVickers";
//};
//if (_object isKindOf "GNT_C185") then {
//_object addWeapon "M240_veh";
//_object addMagazine "100Rnd_762x51_M240";
//_object addMagazine "100Rnd_762x51_M240";
//_object addMagazine "100Rnd_762x51_M240";
//_object addWeapon "TwinVickers";
//_object addMagazine "500Rnd_TwinVickers";
//};
//if (_object isKindOf "GNT_C185R") then {
//_object addWeapon "M240_veh";
//_object addMagazine "100Rnd_762x51_M240";
//_object addMagazine "100Rnd_762x51_M240";
//_object addMagazine "100Rnd_762x51_M240";
//_object addWeapon "TwinVickers";
//_object addMagazine "500Rnd_TwinVickers";
//};
//if (_object isKindOf "GNT_C185C") then {
//_object addWeapon "M240_veh";
//_object addMagazine "100Rnd_762x51_M240";
//_object addMagazine "100Rnd_762x51_M240";
//_object addMagazine "100Rnd_762x51_M240";
//_object addWeapon "TwinVickers";
//_object addMagazine "500Rnd_TwinVickers";
//};
//if (_object isKindOf "GNT_C185T") then {
//_object addWeapon "M240_veh";
//_object addMagazine "100Rnd_762x51_M240";
//_object addMagazine "100Rnd_762x51_M240";
//_object addMagazine "100Rnd_762x51_M240";
//_object addWeapon "TwinVickers";
//_object addMagazine "500Rnd_TwinVickers";
//};
//if (_object isKindOf "C130J_US_EP1_DZ") then {
//_object addWeapon "GAU12";
//_object addMagazine "300Rnd_25mm_GAU12";
//_object addWeapon "FFARLauncher_14";
//_object addMagazine "14Rnd_FFAR";
//};
//if (_object isKindOf "MV22_DZ") then {
//_object addWeapon "M134";
//_object addMagazine "4000Rnd_762x51_M134";
//_object addWeapon "S8Launcher";
//_object addMagazine "40Rnd_S8T";
//};
//======================Vehicle weapons MOD END========================

			_object setdir _dir;
			if(_vecExists)then{
            _object setVectorDirAndUp _vector;
            }; 

			_object setposATL _pos;
			_object setDamage _damage;
			
			if (typeOf(_object) in _cpcimmune) then {
						_object addEventHandler ["HandleDamage", {false}];
						_object enableSimulation false;
					};

			
			if ((typeOf _object) in dayz_allowedObjects) then {
			    _object setVariable["memDir",_dir,true];
				if (DZE_GodModeBase) then {
					_object addEventHandler ["HandleDamage", {false}];
				} else {
					_object addMPEventHandler ["MPKilled",{_this call object_handleServerKilled;}];
				};
				_object enableSimulation false;
				_object setVariable ["OEMPos", _pos, true];
			};

			if ((count _inventory > 0) && !(typeOf( _object) == "Plastic_Pole_EP1_DZ")&& !(typeOf( _object) in  DZE_DoorsLocked)) then {
				if (_type in DZE_LockedStorage) then {
					_object setVariable ["WeaponCargo", (_inventory select 0),true];
					_object setVariable ["MagazineCargo", (_inventory select 1),true];
					_object setVariable ["BackpackCargo", (_inventory select 2),true];
				} else {
					_objWpnTypes = (_inventory select 0) select 0;
					_objWpnQty = (_inventory select 0) select 1;
					_countr = 0;					
					{
						if(_x in (DZE_REPLACE_WEAPONS select 0)) then {
							_x = (DZE_REPLACE_WEAPONS select 1) select ((DZE_REPLACE_WEAPONS select 0) find _x);
						};
						_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
						if (_isOK) then {
							_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes; 

					_objWpnTypes = (_inventory select 1) select 0;
					_objWpnQty = (_inventory select 1) select 1;
					_countr = 0;

					{
						if (_x == "BoltSteel") then { _x = "WoodenArrow" };
						if (_x == "ItemTent") then { _x = "ItemTentOld" };
						_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
						if (_isOK) then {
							_object addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes;

					_objWpnTypes = (_inventory select 2) select 0;
					_objWpnQty = (_inventory select 2) select 1;
					_countr = 0;

					{
						_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
						if (_isOK) then {
							_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes;
				};
			};	

			if (_object isKindOf "AllVehicles") then {
			_object setVariable ["lastInventory", _inventory];
			private ["_colour","_colour2","_clrinit","_clrinit2"];
				{
					_selection = _x select 0;
					_dam = _x select 1;
					if (_selection in dayZ_explosiveParts && _dam > 0.8) then {_dam = 0.8};
					[_object,_selection,_dam] call object_setFixServer;
				} count _hitpoints;
                if(count _worldspace >= 4) then{	
        if (((typeName(_worldspace select 2)) == "STRING") and ((typeName(_worldspace select 3)) == "STRING")) then {
		_colour = _worldspace select 2;
		_colour2 = _worldspace select 3;
					
		if (_colour != "0") then {
			_object setVariable ["Colour",_colour,true];
			_clrinit = format ["#(argb,8,8,3)color(%1)",_colour];
			_object setVehicleInit "this setObjectTexture [0,"+str _clrinit+"];";
		};
		if (_colour2 != "0") then {			
			_object setVariable ["Colour2",_colour2,true];
			_clrinit2 = format ["#(argb,8,8,3)color(%1)",_colour2];
			_object setVehicleInit "this setObjectTexture [1,"+str _clrinit2+"];";
		};
	};
};
				_object setFuel _fuel;

				if (!((typeOf _object) in dayz_allowedObjects)) then {
					
					_object call fnc_veh_ResetEH;		

					if(_ownerID != "0" && !(_object isKindOf "Bicycle")) then {
						_object setvehiclelock "locked";
					};

					_totalvehicles = _totalvehicles + 1;

					serverVehicleCounter set [count serverVehicleCounter,_type];
				};
				[_object] execVM "\z\addons\dayz_server\compile\Server_DeleteObjInsafezone.sqf";
			};
			PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];
		};
	} count (_BuildingQueue + _objectQueue);

	if !(DZE_ConfigTrader) then {
		{
			_traderData = call compile format["menu_%1;",_x];

			if(!isNil "_traderData") then {
				{
					_traderid = _x select 1;
					_retrader = [];
					_key = format["CHILD:399:%1:",_traderid];
					_data = "HiveEXT" callExtension _key;
					_result = call compile format ["%1",_data];
					_status = _result select 0;

					if (_status == "ObjectStreamStart") then {
						_val = _result select 1;
						call compile format["ServerTcache_%1 = [];",_traderid];
						for "_i" from 1 to _val do {
							_data = "HiveEXT" callExtension _key;
							_result = call compile format ["%1",_data];
							call compile format["ServerTcache_%1 set [count ServerTcache_%1,%2]",_traderid,_result];
							_retrader set [count _retrader,_result];
						};
					};

				} forEach (_traderData select 0);
			};
		} forEach serverTraders;
	};

	if (_hiveLoaded) then {
		_vehLimit = MaxVehicleLimit - _totalvehicles;
		if(_vehLimit > 0) then {
			diag_log ("HIVE: Spawning # of Vehicles: " + str(_vehLimit));
			for "_x" from 1 to _vehLimit do {
				[] spawn spawn_vehicles;
			};
		} else {
			diag_log "HIVE: Vehicle Spawn limit reached!";
		};
	};
	
	diag_log ("HIVE: Spawning # of Debris: " + str(MaxDynamicDebris));

	for "_x" from 1 to MaxDynamicDebris do {
		[] spawn spawn_roadblocks;
	};

	diag_log ("HIVE: Spawning # of Ammo Boxes: " + str(MaxAmmoBoxes));

	for "_x" from 1 to MaxAmmoBoxes do {
		[] spawn spawn_ammosupply;
	};

	diag_log ("HIVE: Spawning # of Veins: " + str(MaxMineVeins));

	for "_x" from 1 to MaxMineVeins do {
		[] spawn spawn_mineveins;
	};

	if(isnil "dayz_MapArea") then {
		dayz_MapArea = 10000;
	};

	if(isnil "HeliCrashArea") then {
		HeliCrashArea = dayz_MapArea / 2;
	};

	if(isnil "OldHeliCrash") then {
		OldHeliCrash = false;
	};

	if(OldHeliCrash) then {
		_nul = [3, 4, (50 * 60), (15 * 60), 0.75, 'center', HeliCrashArea, true, false] spawn server_spawnCrashSite;
	};

	if (isDedicated) then {
		_id = [] spawn server_spawnEvents;
		[] spawn {
			private ["_id"];
			sleep 200;
			waitUntil {!isNil "server_spawnCleanAnimals"};
			_id = [] execFSM "\z\addons\dayz_server\system\server_cleanup.fsm";
		};

		_debugMarkerPosition = getMarkerPos "respawn_west";
		_debugMarkerPosition = [(_debugMarkerPosition select 0),(_debugMarkerPosition select 1),1];
		_vehicle_0 = createVehicle ["DebugBox_DZ", _debugMarkerPosition, [], 0, "CAN_COLLIDE"];
		_vehicle_0 setPos _debugMarkerPosition;
		_vehicle_0 setVariable ["ObjectID","1",true];

		if(isnil "spawnMarkerCount") then {
			spawnMarkerCount = 10;
		};
		
		actualSpawnMarkerCount = 0;

		for "_i" from 0 to spawnMarkerCount do {
			if (!([(getMarkerPos format["spawn%1", _i]), [0,0,0]] call BIS_fnc_areEqual)) then {
				actualSpawnMarkerCount = actualSpawnMarkerCount + 1;
			} else {
				_i = spawnMarkerCount + 99;
			};
		};
		diag_log format["Total Number of spawn locations %1", actualSpawnMarkerCount];
		endLoadingScreen;
	};
	
	[] ExecVM "\z\addons\dayz_server\WAI\init.sqf";
	
	//[] call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZAI\init\dzai_initserver.sqf";
	//[] ExecVM "\z\addons\dayz_server\DZMSHotSpots\DZMSHotSpotsInit.sqf";
	//[] ExecVM "\z\addons\dayz_server\DZMS\DZMSInit.sqf";
	
	allowConnection = true;	
	sm_done = true;
	publicVariable "sm_done";
};
//execVM "\z\addons\dayz_server\DynamicTraders\init.sqf";