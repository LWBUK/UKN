scriptName "Functions\misc\fn_selfActions.sqf";

private ["_isWreckBuilding","_temp_keys","_magazinesPlayer","_isPZombie","_vehicle","_inVehicle","_hasFuelE","_hasRawMeat","_playeruid","_hasKnife","_hasToolbox","_onLadder","_playersNear","_nearLight","_canPickLight","_canDo","_text","_isHarvested","_isVehicle","_isVehicletype","_isMan","_traderType","_ownerID","_isAnimal","_isDog","_isZombie","_isDestructable","_isTent","_isFuel","_isAlive","_Unlock","_lock","_buy","_dogHandle","_lieDown","_warn","_hastinitem","_allowedDistance","_menu","_menu1","_humanity_logic","_low_high","_cancel","_metals_trader","_traderMenu","_isWreck","_isRemovable","_isDisallowRepair","_rawmeat","_humanity","_speed","_dog","_hasbottleitem","_isAir","_isShip","_playersNear","_findNearestGens","_findNearestGen","_IsNearRunningGen","_cursorTarget","_isnewstorage","_itemsPlayer","_ownerKeyId","_typeOfCursorTarget","_hasKey","_oldOwner","_combi","_key_colors","_player_deleteBuild","_player_flipveh","_player_lockUnlock_crtl","_player_butcher","_player_studybody","_player_cook","_player_boil","_hasFuelBarrelE","_hasHotwireKit","_player_SurrenderedGear","_isSurrendered","_isModular","_isModularDoor","_ownerKeyName","_temp_keys_names","_hasAttached","_allowTow","_liftHeli","_found","_posL","_posC","_height","_liftHelis","_attached","_playerUID","_characterID","_plotDistance","_PlotsNear", "_classname","_isowner"];

if (DZE_ActionInProgress) exitWith {};

_vehicle = vehicle player;
_isPZombie = player isKindOf "PZombie_VB";
_inVehicle = (_vehicle != player);
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf && !r_player_unconscious && !_onLadder);
_nearLight = 	nearestObject [player,"LitObject"];
_canPickLight = false;

if (!isNull _nearLight) then {
	if (_nearLight distance player < 4) then {
		_canPickLight = isNull (_nearLight getVariable ["owner",objNull]);
	};
};

if (_inVehicle && driver _vehicle == player) then {
	if (s_player_inCarlockUnlock_crtl < 0) then {
		dayz_myLockedVehicle = _vehicle;
		_text = getText (configFile >> "CfgVehicles" >> typeOf(dayz_myLockedVehicle) >> "displayName");
		cutText [ format ["vehicle: %1", _text], "PLAIN DOWN"];
		if(locked dayz_myLockedVehicle) then {
			_Unlock = dayz_myLockedVehicle addAction [format[localize "STR_EPOCH_ACTIONS_UNLOCK",_text], "SD\functions\vehiclelock\vehicle_lockUnlock.sqf", [dayz_myLockedVehicle, false], 2, true, true, "", ""];
			s_player_incarlockunlock set [count s_player_incarlockunlock,_Unlock];
			s_player_inCarlockUnlock_crtl = 1;
		} else {
			_lock = dayz_myLockedVehicle addAction [format[localize "STR_EPOCH_ACTIONS_LOCK",_text], "SD\functions\vehiclelock\vehicle_lockUnlock.sqf", [dayz_myLockedVehicle, true], 1, false, true, "", ""];
			s_player_incarlockunlock set [count s_player_incarlockunlock,_lock];
			s_player_inCarlockUnlock_crtl = 1;
		};
	};
} else {
	{dayz_myLockedVehicle removeAction _x} count s_player_incarlockunlock;s_player_incarlockunlock = [];
	s_player_inCarlockUnlock_crtl = -1;
};

if (_canPickLight && !dayz_hasLight && !_isPZombie) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [format[localize "str_actions_medical_15",_text], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true, "", ""];
		s_player_removeflare = player addAction [format[localize "str_actions_medical_17",_text], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true, "", ""];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};

if (DZE_HeliLift) then {
	_hasAttached = _vehicle getVariable["hasAttached",false];
	if(_inVehicle && (_vehicle isKindOf "Air") && ((([_vehicle] call FNC_getPos) select 2) < 30) && (speed _vehicle < 5) && (typeName _hasAttached == "OBJECT")) then {
		if (s_player_heli_detach < 0) then {
			dayz_myLiftVehicle = _vehicle;
			s_player_heli_detach = dayz_myLiftVehicle addAction ["Detach Vehicle","\z\addons\dayz_code\actions\player_heliDetach.sqf",[dayz_myLiftVehicle,_hasAttached],2,false,true,"",""];
		};
	} else {
		dayz_myLiftVehicle removeAction s_player_heli_detach;
		s_player_heli_detach = -1;
	};
};

if(DZE_HaloJump) then {
	if(_inVehicle && (_vehicle isKindOf "Air") && ((([_vehicle] call FNC_getPos) select 2) > 400)) then {
		if (s_halo_action < 0) then {
			DZE_myHaloVehicle = _vehicle;
			s_halo_action = DZE_myHaloVehicle addAction [localize "STR_EPOCH_ACTIONS_HALO","\z\addons\dayz_code\actions\halo_jump.sqf",[],2,false,true,"",""];
		};
	} else {
		DZE_myHaloVehicle removeAction s_halo_action;
		s_halo_action = -1;
	};
};

if (!DZE_ForceNameTagsOff) then {
	if (s_player_showname < 0 && !_isPZombie) then {
		if (DZE_ForceNameTags) then {
			s_player_showname = 1;
			player setVariable["DZE_display_name",true,true];
		} else {
			s_player_showname = player addAction [localize "STR_EPOCH_ACTIONS_NAMEYES", "\z\addons\dayz_code\actions\display_name.sqf",true, 0, true, false, "",""];
			s_player_showname1 = player addAction [localize "STR_EPOCH_ACTIONS_NAMENO", "\z\addons\dayz_code\actions\display_name.sqf",false, 0, true, false, "",""];
		};
	};
};

