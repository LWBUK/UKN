MDC_fnc_numberToString = {
	_number = _this;
	_str = "";
	if (_number == 0) then {
		_str = "0";
	} else {
		_negative = false;
		if (_number < 0) then {
			_number = abs _number;
			_negative = true;
		};
		if (_number % 1 == 0) then {
			while { _number > 0 } do {
				_digit = floor (_number % 10);
				_str = (str _digit) + _str;
				_number = floor (_number / 10);
			};
		} else {
			_decimals = _number % 1;
			_decimals = _decimals * 1000000;
			_number = floor _number;
			_str = _number call MDC_fnc_numberToString;
			_str = _str + "." + str _decimals;
		};
		if (_negative) then { _str = "-" + _str; };
	};
	_str;
};

SC_fnc_removeCoins=
{
	private ["_player","_amount","_wealth","_newwealth", "_result"];
	_player = _this select 0;
	_amount = _this select 1;
	_result = false;
	_wealth = _player getVariable["cashMoney",0];  
	if(_amount > 0)then{
	if (_wealth < _amount) then {
	_result = false;
	} else {                         
	_newwealth = _wealth - _amount;
	_player setVariable["cashMoney",_newwealth, true];
	_player setVariable ["moneychanged",1,true];    
	_result = true;
	PVDZE_plr_Save = [_player,(magazines _player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";            
	};
	}else{
	_result = true;
	};
	_result
};

SC_fnc_addCoins = 
{
	private ["_player","_amount","_wealth","_newwealth", "_result"];			
	_player =  _this select  0;
	_amount =  _this select  1;
	_result = false;	
	_wealth = _player getVariable["cashMoney",0];
	_player setVariable["cashMoney",_wealth + _amount, true];
	PVDZE_plr_Save = [_player,(magazines _player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	_player setVariable ["moneychanged",1,true];					
	_newwealth = _player getVariable["cashMoney",0];		
	if (_newwealth >= _wealth) then { _result = true; };			
	_result
};

    BIS_fnc_numberDigits = compile preprocessFileLineNumbers "SD\Player_Hud\numberDigits.sqf";
    BIS_fnc_numberText = compile preprocessFileLineNumbers "SD\Player_Hud\numberText.sqf"; 


    /*Plot*/
	PlotGetFriends 		= compile preprocessFileLineNumbers "SD\actions\plotGetFriends.sqf";
	PlotNearbyHumans 	= compile preprocessFileLineNumbers "SD\actions\plotNearbyHumans.sqf";
	PlotAddFriend 		= compile preprocessFileLineNumbers "SD\actions\plotAddFriend.sqf";
	PlotRemoveFriend 	= compile preprocessFileLineNumbers "SD\actions\plotRemoveFriend.sqf";
	MaintainPlot    	= compile preprocessFileLineNumbers "SD\actions\maintain_area.sqf";
    PlotPreview    		= compile preprocessFileLineNumbers "SD\actions\plotToggleMarkers.sqf";
    PlotObjects         = compile preprocessFileLineNumbers "SD\actions\plotObjects.sqf"; 
	/*Plot End*/
	
	//Garage
	//player_getVehicle = 			compile preprocessFileLineNumbers "SD\functions\Garage\getvehicle.sqf";
	//player_storeVehicle = 			compile preprocessFileLineNumbers "SD\functions\Garage\player_storeVehicle.sqf";
	//vehicle_info = compile preprocessFileLineNumbers "SD\functions\Garage\vehicle_info.sqf";

if (!isDedicated) then {

    VehicleColourPaint =			compile preprocessFileLineNumbers "SD\functions\vehicleColourPaint.sqf";
    VehicleColourUpdate =			compile preprocessFileLineNumbers "SD\functions\VehicleColourUpdate.sqf";
    VehicleColourUpdate2 =			compile preprocessFileLineNumbers "SD\functions\VehicleColourUpdate2.sqf";
    player_paint =				    compile preprocessFileLineNumbers "SD\functions\player_paint.sqf";

	//turbo glitch fix
	dayz_spaceInterrupt = compile preprocessFileLineNumbers "SD\actions\dayz_spaceInterrupt.sqf";
	
	/*DoorManagement Zupa*/
    DoorGetFriends 		= compile preprocessFileLineNumbers "SD\functions\doorManagement\doorGetFriends.sqf";
    DoorNearbyHumans 	= compile preprocessFileLineNumbers "SD\functions\doorManagement\doorNearbyHumans.sqf";
    DoorAddFriend 		= compile preprocessFileLineNumbers "SD\functions\doorManagement\doorAddFriend.sqf";
    DoorRemoveFriend 	= compile preprocessFileLineNumbers "SD\functions\doorManagement\doorRemoveFriend.sqf";
    player_unlockDoor       = compile preprocessFileLineNumbers "SD\functions\doorManagement\player_unlockDoor.sqf";
    player_unlockDoorCode = compile preprocessFileLineNumbers "SD\functions\doorManagement\player_unlockDoorCode.sqf";
    player_manageDoor       = compile preprocessFileLineNumbers "SD\functions\doorManagement\initDoorManagement.sqf";
    player_enterCode       = compile preprocessFileLineNumbers "SD\functions\doorManagement\player_enterCode.sqf";
    player_changeCombo = compile preprocessFileLineNumbers "SD\functions\doorManagement\player_changeCombo.sqf"; 
    /*DoorManagement End*/

	"filmic" setToneMappingParams [0.07, 0.31, 0.23, 0.37, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
	BIS_Effects_Burn = compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
	player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
	player_zombieAttack = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieAttack.sqf";
	fnc_usec_damageActions = compile preprocessFileLineNumbers "SD\compile\fn_damageActions.sqf";
	fnc_inAngleSector = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_inAngleSector.sqf";
	fnc_usec_selfActions = compile preprocessFileLineNumbers "SD\compile\fn_selfActions.sqf";
	fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
	player_temp_calculation	= compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_temperatur.sqf";
	player_weaponFiredNear = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_weaponFiredNear.sqf";
	player_animalCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_animalCheck.sqf";
	player_spawnCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_spawnCheck.sqf";
	player_dumpBackpack = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_dumpBackpack.sqf";
	building_spawnLoot = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\building_spawnLoot.sqf";
	building_spawnZombies = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\building_spawnZombies.sqf";
	dayz_spaceInterrupt = compile preprocessFileLineNumbers "SD\actions\dayz_spaceInterrupt.sqf";
	player_fired = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_fired.sqf";
	player_harvest = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_harvest.sqf";
	player_packTent = compile preprocessFileLineNumbers "SD\compile\player_packTent.sqf";
	player_packVault = compile preprocessFileLineNumbers "SD\compile\player_packVault.sqf";
	player_unlockVault = compile preprocessFileLineNumbers "SD\compile\player_unlockVault.sqf";
	player_removeObject = compile preprocessFileLineNumbers "SD\actions\remove.sqf";
	player_removeNearby = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_removeNearby.sqf";

	player_removeTankTrap = {
		[["Hedgehog_DZ"], 1,"STR_EPOCH_ACTIONS_14"] call player_removeNearby;
	};

	player_removeNet = {
		[["Sr_border","PARACHUTE_TARGET","DesertLargeCamoNet","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ"], 5,"str_epoch_player_8"] call player_removeNearby;
	};

	player_login = {
		private ["_unit","_detail"];
		_unit = _this select 0;
		_detail = _this select 1;
		if(_unit == getPlayerUID player) then {
			player setVariable["publish",_detail];
		};
	};

	player_lockVault = compile preprocessFileLineNumbers "SD\compile\player_lockVault.sqf";
	player_updateGui = compile preprocessFileLineNumbers "SD\compile\player_updateGui.sqf";
	player_crossbowBolt = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_crossbowBolt.sqf";
	player_music = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_music.sqf";
	player_death = compile preprocessFileLineNumbers "SD\functions\player_death.sqf";
	player_switchModel = compile preprocessFileLineNumbers "SD\compile\player_switchModel.sqf";
	player_checkStealth = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_checkStealth.sqf";
	world_sunRise = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_sunRise.sqf";
	world_surfaceNoise = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_surfaceNoise.sqf";
	player_humanityMorph = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_humanityMorph.sqf";
	player_throwObject = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_throwObject.sqf";
	player_alertZombies = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_alertZombies.sqf";
	player_fireMonitor = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\fire_monitor.sqf";
	fn_gearMenuChecks = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_gearMenuChecks.sqf";
	object_roadFlare = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_roadFlare.sqf";
	object_setpitchbank = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_setpitchbank.sqf";
	object_monitorGear = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_monitorGear.sqf";
	local_roadDebris = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\local_roadDebris.sqf";
	zombie_findTargetAgent = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\zombie_findTargetAgent.sqf";
	zombie_loiter = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\zombie_loiter.sqf";
	zombie_generate =     compile preprocessFileLineNumbers "SD\functions\walkers\zombie_generate.sqf";
	wild_spawnZombies =  compile preprocessFileLineNumbers "SD\functions\walkers\wild_spawnZombies.sqf";
	pz_attack = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\pzombie\pz_attack.sqf";
	dog_findTargetAgent = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\dog_findTargetAgent.sqf";
	player_countmagazines = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_countmagazines.sqf";
	player_addToolbelt = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_addToolbelt.sqf";
	player_copyKey = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_copyKey.sqf";
	player_reloadMag = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_reloadMags.sqf";
	player_loadCrate = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_loadCrate.sqf";
	player_craftItem = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_craftItem.sqf";
	player_tentPitch = compile preprocessFileLineNumbers "SD\actions\tent_pitch.sqf";
	player_vaultPitch = compile preprocessFileLineNumbers "SD\actions\vault_pitch.sqf";
	player_drink = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_drink.sqf";
	player_eat = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_eat.sqf";
	player_useMeds = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_useMeds.sqf";
	player_fillWater = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\water_fill.sqf";
	player_makeFire = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_makefire.sqf";
	player_harvestPlant = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_harvestPlant.sqf";
	player_goFishing = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_goFishing.sqf";
	if (DZE_modularBuild) then {
		player_build =				compile preprocessFileLineNumbers "SD\actions\modular_build.sqf";
		player_build_countNearby =	compile preprocessFileLineNumbers "SD\actions\player_build_countNearby.sqf";
		player_build_states =		compile preprocessFileLineNumbers "SD\actions\player_build_states.sqf";
		player_build_needNearby =	compile preprocessFileLineNumbers "SD\actions\player_build_needNearby.sqf";
		player_build_getConfig =	compile preprocessFileLineNumbers "SD\actions\player_build_getConfig.sqf";
		player_build_plotCheck =	compile preprocessFileLineNumbers "SD\actions\player_build_plotCheck.sqf";
		player_build_buildReq =		compile preprocessFileLineNumbers "SD\actions\player_build_buildReq.sqf";
		player_build_create =		compile preprocessFileLineNumbers "SD\actions\player_build_create.sqf";
		player_build_controls =		compile preprocessFileLineNumbers "SD\actions\player_build_controls.sqf";
		player_build_publish =		compile preprocessFileLineNumbers "SD\actions\player_build_publish.sqf";
		DZE_snap_build_file = 		"SD\actions\snap_build.sqf"; // Set as a global variable as it is also referenced in snapbuild.sqf
		snap_build = 				compile preprocessFileLineNumbers DZE_snap_build_file;
		fnc_SetPitchBankYaw =       compile preprocessFileLineNumbers "SD\actions\fnc_SetPitchBankYaw.sqf";
        DZE_build_vector_file = 	"SD\actions\build_vectors.sqf";
        build_vectors = 			compile preprocessFileLineNumbers DZE_build_vector_file;
	} else {
		player_build =				compile preprocessFileLineNumbers "SD\actions\player_build.sqf";
	};
	
	FNC_check_owner =			compile preprocessFileLineNumbers "SD\compile\fn_check_owner.sqf";
	player_wearClothes = compile preprocessFileLineNumbers "SD\actions\player_wearClothes.sqf";
	object_pickup = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\object_pickup.sqf";
	player_flipvehicle = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_flipvehicle.sqf";
	player_sleep = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_sleep.sqf";
	player_antiWall = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_antiWall.sqf";
	player_deathBoard = compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\list_playerDeathsAlt.sqf";
	player_plotPreview = compile preprocessFileLineNumbers "SD\actions\object_showPlotRadius.sqf";
	player_upgradeVehicle = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_upgradeVehicle.sqf";
	player_selectSlot = compile preprocessFileLineNumbers "overwrites\click_actions\ui_selectSlot.sqf";
	player_gearSync = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_gearSync.sqf";
	player_gearSet = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_gearSet.sqf";
	ui_changeDisplay = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\ui_changeDisplay.sqf";
	ui_gear_sound = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\ui_gear_sound.sqf";
	player_monitor = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\player_monitor.sqf";
	player_spawn_1 = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\player_spawn_1.sqf";
	player_spawn_2 = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\player_spawn_2.sqf";
	onPreloadStarted "dayz_preloadFinished = false;";
	onPreloadFinished "dayz_preloadFinished = true;";
	player_hasTools = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_hasTools.sqf";
	player_checkItems = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_checkItems.sqf";
	player_removeItems = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_removeItems.sqf";
	player_traderCity = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_traderCity.sqf";	

	player_checkAndRemoveItems = {
		private ["_items","_b"];
		_items = _this;
		_b = _items call player_checkItems;
		if (_b) then {
			_b = _items call player_removeItems;
		};
		_b
	};

	dayz_HungerThirst = {
		dayz_hunger = dayz_hunger + (_this select 0);
		dayz_thirst = dayz_thirst + (_this select 1);
	};

	epoch_totalCurrency = {
		_total_currency = 0;
		{
			_part =  (configFile >> "CfgMagazines" >> _x);
			_worth =  (_part >> "worth");
			if isNumber (_worth) then {
				_total_currency = _total_currency + getNumber(_worth);
			};
		} count (magazines player);
		_total_currency
	};

	epoch_itemCost = {
		_trade_total = 0;
		{
			_part_in_configClass =  configFile >> "CfgMagazines" >> (_x select 0);
			if (isClass (_part_in_configClass)) then {
				_part_inWorth = (_part_in_configClass >> "worth");
				if isNumber (_part_inWorth) then {
					_trade_total = _trade_total + (getNumber(_part_inWorth) * (_x select 1));
				};
			};
		} count _this;
		_trade_total
	};

	epoch_returnChange = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\epoch_returnChange.sqf";

	dayz_losChance = {
		private["_agent","_maxDis","_dis","_val","_maxExp","_myExp"];
		_agent = _this select 0;
		_dis = _this select 1;
		_maxDis = _this select 2;
		_val = (_maxDis - _dis) max 0;
		_maxExp = ((exp 2) * _maxDis);
		_myExp = ((exp 2) * (_val)) / _maxExp;
		_myExp = _myExp * 0.7;
		_myExp
	};

	ui_initDisplay = {
		private["_control","_ctrlBleed","_display","_ctrlFracture","_ctrlDogFood","_ctrlDogWater","_ctrlDogWaterBorder", "_ctrlDogFoodBorder"];
		disableSerialization;
		_display = uiNamespace getVariable 'DAYZ_GUI_display';
		_control = _display displayCtrl 1204;
		_control ctrlShow false;
		if (!r_player_injured) then {
			_ctrlBleed = _display displayCtrl 1303;
			_ctrlBleed ctrlShow false;
		};
		if (!r_fracture_legs && !r_fracture_arms) then {
			_ctrlFracture = _display displayCtrl 1203;
			_ctrlFracture ctrlShow false;
		};
		_ctrlDogFoodBorder = _display displayCtrl 1501;
		_ctrlDogFoodBorder ctrlShow false;
		_ctrlDogFood = _display displayCtrl 1701;
		_ctrlDogFood ctrlShow false;
		_ctrlDogWaterBorder = _display displayCtrl 1502;
		_ctrlDogWaterBorder ctrlShow false;
		_ctrlDogWater = _display displayCtrl 1702;
		_ctrlDogWater ctrlShow false
	};

	dayz_losCheck = {
		private["_target","_agent","_cantSee"];
		_target = _this select 0;
		_agent = _this select 1;
		_cantSee = true;
		if (!isNull _target) then {
			_tPos = visiblePositionASL _target;
			_zPos = visiblePositionASL _agent;
			_tPos set [2,(_tPos select 2)+1];
			_zPos set [2,(_zPos select 2)+1];
			if ((count _tPos > 0) && (count _zPos > 0)) then {
				_cantSee = terrainIntersectASL [_tPos, _zPos];
				if (!_cantSee) then {
					_cantSee = lineIntersects [_tPos, _zPos, _agent, vehicle _target];
				};
			};
		};
		_cantSee
	};

	dayz_equipCheck = {
		private ["_empty", "_needed","_diff","_success"];
		_config = _this;
		_empty = [player] call BIS_fnc_invSlotsEmpty;
		_needed = [_config] call BIS_fnc_invSlotType;
		_diff = [_empty,_needed] call BIS_fnc_vectorDiff;
		_success = true;
		{
			if (_x > 0) then {_success = false};
		} count _diff;
		hint format["Config: %5\nEmpty: %1\nNeeded: %2\nDiff: %3\nSuccess: %4",_empty,_needed,_diff,_success,_config];
		_success
	};

	vehicle_gear_count = {
		private["_counter"];
		_counter = 0;
		{
			_counter = _counter + _x;
		} count _this;
		_counter
	};

	player_tagFriendlyMsg = {
		if(player == (_this select 0)) then {
			cutText[(localize "str_epoch_player_2"),"PLAIN DOWN"];
		};
	};

	player_serverModelChange = {
		private["_object","_model"];
		_object = _this select 0;
		_model = _this select 1;
		if (_object == player) then {
			_model call player_switchModel;
		};
	};

	player_guiControlFlash = {
		private["_control"];
		_control = _this;
		if (ctrlShown _control) then {
			_control ctrlShow false;
		} else {
			_control ctrlShow true;
		};
	};
	
	//["Weapon", player, "ItemBriefcase", 2] call AN_fnc_removeCargoGlobal
	AN_fnc_removeCargoGlobal = {
		_mode = [_this, 0, "", [""]] call BIS_fnc_param;
		_unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
		_classname = [_this, 2, "", [""]] call BIS_fnc_param;
		_amount = [_this, 3, 1, [0]] call BIS_fnc_param;

		if (!(_mode in ["Magazine", "Weapon", "Backpack"]) || {isNull _unit} || {_classname == ""}) exitWith { false };

		_array = call compile format ["get%1Cargo _unit", _mode];

		_index = (_array select 0) find _classname;
		if (_index < 0) exitWith { false };

		_count = (_array select 1) select _index;
		if (_count < _amount) exitWith { false };

		(_array select 1) set [_index, _count - _amount];

		call compile format ["clear%1CargoGlobal _unit", _mode];

		{
			call compile format ["_unit add%1CargoGlobal [_x, (_array select 1) select _forEachIndex]", _mode];
		} forEach (_array select 0);

		true
	};

	AN_fnc_getName = {
		if (typeName _this == "OBJECT") then { _this = typeOf _this; };

		{
			if (isClass (configFile >> _x >> _this)) exitWith { getText (configFile >> _x >> _this >> "displayName") };
			_this
		} forEach ["CfgVehicles","CfgWeapons","CfgMagazines"];
	};
	
	gearDialog_create = {
		private ["_i","_dialog"];
		if (!isNull (findDisplay 106)) then {
			(findDisplay 106) closeDisplay 0;
		};
		openMap false;
		closeDialog 0;
		if (gear_done) then {sleep 0.001;};
		player action ["Gear", player];
		if (gear_done) then {sleep 0.001;};
		_dialog = findDisplay 106;
		_i = 0;
		while {isNull _dialog} do {
			_i = _i + 1;
			_dialog = findDisplay 106;
			if (gear_done) then {sleep 0.001;};
			if (_i in [100,200,299]) then {
				closeDialog 0;
				player action ["Gear", player];
			};
			if (_i > 300) exitWith {};
		};
		if (gear_done) then {sleep 0.001;};
		_dialog = findDisplay 106;
		if ((parseNumber(_this select 0)) != 0) then {
			ctrlActivate (_dialog displayCtrl 157);
			if (gear_done) then {
				waitUntil {ctrlShown (_dialog displayCtrl 159)};
				sleep 0.001;
			};
		};
		_dialog
	};

	gear_ui_offMenu = {
		private["_control","_parent","_menu"];
		disableSerialization;
		_control = _this select 0;
		_parent = findDisplay 106;
		if (!(_this select 3)) then {
			for "_i" from 0 to 9 do {
			_menu = _parent displayCtrl (1600 + _i);
			_menu ctrlShow false;
		};
			_grpPos = ctrlPosition _control;
			_grpPos set [3,0];
			_control ctrlSetPosition _grpPos;
			_control ctrlShow false;
			_control ctrlCommit 0;
		};
	};

	dze_surrender_off = {
		player setVariable ["DZE_Surrendered", false, true];
		DZE_Surrender = false;
	};
	
autoRunOff = {
	autoRunActive = 0;
	terminate autoRunThread;
	player playActionNow "Stop";
};

	gear_ui_init = {
		private["_control","_parent","_menu","_dspl","_grpPos"];
		disableSerialization;
		_parent = findDisplay 106;
		_control = _parent displayCtrl 6902;
		for "_i" from 0 to 9 do {
			_menu = _parent displayCtrl (1600 + _i);
			_menu ctrlShow false;
		};
		_grpPos = ctrlPosition _control;
		_grpPos set [3,0];
		_control ctrlSetPosition _grpPos;
		_control ctrlShow false;
		_control ctrlCommit 0;
	};

	dayz_eyeDir = {
		private["_vval","_vdir"];
		_vval = (eyeDirection _this);
		_vdir = (_vval select 0) atan2 (_vval select 1);
		if (_vdir < 0) then {_vdir = 360 + _vdir};
		_vdir
	};

	DZE_getModelName = {
		_objInfo = toArray(str(_this));
		_lenInfo = count _objInfo - 1;
		_objName = [];
		_i = 0;
		{
			if (58 == _objInfo select _i) exitWith {};
			_i = _i + 1;
		} count _objInfo;
		_i = _i + 2;
		for "_k" from _i to _lenInfo do {
			_objName set [(count _objName), (_objInfo select _k)];
		};
		_objName = toLower(toString(_objName));
		_objName
	};

	dze_isnearest_player = {
		private ["_notClosest","_playerDistance","_nearPlayers","_obj","_playerNear"];
		if(!isNull _this) then {
			_nearPlayers = _this nearEntities ["CAManBase", 12];
			_playerNear = ({isPlayer _x} count _nearPlayers) > 1;
			_notClosest = false;
			if (_playerNear) then {
				_playerDistance = player distance _this;
				{
					if (_playerDistance > (_x distance _this)) exitWith { _notClosest = true; };
				} count _nearPlayers;
			};
		} else {
			_notClosest = false;
		};
		_notClosest
	};

	if (DZE_ConfigTrader) then {
		call compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_traderMenuConfig.sqf";
	} else {
		call compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_traderMenuHive.sqf";
	};

	call compile preprocessFileLineNumbers "SD\compile\player_murderMenu.sqf";

	[] spawn {
        private["_timeOut","_display","_control1","_control2"];
        disableSerialization;
        _timeOut = 0;
        dayz_loadScreenMsg = "";
        diag_log "DEBUG: loadscreen guard started.";
        _display = uiNameSpace getVariable "BIS_loadingScreen";
        if (!isNil "_display") then {
                _control1 = _display displayctrl 8400;
                _control2 = _display displayctrl 102;
        };
		if (!isNil "dayz_DisplayGenderSelect") then {
			waitUntil {!dayz_DisplayGenderSelect};
		};

        while { _timeOut < 12000 } do {
           if (dayz_clientPreload && dayz_authed) exitWith { 
					diag_log "PLOGIN: Login loop completed!"; 
					endLoadingScreen;
				 };
            if (!isNil "_display") then {
                if ( isNull _display ) then {
                        waitUntil { !dialog; };
                        startLoadingScreen ["","RscDisplayLoadCustom"];
                        _display = uiNameSpace getVariable "BIS_loadingScreen";
                        _control1 = _display displayctrl 8400;
                        _control2 = _display displayctrl 102;
                };

                if ( dayz_loadScreenMsg != "" ) then {
                        _control1 ctrlSetText dayz_loadScreenMsg;
                        dayz_loadScreenMsg = "";
                };
                _control2 ctrlSetText format["%1",round(_timeOut*0.01)];
            };

            _timeOut = _timeOut + 1;

            if (_timeOut >= 12000) then {
                1 cutText [localize "str_player_login_timeout", "PLAIN DOWN"];
                sleep 10;
                endLoadingScreen;
                endMission "END1";
            };
            sleep 0.01;
        };
	};

	dayz_meleeMagazineCheck = {
        private["_meleeNum","_magType"];
        _magType = ([] + getArray (configFile >> "CfgWeapons" >> _wpnType >> "magazines")) select 0;
        _meleeNum = ({_x == _magType} count magazines player);
        if (_meleeNum < 1) then {
             player addMagazine _magType;
        };
    };

	dayz_originalPlayer = player;

	progressLoadingScreen 0.8;

};

	BIS_fnc_selectRandom = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\BIS_fnc\fn_selectRandom.sqf";
	BIS_fnc_vectorAdd = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\BIS_fnc\fn_vectorAdd.sqf";
	BIS_fnc_halo = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\BIS_fnc\fn_halo.sqf";
	BIS_fnc_findNestedElement = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\BIS_fnc\fn_findNestedElement.sqf";
	BIS_fnc_param = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\BIS_fnc\fn_param.sqf";
	fnc_buildWeightedArray = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_buildWeightedArray.sqf";
	//fnc_usec_damageVehicle = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandlerVehicle.sqf";
	object_setHitServer = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_setHitServer.sqf";
	object_setFixServer = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_setFixServer.sqf";
	object_getHit = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_getHit.sqf";
	object_setHit = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_setHit.sqf";
	object_processHit = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_processHit.sqf";
	object_delLocal = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_delLocal.sqf";
	fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
	fnc_veh_ResetEH = compile preprocessFileLineNumbers "\z\addons\dayz_code\init\veh_ResetEH.sqf";
	//vehicle_handleDamage = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
	vehicle_handleKilled = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";
	fnc_inString = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_inString.sqf";
	fnc_isInsideBuilding = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_isInsideBuilding.sqf";
	fnc_isInsideBuilding2 = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_isInsideBuilding2.sqf";
	fnc_isInsideBuilding3 = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_isInsideBuilding3.sqf";
	dayz_zombieSpeak = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_speak.sqf";
	vehicle_getHitpoints = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_getHitpoints.sqf";
	local_gutObject = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\local_gutObject.sqf";
	local_lockUnlock = compile preprocessFileLineNumbers "SD\clickactions\local_lockUnlock.sqf";
	local_gutObjectZ = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\local_gutObjectZ.sqf";
	local_zombieDamage = compile preprocessFileLineNumbers "SD\compile\fn_damageHandlerZ.sqf";
	local_eventKill = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\local_eventKill.sqf";
	curTimeStr = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_curTimeStr.sqf";
	player_medBandage = compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medBandaged.sqf";
	player_medInject = compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medInject.sqf";
	player_medEpi = compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medEpi.sqf";
	player_medTransfuse = compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medTransfuse.sqf";
	player_medMorphine = compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medMorphine.sqf";
	player_breaklegs = compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medBreakLegs.sqf";
	player_medPainkiller = compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medPainkiller.sqf";
	world_isDay = {if ((daytime < (24 - dayz_sunRise)) && (daytime > dayz_sunRise)) then {true} else {false}};
	player_humanityChange = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_humanityChange.sqf";
	spawn_loot = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\spawn_loot.sqf";
	spawn_loot_small = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\spawn_loot_small.sqf";

	FNC_GetPlayerUID = {
		private ["_object","_version","_PID"];
		_object = _this select 0;
		_version = productVersion select 3;
		if (DayZ_UseSteamID) then {
			_PID = GetPlayerUID _object;
		} else {
			if (_version >= 125548) then {
				_PID = call (compile "GetPlayerUIDOld _object");
			} else {
				_PID = GetPlayerUID _object;
				diag_log format["Your game version, %1, is less than the required for the old UID system; using Steam ID system instead. Update to 1.63.125548 (or latest steam beta)", _version];
			};
		};
		_PID
	};
	
	FNC_GetSetPos = {
		private "_pos";
		_thingy = _this select 0;
		_pos = getPosASL _thingy;
		if (surfaceIsWater _pos) then {
			_thingy setPosASL _pos;
		} else {
			_thingy setPosATL (ASLToATL _pos);
		};
	};

	FNC_GetPos = {
		private "_pos";
		if (isNil {_this select 0}) exitWith {[0,0,0]};
		_thingy = _this select 0;
		_pos = getPosASL _thingy;
		if !(surfaceIsWater _pos) then {
			_pos =  ASLToATL _pos;
		};
		_pos
	};

	local_setFuel =	{
		private["_qty","_vehicle"];
		_vehicle = _this select 0;
		_qty = _this select 1;
		_vehicle setFuel _qty;
	};

	zombie_initialize = {
		private ["_unit","_position"];
		_unit = _this select 0;
		if (isServer) then {
			_unit addEventHandler ["local", {_this call zombie_findOwner}];
		};
		_id = _unit addeventhandler["HandleDamage", { _this call local_zombieDamage }];
		_id = _unit addeventhandler["Killed", { [_this, "zombieKills"] call local_eventKill }];
	};

	dayz_EjectPlayer = {
        private ["_noDriver","_vehicle","_inVehicle"];
        _vehicle = vehicle player;
		_inVehicle = (_vehicle != player);
		if(_inVehicle) then {
			_noDriver = ((_vehicle emptyPositions "driver") > 0);
			if (_noDriver && (speed _vehicle) != 0) then {
				player action [ "eject", _vehicle];
			};
		};
	};

	player_sumMedical = {
		private["_character","_wounds","_legs","_arms","_medical"];
		_character = 	_this;
		_wounds =		[];
		if (_character getVariable["USEC_injured",false]) then {
			{
				if (_character getVariable[_x,false]) then {
					_wounds set [count _wounds,_x];
				};
			} count USEC_typeOfWounds;
		};
		_legs = _character getVariable ["hit_legs",0];
		_arms = _character getVariable ["hit_arms",0];
		_medical = [
			_character getVariable["USEC_isDead",false],
			_character getVariable["NORRN_unconscious", false],
			_character getVariable["USEC_infected",false],
			_character getVariable["USEC_injured",false],
			_character getVariable["USEC_inPain",false],
			_character getVariable["USEC_isCardiac",false],
			_character getVariable["USEC_lowBlood",false],
			_character getVariable["USEC_BloodQty",12000],
			_wounds,
			[_legs,_arms],
			_character getVariable["unconsciousTime",0],
			_character getVariable["messing",[0,0]]
		];
		_medical
	};

	if (isServer) then {
		call compile preprocessFileLineNumbers "\z\addons\dayz_server\init\server_functions.sqf";
	} else {
		eh_localCleanup = {};
	};

	call compile preprocessFileLineNumbers "SD\compile\player_traderMenu.sqf";
	call compile preprocessFileLineNumbers "SD\clickactions\MBC\config.sqf";
	
fnc_usec_damageVehicle =        compile preprocessFileLineNumbers "SD\functions\fn_damageHandlerVehicle.sqf";        //Event handler run on damage
vehicle_handleDamage =          compile preprocessFileLineNumbers "SD\functions\vehicle_handleDamage.sqf";
initialized = true;