if(_isPZombie) then {
	if (s_player_callzombies < 0) then {
		s_player_callzombies = player addAction [localize "STR_EPOCH_ACTIONS_RAISEHORDE", "\z\addons\dayz_code\actions\call_zombies.sqf",player, 5, true, false, "",""];
	};
	if (DZE_PZATTACK) then {
		call pz_attack;
		DZE_PZATTACK = false;
	};
	if (s_player_pzombiesvision < 0) then {
		s_player_pzombiesvision = player addAction [localize "STR_EPOCH_ACTIONS_NIGHTVIS", "\z\addons\dayz_code\actions\pzombie\pz_vision.sqf", [], 4, false, true, "nightVision", "_this == _target"];
	};
	if (!isNull cursorTarget && (player distance cursorTarget < 3)) then {
		_isAnimal = cursorTarget isKindOf "Animal";
		_isZombie = cursorTarget isKindOf "zZombie_base";
		_isHarvested = cursorTarget getVariable["meatHarvested",false];
		_isMan = cursorTarget isKindOf "Man";
		if (!alive cursorTarget && (_isAnimal || _isMan) && !_isZombie && !_isHarvested) then {
			if (s_player_pzombiesfeed < 0) then {
				s_player_pzombiesfeed = player addAction [localize "STR_EPOCH_ACTIONS_FEED", "\z\addons\dayz_code\actions\pzombie\pz_feed.sqf",cursorTarget, 3, true, false, "",""];
			};
		} else {
			player removeAction s_player_pzombiesfeed;
			s_player_pzombiesfeed = -1;
		};
	} else {
		player removeAction s_player_pzombiesfeed;
		s_player_pzombiesfeed = -1;
	};
};


_allowedDistance = 4;
_isAir = cursorTarget isKindOf "Air";
_isShip = cursorTarget isKindOf "Ship";

if(_isAir || _isShip) then {
	_allowedDistance = 8;
};

if (!isNull cursorTarget && !_inVehicle && !_isPZombie && (player distance cursorTarget < _allowedDistance) && _canDo) then {	//Has some kind of target

	_cursorTarget = cursorTarget;
	_typeOfCursorTarget = typeOf _cursorTarget;
	_isVehicle = _cursorTarget isKindOf "AllVehicles";
	_isVehicletype = _typeOfCursorTarget in ["ATV_US_EP1","ATV_CZ_EP1"];
	_isnewstorage = _typeOfCursorTarget in DZE_isNewStorage;
	_magazinesPlayer = magazines player;
	_hasbottleitem = "ItemWaterbottle" in _magazinesPlayer;
	_hastinitem = false;

	{
		if (_x in _magazinesPlayer) then {
			_hastinitem = true;
		};
	} count boil_tin_cans;

	_hasFuelE = "ItemJerrycanEmpty" in _magazinesPlayer;
	_hasFuelBarrelE = "ItemFuelBarrelEmpty" in _magazinesPlayer;
	_hasHotwireKit = "ItemHotwireKit" in _magazinesPlayer;
	_itemsPlayer = items player;
	_temp_keys = [];
	_temp_keys_names = [];
	_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];

	{
		if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in _key_colors) then {
			_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _x >> "keyid");
			_ownerKeyName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_temp_keys_names set [_ownerKeyId,_ownerKeyName];
			_temp_keys set [count _temp_keys,str(_ownerKeyId)];
		};
	} count _itemsPlayer;

	_hasKnife = 	"ItemKnife" in _itemsPlayer;
	_hasToolbox = 	"ItemToolbox" in _itemsPlayer;

	if (DZE_APlotforLife) then {
		_playerUID = [player] call FNC_GetPlayerUID;
	}else{
		_playerUID = dayz_characterID;
	};

	_isMan = _cursorTarget isKindOf "Man";
	_traderType = _typeOfCursorTarget;
	_ownerID = _cursorTarget getVariable ["ownerPUID","0"];
	_characterID = _cursorTarget getVariable ["CharacterID","0"];
	_isAnimal = _cursorTarget isKindOf "Animal";
	_isDog =  (_cursorTarget isKindOf "DZ_Pastor" || _cursorTarget isKindOf "DZ_Fin");
	_isZombie = _cursorTarget isKindOf "zZombie_base";
	_isDestructable = _cursorTarget isKindOf "BuiltItems";
	_isWreck = _typeOfCursorTarget in DZE_isWreck;
	_isWreckBuilding = _typeOfCursorTarget in DZE_isWreckBuilding;
	_isModular = _cursorTarget isKindOf "ModularItems";
	_isModularDoor = _typeOfCursorTarget in ["Land_DZE_WoodDoor","Land_DZE_LargeWoodDoor","Land_DZE_GarageWoodDoor","CinderWallDoor_DZ","CinderWallDoorSmall_DZ"];
	_isRemovable = _typeOfCursorTarget in DZE_isRemovable;
	_isDisallowRepair = _typeOfCursorTarget in ["M240Nest_DZ"];
	_isTent = _cursorTarget isKindOf "TentStorage";
	_isAlive = alive _cursorTarget;
	_text = getText (configFile >> "CfgVehicles" >> _typeOfCursorTarget >> "displayName");
	_rawmeat = meatraw;
	_hasRawMeat = false;

	{
		if (_x in _magazinesPlayer) then {
			_hasRawMeat = true;
		};
	} count _rawmeat; 

	_isFuel = false;

	if (_hasFuelE || _hasFuelBarrelE) then {
		{
			if(_cursorTarget isKindOf _x) exitWith {_isFuel = true;};
		} count dayz_fuelsources;
	};

	_player_flipveh = false;
	_player_deleteBuild = false;
	_player_lockUnlock_crtl = false;

	if (_canDo && (speed player <= 1) && (_cursorTarget isKindOf "Plastic_Pole_EP1_DZ")) then {
		 if (s_player_plotManagement < 0) then {
		_adminList = ["76561198028236135",
					  "76561198053418320","76561198302675871"
					  ]; // Add admins here if you admins to able to manage all plotpoles
		_owner = _cursorTarget getVariable ["ownerPUID","0"];
		_friends = _cursorTarget getVariable ["plotfriends", []];
		_fuid = [];
		{
		_friendUID = _x select 0;
		_fuid = _fuid + [_friendUID];
		} forEach _friends;
		_allowed = [_owner];    
		_allowed = [_owner] + _adminList + _fuid;
		if((getPlayerUID player) in _allowed)then{            
		s_player_plotManagement = player addAction ["Manage Plot", "SD\actions\initPlotManagement.sqf", [], 5, false];
		};
	};

		 _plotDistance = (DZE_PlotPole select 0);
		_PlotsmarkersNear = count (nearestObjects [_cursorTarget, ["Land_coneLight"], _PlotDistance]);

		if (s_player_plot_boundary_on < 0) then {
			If (_PlotsmarkersNear == 0 ) then{
				s_player_plot_boundary_on = player addAction ["Show plot boundary", "SD\actions\object_showPlotRadius.sqf", "", 1, false];
			};
		 };	
		 if (s_player_plot_boundary_off < 0) then {
			If (_PlotsmarkersNear > 0 ) then{
				s_player_plot_boundary_off = player addAction ["Remove plot boundary", "SD\actions\object_removePlotRadius.sqf", "", 1, false];
			};
		};
		if (s_player_plot_take_ownership < 0) then {
			if (DZE_PlotOwnership) then {
				_isowner = [player, _cursorTarget] call FNC_check_owner;
				If (( _isowner select 0 )) then{
					s_player_plot_take_ownership = player addAction ["Take plot items ownership", "SD\actions\plot_take_ownership.sqf", "", 1, false];
				};
			};
		 };
	} else {
	    player removeAction s_player_plotManagement;
		s_player_plotManagement = -1;
        player removeAction s_player_plot_boundary_on;
		s_player_plot_boundary_on = -1;
		player removeAction s_player_plot_boundary_off;
		s_player_plot_boundary_off = -1;
		player removeAction s_player_plot_take_ownership;
		s_player_plot_take_ownership = -1;
	};

if(_isAlive) then {
		
		//Allow player to delete objects
		if(_isDestructable || _isWreck || _isRemovable) then {
			if(_hasToolbox && "ItemCrowbar" in _itemsPlayer) then {
				_findNearestPoles = nearestObjects[player, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];
				_IsNearPlot = count (_findNearestPoles);
				_fuid  = [];
				_allowed = [];
				if(_IsNearPlot > 0)then{
					_thePlot = _findNearestPoles select 0;
					_owner =  _thePlot getVariable ["ownerPUID","010"];
					_friends = _thePlot getVariable ["plotfriends", []];
					{
					  _friendUID = _x select 0;
					  _fuid  =  _fuid  + [_friendUID];
					} forEach _friends;
					_allowed = [_owner];    
					_allowed = [_owner] +  _fuid;	
					if ( _playerUID in _allowed && _ownerID in _allowed ) then {  
						_player_deleteBuild = true;
					};					
				}else{
					if(_ownerID == _playerUID)then{
						_player_deleteBuild = true;
					};
				};						                  
            };
    };
		
	if(_isWreckBuilding) then {
			if(_hasToolbox && "ItemCrowbar" in _itemsPlayer) then {
				_player_deleteBuild = true;
			};
		};	

    if(_isModular) then {
            if(_hasToolbox && "ItemCrowbar" in _itemsPlayer) then {
				_findNearestPoles = nearestObjects[player, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];
				_IsNearPlot = count (_findNearestPoles);
				_fuid  = [];
				_allowed = [];
				if(_IsNearPlot > 0)then{
					_thePlot = _findNearestPoles select 0;
					_owner =  _thePlot getVariable ["ownerPUID","010"];
					_friends = _thePlot getVariable ["plotfriends", []];
					{
					  _friendUID = _x select 0;
					  _fuid  =  _fuid  + [_friendUID];
					} forEach _friends;
					_allowed = [_owner];    
					_allowed = [_owner] +  _fuid;	
					if ( _playerUID in _allowed && _ownerID in _allowed ) then {  
						_player_deleteBuild = true;
					};					
				}else{
					if(_ownerID == _playerUID)then{
						_player_deleteBuild = true;
					};
				};						                  
            };
    };



	
    if(_isModularDoor) then {
            if(_hasToolbox && "ItemCrowbar" in _itemsPlayer) then {			
				_findNearestPoles = nearestObjects[player, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];
				_IsNearPlot = count (_findNearestPoles);
				_fuid  = [];
				_allowed = [];
				if(_IsNearPlot > 0)then{
					_thePlot = _findNearestPoles select 0;
					_owner =  _thePlot getVariable ["ownerPUID","010"];
					_friends = _thePlot getVariable ["plotfriends", []];
					{
					  _friendUID = _x select 0;
					  _fuid  =  _fuid  + [_friendUID];
					} forEach _friends;
					_allowed = [_owner];    
					_allowed = [_owner] +  _fuid;	
					if ( _playerUID in _allowed && _ownerID in _allowed) then {
						_player_deleteBuild = true;
					};					
				}else{
					if(_ownerID == _playerUID)then{
						_player_deleteBuild = true;
					};
				};								
            };      
    };	
	
		if(_isVehicle) then {
			
			if (!(canmove _cursorTarget) && (player distance _cursorTarget >= 2) && (count (crew _cursorTarget))== 0 && ((vectorUp _cursorTarget) select 2) < 0.5) then {
				_playersNear = {isPlayer _x} count (player nearEntities ["CAManBase", 6]);
				if(_isVehicletype || (_playersNear >= 2)) then {
					_player_flipveh = true;	
				};
			};

			if(!_isMan && _characterID != "0" && !(_cursorTarget isKindOf "Bicycle")) then {
				_player_lockUnlock_crtl = true;
			};
		};
	};

	if(_player_deleteBuild) then {
		if (s_player_deleteBuild < 0) then {
			s_player_deleteBuild = player addAction [format[localize "str_actions_delete",_text], "SD\actions\remove.sqf",_cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_deleteBuild;
		s_player_deleteBuild = -1;
	};

	if (DZE_HeliLift) then {

		_liftHeli = objNull;
		_found = false;
		_allowTow = false;

		if ((count (crew _cursorTarget)) == 0) then {
			{
				if(!_allowTow) then {
					_allowTow = _cursorTarget isKindOf _x;
				};
			} count DZE_HeliAllowToTow;
		};

		if (_allowTow) then {
			_liftHelis = nearestObjects [player, DZE_HeliAllowTowFrom, 15];
			{
				if(!_found) then {
					_posL = [_x] call FNC_getPos;
					_posC = [_cursorTarget] call FNC_getPos;
					_height = (_posL select 2) - (_posC select 2);
					_hasAttached = _x getVariable["hasAttached",false];
					if(_height < 15 && _height > 5 && (typeName _hasAttached != "OBJECT")) then {
						if(((abs((_posL select 0) - (_posC select 0))) < 10) && ((abs((_posL select 1) - (_posC select 1))) < 10)) then {
							_liftHeli = _x;
							_found = true;
						};
					};
				};
			} count _liftHelis;
		};

		_attached = _cursorTarget getVariable["attached",false];

		if(_found && _allowTow && _canDo && !locked _cursorTarget && !_isPZombie && (typeName _attached != "OBJECT")) then {
			if (s_player_heli_lift < 0) then {
				s_player_heli_lift = player addAction ["Attach to Heli", "\z\addons\dayz_code\actions\player_heliLift.sqf",[_liftHeli,_cursorTarget], -10, false, true, "",""];
			};
		} else {
			player removeAction s_player_heli_lift;
			s_player_heli_lift = -1;
		};
	};

	if(_player_lockUnlock_crtl) then {
		if (s_player_lockUnlock_crtl < 0) then {
			_hasKey = _characterID in _temp_keys;
			_oldOwner = (_characterID == dayz_playerUID);
			if(locked _cursorTarget) then {
				if(_hasKey || _oldOwner) then {
					_Unlock = player addAction [format[localize "STR_EPOCH_ACTIONS_UNLOCK",_text], "\z\addons\dayz_code\actions\unlock_veh.sqf",[_cursorTarget,(_temp_keys_names select (parseNumber _characterID))], 2, true, true, "", ""];
					s_player_lockunlock set [count s_player_lockunlock,_Unlock];
					s_player_lockUnlock_crtl = 1;
				} else {
					if(_hasHotwireKit) then {
						_Unlock = player addAction [format[localize "STR_EPOCH_ACTIONS_HOTWIRE",_text], "\z\addons\dayz_code\actions\hotwire_veh.sqf",_cursorTarget, 2, true, true, "", ""];
					} else {
						_Unlock = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_VEHLOCKED"], "",_cursorTarget, 2, true, true, "", ""];
					};
					s_player_lockunlock set [count s_player_lockunlock,_Unlock];
					s_player_lockUnlock_crtl = 1;
				};
			} else {
				if(_hasKey || _oldOwner) then {
					_lock = player addAction [format[localize "STR_EPOCH_ACTIONS_LOCK",_text], "\z\addons\dayz_code\actions\lock_veh.sqf",_cursorTarget, 1, true, true, "", ""];
					s_player_lockunlock set [count s_player_lockunlock,_lock];
					if (_typeOfCursorTarget in ColourVehicles) then {
		            private ["_paint"];
		            _paint = player addAction ["Paint", "SD\functions\player_paint_init.sqf",_cursorTarget, 2, true, true, "", ""];
		            s_player_lockunlock set [count s_player_lockunlock,_paint];
	            };
					s_player_lockUnlock_crtl = 1;
				};
			};
		};
	} else {
		{player removeAction _x} count s_player_lockunlock;s_player_lockunlock = [];
		s_player_lockUnlock_crtl = -1;
	};

	if(DZE_AllowForceSave) then {

	if((_isVehicle || _isTent) && !_isMan) then {
			if (s_player_forceSave < 0) then {
				s_player_forceSave = player addAction [format[localize "str_actions_save",_text], "\z\addons\dayz_code\actions\forcesave.sqf",_cursorTarget, 1, true, true, "", ""];
			};
		} else {
			player removeAction s_player_forceSave;
			s_player_forceSave = -1;
		};
	};

	
	
	if(DZE_AllowCargoCheck) then {
		if((_isVehicle || _isTent || _isnewstorage) && _isAlive && !_isMan && !locked _cursorTarget) then {
			if (s_player_checkGear < 0) then {
				s_player_checkGear = player addAction [localize "STR_EPOCH_PLAYER_CARGO", "\z\addons\dayz_code\actions\cargocheck.sqf",_cursorTarget, 1, true, true, "", ""];
			};
		} else {
			player removeAction s_player_checkGear;
			s_player_checkGear = -1;
		};
	};

	if(_player_flipveh) then {
		if (s_player_flipveh  < 0) then {
			s_player_flipveh = player addAction [format[localize "str_actions_flipveh",_text], "\z\addons\dayz_code\actions\player_flipvehicle.sqf",_cursorTarget, 1, true, true, "", ""];		
		};
	} else {
		player removeAction s_player_flipveh;
		s_player_flipveh = -1;
	}; 

	if((_hasFuelE || _hasFuelBarrelE) && _isFuel) then {
		if (s_player_fillfuel < 0) then {
			s_player_fillfuel = player addAction [localize "str_actions_self_10", "\z\addons\dayz_code\actions\jerry_fill.sqf",[], 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_fillfuel;
		s_player_fillfuel = -1;
	};
	
	_player_butcher = false;
	_player_studybody = false;
	_player_SurrenderedGear = false;

	if (!_isAlive) then {

		if((_isAnimal || _isZombie) && _hasKnife) then {
			_isHarvested = _cursorTarget getVariable["meatHarvested",false];
			if (!_isHarvested) then {
				_player_butcher = true;
			};
		};
 if(_isMan && !_isZombie && !_isAnimal) then {
if (s_player_studybody_2 < 0) then {
            s_player_studybody_2 = player addAction [("<t color=""#FF0000"">"+("ID Body") + "</t>"), "SD\functions\studybody1.sqf",_cursorTarget, 0, false, true, "",""];
};


    } else {
        player removeAction s_player_studybody_2;
        s_player_studybody_2 = -1;
    }; 
		if (_isMan && !_isZombie && !_isAnimal && _characterID != "0") then {
			_player_studybody = true;
		}
	} else {

		if(_isMan && !_isZombie && !_isAnimal) then {
			_isSurrendered = _cursorTarget getVariable ["DZE_Surrendered",false];
			if (_isSurrendered) then {
				_player_SurrenderedGear = true;
			};
		};
	};

	if (_player_butcher) then {
		if (s_player_butcher < 0) then {
			if(_isZombie) then {
				s_player_butcher = player addAction [localize "STR_EPOCH_ACTIONS_GUTZOM", "\z\addons\dayz_code\actions\gather_zparts.sqf",_cursorTarget, 0, true, true, "", ""];
			} else {
				s_player_butcher = player addAction [localize "str_actions_self_04", "\z\addons\dayz_code\actions\gather_meat.sqf",_cursorTarget, 3, true, true, "", ""];
			};
		};
	} else {
		player removeAction s_player_butcher;
		s_player_butcher = -1;
	};

	if (_player_studybody) then {
		if (s_player_studybody < 0) then {
				s_player_studybody = player addAction [("<t color=""#FF0000"">"+("Check Wallet") + "</t>"), "SD\actions\check_wallet.sqf",_cursorTarget, 0, false, true, "",""];
				};
	} else {
		player removeAction s_player_studybody;
		s_player_studybody = -1;
		
	};

	_player_cook = false;
	_player_boil = false;

	if (inflamed _cursorTarget) then {

		if (_hasRawMeat) then {
			_player_cook = true;	
		};

		if (_hasbottleitem && _hastinitem) then {
			_player_boil = true;
		};
	};

	if (_player_SurrenderedGear) then {
		if (s_player_SurrenderedGear < 0) then {
			s_player_SurrenderedGear = player addAction [localize "STR_EPOCH_ACTIONS_GEAR", "\z\addons\dayz_code\actions\surrender_gear.sqf",_cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_SurrenderedGear;
		s_player_SurrenderedGear = -1;
	};

	if (_player_cook) then {
		if (s_player_cook < 0) then {
			s_player_cook = player addAction [localize "str_actions_self_05", "\z\addons\dayz_code\actions\cook.sqf",_cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_cook;
		s_player_cook = -1;
	};

	if (_player_boil) then {
		if (s_player_boil < 0) then {
			s_player_boil = player addAction [localize "str_actions_boilwater", "\z\addons\dayz_code\actions\boil.sqf",_cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_boil;
		s_player_boil = -1;
	};

	if(_cursorTarget == dayz_hasFire) then {
		if ((s_player_fireout < 0) && !(inflamed _cursorTarget) && (player distance _cursorTarget < 3)) then {
			s_player_fireout = player addAction [localize "str_actions_self_06", "\z\addons\dayz_code\actions\fire_pack.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_fireout;
		s_player_fireout = -1;
	};
	

	if(_isTent && (player distance _cursorTarget < 3)) then {
		if (_ownerID == _playerUID) then {
			if (s_player_packtent < 0) then {
				s_player_packtent = player addAction [localize "str_actions_self_07", "\z\addons\dayz_code\actions\tent_pack.sqf",_cursorTarget, 0, false, true, "",""];
			};
		} else {
			if(("ItemJerrycan" in _magazinesPlayer) && ("ItemMatchbox_DZE" in weapons player)) then {
				if (s_player_packtent < 0) then {
					s_player_packtent = player addAction [localize "STR_EPOCH_ACTIONS_DESTROYTENT", "SD\actions\remove.sqf",_cursorTarget, 1, true, true, "", ""];
				};
			};
		};
	} else {
		player removeAction s_player_packtent;
		s_player_packtent = -1;
	};
	
	if((_typeOfCursorTarget in DZE_DoorsLocked)) then {
	if (s_player_manageDoor < 0) then {		 
     s_player_manageDoor = player addAction ["Manage Door", "SD\functions\doorManagement\initDoorManagement.sqf", _cursorTarget, 5, false];
	};
} else {
		player removeAction s_player_manageDoor;
		s_player_manageDoor = -1;
};
	
	if((_typeOfCursorTarget in DZE_LockableStorage) && _characterID != "0" && (player distance _cursorTarget < 3)) then {
		if (s_player_unlockvault < 0) then {
			if(_typeOfCursorTarget in DZE_LockedStorage) then {
				if(_characterID == dayz_combination || _ownerID == _playerUID) then {
					_combi = player addAction [format[localize "STR_EPOCH_ACTIONS_OPEN",_text], "\z\addons\dayz_code\actions\vault_unlock.sqf",_cursorTarget, 0, false, true, "",""];
					s_player_combi set [count s_player_combi,_combi];
				} else {
				if(_hasHotwireKit) then {
						 s_player_hotwirevault = player addaction [("<t color=""#B40404"">" + ("Crack Safe") +"</t>"), "SD\functions\vault_hotwire.sqf",_cursorTarget, 0, false, true, "", ""];
						};
					_combi = player addAction [format[localize "STR_EPOCH_ACTIONS_UNLOCK",_text], "\z\addons\dayz_code\actions\vault_combination_1.sqf",_cursorTarget, 0, false, true, "",""];
					s_player_combi set [count s_player_combi,_combi];
				};
				s_player_unlockvault = 1;
			} else {
				if(_characterID != dayz_combination && _ownerID != _playerUID) then {
					_combi = player addAction [localize "STR_EPOCH_ACTIONS_RECOMBO", "\z\addons\dayz_code\actions\vault_combination_1.sqf",_cursorTarget, 0, false, true, "",""];
					s_player_combi set [count s_player_combi,_combi];
					s_player_unlockvault = 1;
					player removeAction s_player_hotwirevault;
		s_player_hotwirevault = -1;
				};
			};
		};
	} else {
		{player removeAction _x} count s_player_combi;s_player_combi = [];
		s_player_unlockvault = -1;
		player removeAction s_player_hotwirevault;
		s_player_hotwirevault = -1;
	};
  
	if(_typeOfCursorTarget in DZE_UnLockedStorage and (player distance _cursorTarget < 3)) then {
		if (s_bank_dialog < 0) then {
				s_bank_dialog = player addAction ["Online Banking", "SD\actions\bank_dialog.sqf",_cursorTarget, 3, true, true, "", ""];	
		};
	} else {
     	player removeAction s_bank_dialog;
		s_bank_dialog = -1;

	};




	if(_typeOfCursorTarget in Bank_Object and (player distance _cursorTarget < 3)) then {		
		if (s_bank_dialog2 < 0) then {
			s_bank_dialog2 = player addAction ["Bank ATM", "SD\actions\bank_dialog.sqf",_cursorTarget, 3, true, true, "", ""];
		};			

	} else {		
		player removeAction s_bank_dialog2;
		s_bank_dialog2 = -1;
	};
	
	if(_typeOfCursorTarget in Fast_Med  and (player distance _cursorTarget < 3)) then {		
		if (s_fast_med_dialog1 < 0) then {
			s_fast_med_dialog1 = player addAction ["Pay for treatment", "SD\actions\FastMed.sqf",_cursorTarget, 3, true, true, "", ""];
		};
	} else {		
		player removeAction s_fast_med_dialog1;
		s_fast_med_dialog1 = -1;
	};	

	
	if(_typeOfCursorTarget in DZE_UnLockedStorage && _characterID != "0" && (player distance _cursorTarget < 3)) then {

		if (s_player_lockvault < 0) then {
			if(_characterID == dayz_combination || _ownerID == dayz_playerUID) then {
				s_player_lockvault = player addAction [format[localize "STR_EPOCH_ACTIONS_LOCK",_text], "\z\addons\dayz_code\actions\vault_lock.sqf",_cursorTarget, 0, false, true, "",""];
			};
		};
		if (s_player_packvault < 0 && (_characterID == dayz_combination || _ownerID == dayz_playerUID)) then {
			s_player_packvault = player addAction [format["<t color='#ff0000'>%1</t>",(format[localize "STR_EPOCH_ACTIONS_PACK",_text])], "\z\addons\dayz_code\actions\vault_pack.sqf",_cursorTarget, 0, false, true, "",""];
		};

	} else {
		player removeAction s_player_packvault;
		s_player_packvault = -1;
		player removeAction s_player_lockvault;
		s_player_lockvault = -1;
	};

	if(_typeOfCursorTarget == "Info_Board_EP1") then {
		if (s_player_information < 0) then {
			s_player_information = player addAction [localize "STR_EPOCH_ACTIONS_MURDERS", "\z\addons\dayz_code\actions\list_playerDeaths.sqf",[], 7, false, true, "",""];
		};
	} else {
		player removeAction s_player_information;
		s_player_information = -1;
	};
	
	if (_isMan and _isAlive and !_isZombie and !_isAnimal and !(_traderType in serverTraders)) then {
		if (s_givemoney_dialog < 0) then {
			s_givemoney_dialog = player addAction [format["Give Money to %1", (name _cursorTarget)], "SD\actions\give_player_dialog.sqf",_cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_givemoney_dialog;
		s_givemoney_dialog = -1;
	};
	
	if (isNil "SmeltingInProgress") then {
		SmeltingInProgress = false;
	};

	_player_money = player getVariable["cashMoney",0];
	if (inflamed _cursorTarget and (_player_money > SmeltingGoldBarsToCoinsRate) and !SmeltingInProgress) then {
		if (s_smelt_coins < 0) then {
			if (_player_money > 10000) then {
				s_smelt_coins = player addAction [format["Smelt %1 %2 into a 10oz Gold Bar", (SmeltingGoldBarsToCoinsRate * 10), CurrencyName], "SD\actions\player_smeltcoins.sqf","ItemGoldBar10oz", 3, true, true, "", ""];
			} else {
				s_smelt_coins = player addAction [format["Smelt %1 %2 into a Gold Bar", SmeltingGoldBarsToCoinsRate, CurrencyName], "SD\actions\player_smeltcoins.sqf","ItemGoldBar", 3, true, true, "", ""];
			};
		};
	} else {
		player removeAction s_smelt_coins;
		s_smelt_coins = -1;
	};

	_hasGoldBars = "ItemGoldBar" in _magazinesPlayer;
	if (inflamed _cursorTarget and (_hasGoldBars) and !SmeltingInProgress) then {
		if (s_smelt_bars < 0) then {
			s_smelt_bars = player addAction [format["Smelt a Gold Bar into %1 %2", SmeltingGoldBarsToCoinsRate, CurrencyName], "SD\actions\player_smeltbars.sqf","ItemGoldBar", 3, true, true, "", ""];
		};
	} else {
		player removeAction s_smelt_bars;
		s_smelt_bars = -1;
	};
	
	_has10ozGoldBars = "ItemGoldBar10oz" in _magazinesPlayer;
	if (inflamed _cursorTarget and (_has10ozGoldBars) and !SmeltingInProgress) then {
		if (s_smelt_10bars < 0) then {
			s_smelt_10bars = player addAction [format["Smelt a 10oz Gold Bar into %1 %2", (SmeltingGoldBarsToCoinsRate * 10), CurrencyName], "SD\actions\player_smeltbars.sqf","ItemGoldBar10oz", 3, true, true, "", ""];
		};
	} else {
		player removeAction s_smelt_10bars;
		s_smelt_10bars = -1;
	}; 
	
	if(_typeOfCursorTarget in dayz_fuelpumparray) then {	
		if (s_player_fuelauto < 0) then {
			
			_findNearestGens = nearestObjects [player, ["Generator_DZ"], 30];
			_findNearestGen = [];
			{
				if (alive _x && (_x getVariable ["GeneratorRunning", false])) then {
					_findNearestGen set [(count _findNearestGen),_x];
				};
			} count _findNearestGens;
			_IsNearRunningGen = count (_findNearestGen);
			
			if(_IsNearRunningGen > 0) then {
				s_player_fuelauto = player addAction [localize "STR_EPOCH_ACTIONS_FILLVEH", "\z\addons\dayz_code\actions\fill_nearestVehicle.sqf",objNull, 0, false, true, "",""];
			} else {
				s_player_fuelauto = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_NEEDPOWER"], "",[], 0, false, true, "",""];
			};
		};
	} else {
		player removeAction s_player_fuelauto;
		s_player_fuelauto = -1;
	};

	if(_typeOfCursorTarget in DZE_fueltruckarray && alive _cursorTarget) then {	
		if (s_player_fuelauto2 < 0) then {
			if(isEngineOn _cursorTarget) then {
				s_player_fuelauto2 = player addAction [localize "STR_EPOCH_ACTIONS_FILLVEH", "\z\addons\dayz_code\actions\fill_nearestVehicle.sqf",_cursorTarget, 0, false, true, "",""];
			} else {
				s_player_fuelauto2 = player addAction [format["<t color='#ff0000'>%1</t>",localize "STR_EPOCH_ACTIONS_NEEDPOWER"], "",[], 0, false, true, "",""];
			};
		};
	} else {
		player removeAction s_player_fuelauto2;
		s_player_fuelauto2 = -1;
	};

	if ((_cursorTarget isKindOf "ModularItems") || (_cursorTarget isKindOf "Land_DZE_WoodDoor_Base") || (_cursorTarget isKindOf "CinderWallDoor_DZ_Base")) then {
		if ((s_player_lastTarget select 0) != _cursorTarget) then {
			if (s_player_upgrade_build > 0) then {
				player removeAction s_player_upgrade_build;
				s_player_upgrade_build = -1;
			};
		};
		if (s_player_upgrade_build < 0) then {
			s_player_lastTarget set [0,_cursorTarget];
			s_player_upgrade_build = player addAction [format[localize "STR_EPOCH_ACTIONS_UPGRADE",_text], "SD\actions\player_upgrade.sqf",_cursorTarget, -1, false, true, "",""];
		};
	} else {
		player removeAction s_player_upgrade_build;
		s_player_upgrade_build = -1;
	};

	if((_isDestructable || _cursorTarget isKindOf "Land_DZE_WoodDoorLocked_Base" || _cursorTarget isKindOf "CinderWallDoorLocked_DZ_Base") && (DZE_Lock_Door == _characterID)) then {
		if ((s_player_lastTarget select 1) != _cursorTarget) then {
			if (s_player_downgrade_build > 0) then {	
				player removeAction s_player_downgrade_build;
				s_player_downgrade_build = -1;
			};
		};
		if (s_player_downgrade_build < 0) then {
			s_player_lastTarget set [1,_cursorTarget];
			s_player_downgrade_build = player addAction [format[localize "STR_EPOCH_ACTIONS_REMLOCK",_text], "SD\actions\player_buildingDowngrade.sqf",_cursorTarget, -2, false, true, "",""];
		};
	} else {
		player removeAction s_player_downgrade_build;
		s_player_downgrade_build = -1;
	};

	if((_cursorTarget isKindOf "ModularItems" || _cursorTarget isKindOf "DZE_Housebase" || _typeOfCursorTarget == "LightPole_DZ") && (damage _cursorTarget >= DZE_DamageBeforeMaint)) then {
		if ((s_player_lastTarget select 2) != _cursorTarget) then {
			if (s_player_maint_build > 0) then {	
				player removeAction s_player_maint_build;
				s_player_maint_build = -1;
			};
		};
		if (s_player_maint_build < 0) then {
			s_player_lastTarget set [2,_cursorTarget];
			s_player_maint_build = player addAction [format[localize "STR_EPOCH_ACTIONS_MAINTAIN",_text], "\z\addons\dayz_code\actions\player_buildingMaint.sqf",_cursorTarget, -2, false, true, "",""];
		};
	} else {
		player removeAction s_player_maint_build;
		s_player_maint_build = -1;
	};

	if(_cursorTarget isKindOf "Generator_DZ") then {
		if (s_player_fillgen < 0) then {
			
			if((_cursorTarget getVariable ["GeneratorRunning", false])) then {
				s_player_fillgen = player addAction [localize "STR_EPOCH_ACTIONS_GENERATOR1", "\z\addons\dayz_code\actions\stopGenerator.sqf",_cursorTarget, 0, false, true, "",""];				
			} else {
				if((_cursorTarget getVariable ["GeneratorFilled", false])) then {
					s_player_fillgen = player addAction [localize "STR_EPOCH_ACTIONS_GENERATOR2", "\z\addons\dayz_code\actions\fill_startGenerator.sqf",_cursorTarget, 0, false, true, "",""];
				} else {
					if("ItemJerrycan" in _magazinesPlayer) then {
						s_player_fillgen = player addAction [localize "STR_EPOCH_ACTIONS_GENERATOR3", "\z\addons\dayz_code\actions\fill_startGenerator.sqf",_cursorTarget, 0, false, true, "",""];
					};
				};
			};
		};
	} else {
		player removeAction s_player_fillgen;
		s_player_fillgen = -1;
	};

	
         if(_isTent && _ownerID == _playerUID) then {
		if ((s_player_sleep < 0) && (player distance _cursorTarget < 3)) then {
			s_player_sleep = player addAction [localize "str_actions_self_sleep", "\z\addons\dayz_code\actions\player_sleep.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_sleep;
		s_player_sleep = -1;
	};
	
	_clothesTaken = _cursorTarget getVariable["clothesTaken",false];

     // Take clothes by Zabn
     if (_isMan and !_isAlive and  !_isAnimal and !_isZombie and !_clothesTaken) then {
         if (s_player_clothes < 0) then {
             s_player_clothes = player addAction ["Take Clothes", "SD\functions\player_takeClothes_v2.sqf",[_cursorTarget], -10, false, true, "",""];
         };
     } else {
         player removeAction s_player_clothes;
         s_player_clothes = -1;
         };
	
	if ((dayz_myCursorTarget != _cursorTarget) && _isVehicle && !_isMan && _hasToolbox && (damage _cursorTarget < 1) && !_isDisallowRepair) then {
		if (s_player_repair_crtl < 0) then {
			dayz_myCursorTarget = _cursorTarget;
			_menu = dayz_myCursorTarget addAction [localize "STR_EPOCH_PLAYER_REPAIRV", "\z\addons\dayz_code\actions\repair_vehicle.sqf",_cursorTarget, 0, true, false, "",""];
			_menu1 = dayz_myCursorTarget addAction [localize "STR_EPOCH_PLAYER_SALVAGEV", "\z\addons\dayz_code\actions\salvage_vehicle.sqf",_cursorTarget, 0, true, false, "",""];
			s_player_repairActions set [count s_player_repairActions,_menu];
			s_player_repairActions set [count s_player_repairActions,_menu1];
			s_player_repair_crtl = 1;
		} else {
			{dayz_myCursorTarget removeAction _x} count s_player_repairActions;s_player_repairActions = [];
			s_player_repair_crtl = -1;
		};
	};

	if (_isMan && !_isPZombie && _traderType in serverTraders) then {

		if (s_player_parts_crtl < 0) then {
			_humanity = player getVariable ["humanity",0];
			_traderMenu = call compile format["menu_%1;",_traderType];

			// diag_log ("TRADER = " + str(_traderMenu));
			
			_low_high = "low";
			_humanity_logic = false;
			if((_traderMenu select 2) == "friendly") then {
				_humanity_logic = (_humanity < -5000);
			};
			if((_traderMenu select 2) == "hostile") then {
				_low_high = "high";
				_humanity_logic = (_humanity > -5000);
			};
			if((_traderMenu select 2) == "hero") then {
				_humanity_logic = (_humanity < 5000);
			};
			if(_humanity_logic) then {
				_cancel = player addAction [format[localize "STR_EPOCH_ACTIONS_HUMANITY",_low_high], "\z\addons\dayz_code\actions\trade_cancel.sqf",["na"], 0, true, false, "",""];
				s_player_parts set [count s_player_parts,_cancel];
			} else {
				{
					_buy = player addAction [format["Trade %1 %2 for %3 %4",(_x select 3),(_x select 5),(_x select 2),(_x select 6)], "\z\addons\dayz_code\actions\trade_items_wo_db.sqf",[(_x select 0),(_x select 1),(_x select 2),(_x select 3),(_x select 4),(_x select 5),(_x select 6)], (_x select 7), true, true, "",""];
					s_player_parts set [count s_player_parts,_buy];
				
				} count (_traderMenu select 1);
				_buyV = player addAction ["Advanced Trading", "SD\advancedTrading\init.sqf",(_traderMenu select 0), 999, true, false, "",""];
                s_player_parts set [count s_player_parts,_buyV];
				_buy = player addAction [localize "STR_EPOCH_PLAYER_289", "\z\addons\dayz_code\actions\show_dialog.sqf",(_traderMenu select 0), 999, true, false, "",""];
				s_player_parts set [count s_player_parts,_buy];

			};
			s_player_parts_crtl = 1;
			
		};
	} else {
		{player removeAction _x} count s_player_parts;s_player_parts = [];
		s_player_parts_crtl = -1;
	};


	if(dayz_tameDogs) then {

		if (_isDog && _isAlive && (_hasRawMeat) && _characterID == "0" && player getVariable ["dogID", 0] == 0) then {
			if (s_player_tamedog < 0) then {
				s_player_tamedog = player addAction [localize "str_actions_tamedog", "\z\addons\dayz_code\actions\tame_dog.sqf", _cursorTarget, 1, false, true, "", ""];
			};
		} else {
			player removeAction s_player_tamedog;
			s_player_tamedog = -1;
		};

		if (_isDog && _characterID == dayz_characterID && _isAlive) then {
			_dogHandle = player getVariable ["dogID", 0];
			if (s_player_feeddog < 0 && _hasRawMeat) then {
				s_player_feeddog = player addAction [localize "str_actions_feeddog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,0], 0, false, true,"",""];
			};
			if (s_player_waterdog < 0 && "ItemWaterbottle" in _magazinesPlayer) then {
				s_player_waterdog = player addAction [localize "str_actions_waterdog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,1], 0, false, true,"",""];
			};
			if (s_player_staydog < 0) then {
				_lieDown = _dogHandle getFSMVariable "_actionLieDown";
				if (_lieDown) then { _text = "str_actions_liedog"; } else { _text = "str_actions_sitdog"; };
				s_player_staydog = player addAction [localize _text,"\z\addons\dayz_code\actions\dog\stay.sqf", _dogHandle, 5, false, true,"",""];
			};
			if (s_player_trackdog < 0) then {
				s_player_trackdog = player addAction [localize "str_actions_trackdog","\z\addons\dayz_code\actions\dog\track.sqf", _dogHandle, 4, false, true,"",""];
			};
			if (s_player_barkdog < 0) then {
				s_player_barkdog = player addAction [localize "str_actions_barkdog","\z\addons\dayz_code\actions\dog\speak.sqf", _cursorTarget, 3, false, true,"",""];
			};
			if (s_player_warndog < 0) then {
				_warn = _dogHandle getFSMVariable "_watchDog";
				if (_warn) then { _text = (localize "str_epoch_player_247"); _warn = false; } else { _text = (localize "str_epoch_player_248"); _warn = true; };
				s_player_warndog = player addAction [format[localize "str_actions_warndog",_text],"\z\addons\dayz_code\actions\dog\warn.sqf",[_dogHandle, _warn], 2, false, true,"",""];		
			};
			if (s_player_followdog < 0) then {
				s_player_followdog = player addAction [localize "str_actions_followdog","\z\addons\dayz_code\actions\dog\follow.sqf",[_dogHandle,true], 6, false, true,"",""];
			};
		} else {
			player removeAction s_player_feeddog;
			s_player_feeddog = -1;
			player removeAction s_player_waterdog;
			s_player_waterdog = -1;
			player removeAction s_player_staydog;
			s_player_staydog = -1;
			player removeAction s_player_trackdog;
			s_player_trackdog = -1;
			player removeAction s_player_barkdog;
			s_player_barkdog = -1;
			player removeAction s_player_warndog;
			s_player_warndog = -1;
			player removeAction s_player_followdog;
			s_player_followdog = -1;
		};
	};


} else {

	{dayz_myCursorTarget removeAction _x} count s_player_repairActions;s_player_repairActions = [];
	s_player_repair_crtl = -1;
	{player removeAction _x} count s_player_combi;s_player_combi = [];
	dayz_myCursorTarget = objNull;
	player removeAction s_player_hotwirevault;
	s_player_hotwirevault = -1;
	s_player_lastTarget = [objNull,objNull,objNull,objNull,objNull];
	{player removeAction _x} count s_player_parts;s_player_parts = [];
	s_player_parts_crtl = -1;
	{player removeAction _x} count s_player_lockunlock;s_player_lockunlock = [];
	s_player_lockUnlock_crtl = -1;
	player removeAction s_player_checkGear;
	s_player_checkGear = -1;
	player removeAction s_player_SurrenderedGear;
	s_player_SurrenderedGear = -1;

	//Others
	
	player removeAction s_player_hotwirevault;
	s_player_hotwirevault = -1;
	player removeAction s_player_plotManagement;
	s_player_plotManagement = -1;
    player removeAction s_player_maintain_area;
    s_player_maintain_area = -1;
    player removeAction s_player_maintain_area_preview;
    s_player_maintain_area_preview = -1;
	player removeAction s_player_plot_boundary_on;
	s_player_plot_boundary_on = -1;
	player removeAction s_player_plot_boundary_off;
	s_player_plot_boundary_off = -1;
	player removeAction s_player_plot_take_ownership;
	s_player_plot_take_ownership = -1;
	player removeAction s_player_forceSave;
	s_player_forceSave = -1;
	player removeAction s_player_flipveh;
	s_player_flipveh = -1;
	player removeAction s_player_sleep;
	s_player_sleep = -1;
	player removeAction s_player_deleteBuild;
	s_player_deleteBuild = -1;
	player removeAction s_player_butcher;
	s_player_butcher = -1;
	player removeAction s_player_cook;
	s_player_cook = -1;
	player removeAction s_player_boil;
	s_player_boil = -1;
	player removeAction s_player_fireout;
	s_player_fireout = -1;
	player removeAction s_player_packtent;
	s_player_packtent = -1;
	player removeAction s_player_fillfuel;
	s_player_fillfuel = -1;
	player removeAction s_player_studybody;
	s_player_studybody = -1;
	player removeAction s_player_studybody_2;
s_player_studybody_2 = -1;
	player removeAction s_player_clothes;
    s_player_clothes = -1;
	player removeAction s_player_tamedog;
	s_player_tamedog = -1;
	player removeAction s_player_feeddog;
	s_player_feeddog = -1;
	player removeAction s_player_waterdog;
	s_player_waterdog = -1;
	player removeAction s_player_staydog;
	s_player_staydog = -1;
	player removeAction s_player_trackdog;
	s_player_trackdog = -1;
	player removeAction s_player_barkdog;
	s_player_barkdog = -1;
	player removeAction s_player_warndog;
	s_player_warndog = -1;
	player removeAction s_player_followdog;
	s_player_followdog = -1;
	player removeAction s_player_manageDoor;
    s_player_manageDoor = -1;
   	player removeAction s_player_unlockvault;
	s_player_unlockvault = -1;
	player removeAction s_player_packvault;
	s_player_packvault = -1;
	player removeAction s_player_lockvault;
	s_player_lockvault = -1;
	player removeAction s_player_information;
	s_player_information = -1;
	player removeAction s_player_fillgen;
	s_player_fillgen = -1;
	player removeAction s_player_upgrade_build;
	s_player_upgrade_build = -1;
	player removeAction s_player_maint_build;
	s_player_maint_build = -1;
	player removeAction s_player_downgrade_build;
	s_player_downgrade_build = -1;
	player removeAction s_player_towing;
	s_player_towing = -1;
	player removeAction s_player_fuelauto;
	s_player_fuelauto = -1;
	player removeAction s_player_fuelauto2;
	s_player_fuelauto2 = -1;
	player removeAction s_givemoney_dialog;
	s_givemoney_dialog = -1;
	player removeAction s_bank_dialog;
	s_bank_dialog = -1;
	player removeAction s_bank_dialog2;
	s_bank_dialog2 = -1;
	player removeAction s_bank_dialog3;
    s_bank_dialog3 = -1;
	player removeAction s_fast_med_dialog1;
	s_fast_med_dialog1 = -1;
	player removeAction s_player_packOBJ;
	s_player_packOBJ = -1;
		

};

_dogHandle = player getVariable ["dogID", 0];

if (_dogHandle > 0) then {
	_dog = _dogHandle getFSMVariable "_dog";
	_characterID = "0";
	if (!isNull cursorTarget) then { _characterID = cursorTarget getVariable ["CharacterID","0"]; };
	if (_canDo && !_inVehicle && alive _dog && _characterID != dayz_characterID) then {
		if (s_player_movedog < 0) then {
			s_player_movedog = player addAction [localize "str_actions_movedog", "\z\addons\dayz_code\actions\dog\move.sqf", player getVariable ["dogID", 0], 1, false, true, "", ""];
		};
		if (s_player_speeddog < 0) then {
			_text = (localize "str_epoch_player_249");
			_speed = 0;
			if (_dog getVariable ["currentSpeed",1] == 0) then { _speed = 1; _text = (localize "str_epoch_player_250"); };
			s_player_speeddog = player addAction [format[localize "str_actions_speeddog", _text], "\z\addons\dayz_code\actions\dog\speed.sqf",[player getVariable ["dogID", 0],_speed], 0, false, true, "", ""];
		};
		if (s_player_calldog < 0) then {
			s_player_calldog = player addAction [localize "str_actions_calldog", "\z\addons\dayz_code\actions\dog\follow.sqf", [player getVariable ["dogID", 0], true], 2, false, true, "", ""];
		};
	};
} else {
	player removeAction s_player_movedog;		
	s_player_movedog =		-1;
	player removeAction s_player_speeddog;
	s_player_speeddog =		-1;
	player removeAction s_player_calldog;
	s_player_calldog = 		-1;
};