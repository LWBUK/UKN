startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

dayZ_instance =	11;			
dayZ_serverName = "UKN";
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;
server_name = "UKN";


DZE_PlotOwnership = true;
DZE_APlotforLife = true;
DZE_modularBuild = true;
DZE_noRotate = ["ItemVault","Plastic_Pole_EP1_DZ"]; //Objects that cannot be rotated. Ex: DZE_noRotate = ["ItemVault"] (NOTE: The objects magazine classname)
DZE_vectorDegrees = [0.01, 0.1, 1, 5, 15, 45, 90];
DZE_curDegree = 45; //Starting rotation angle. //Prefered any value in array above
DZE_dirWithDegrees = true; //When rotating objects with Q&E, use the custom degrees

player setVariable ["BIS_noCoreConversations", true];

enableRadio true;
enableSentences false;

dayz_spawnselection = 0;
dayz_paraSpawn = false;
spawnShoremode = 1; 
spawnArea= 1500; 
MaxVehicleLimit = 300; 
MaxDynamicDebris = 0;
dayz_MapArea = 14000; 
dayz_maxLocalZombies = 8; 
dayz_maxGlobalZombiesInit = 8;
dayz_maxGlobalZombiesIncrease = 8;
dayz_maxZeds = 50;
dayz_paraSpawn = false;
dayz_minpos = -1; 
dayz_maxpos = 16000;
dayz_sellDistance = 30;
dayz_sellDistance_vehicle = 50;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 70;
DZE_Friendly = true;
DZE_BackpackGuard = true; 
dayz_maxAnimals = 2; 
dayz_fullMoonNights = true;
dayz_tameDogs = true;
DynamicVehicleDamageLow = 10; 
DynamicVehicleDamageHigh = 60; 
DZE_BuildOnRoads = false; 
DZE_ConfigTrader = true;
DZE_AsReMix_PLAYER_HUD = true;
DZE_SelfTransfuse = true;
DZE_selfTransfuse_Values = [10000, 5, 120];
DZE_R3F_WEIGHT = false;
DZE_DeathMsgGlobal = true;
DZE_DeathMsgSide = false;
DZE_DeathMsgTitleText = false;
DZE_ForceNameTagsOff = true;
DZE_ForceNameTagsInTrader = true;
DZE_HeliLift = false;
MaxAmmoBoxes = 0;
MaxMineVeins = 5;
DZE_BuildingLimit = 170; 
DZE_GodModeBase = false; 
DZE_DamageBeforeMaint = 0.09;	
DZE_requireplot = 1; 
DZE_PlotPole = [40,150];
DZE_BuildHeight = 40; //Max build height
DZE_maintainRange = ((DZE_PlotPole select 0)+20);
DZE_StaticConstructionCount = 1;
DZE_VIEWDISTANCE_ENABLE = true;
DZE_MissionLootTable = true; 
//DZE_AllowForceSave = true;
//DZE_Garage = ["UN_CDF_Soldier_Pilot_EP1","Worker2","GUE_Soldier_Sab","US_Soldier_Sniper_NV_EP1"];
DZE_kick_before_restart = true; //Enable the kick before restart true/false
DZE_kick_time = [1,59]; //Time to kick players [1,59] will kick at 1 hr and 59 minutes uptime

DZE_PlayerZed = false;
DZE_TRADER_SPAWNMODE = false;
DZE_vehicleAmmo = 0;
//DZE_LootSpawnTimer = 10;


ServerIllegalRadius = 700;//traders

ServerIllegalRadius2 = 300;//banks

ServerIllegalRadius3 = 100; //Fire hospital fuel

ServerNoBuildList = [ "Land_Mil_ControlTower",
"Land_SS_hangar",
"Land_Mil_Barracks_i",
"Land_Mil_Barracks_L",
"Land_Mil_House",
"Land_Mil_Barracks",
"Land_budova4_in",
"HeliHEmpty",
"Misc_cargo1B_military",
"MAP_runway_main","MAP_runway_end15","MAP_runway_poj_L_2_end"];

ServerNoBuildList2 =["WarfareBunkerSign"];
ServerNoBuildList3 =["Land_a_stationhouse","Land_A_Hospital","Land_A_fuelstation_feed"];



diag_log "Loading Server Options";
EpochEvents = [
			   
			   ];

call compile preprocessFileLineNumbers "SD\init\Variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "SD\init\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
call compile preprocessFileLineNumbers "SD\functions\PlotProtection\init.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "SD\init\compiles.sqf";
call compile preprocessFileLineNumbers "addons\bike\init.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "SD\Server_Traders\server_traders.sqf";
call compile preprocessFileLineNumbers "logistic\init.sqf";
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

diag_log "Loading Server Monitor & Server Executions!";
if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	_serverMonitor = [] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
    };
	
diag_log "Loading Dedicated Executions!";
if (!isDedicated) then {

		
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	_nil = [] execVM "custom\remote_messages.sqf";
	_nil = [] execVM "custom\remote\remote.sqf";
	if (DZE_AsReMix_PLAYER_HUD) then {
	execVM "SD\Player_Hud\playerHud.sqf";
	
	 
	[] execVM "SD\functions\von.sqf";
	[]execVM "SD\functions\messages.sqf";
	//[] execVM "SD\functions\OPload.sqf";
    };
	execVM "spawn\start.sqf";
	execVM "dzgm\init.sqf";

	execVM "SD\compile\player_tradermarkers.sqf";
		execVM "SD\functions\addbankmarkers.sqf";
	execVM "SD\compile\kill_msg.sqf";
    execVM "SD\functions\heliddos.sqf";
};

execVM "SD\functions\safezones.sqf"; 
//execVM "SD\functions\reward.sqf"; 
[] execVM "SD\functions\service_point\service_point.sqf";
execVM "SD\functions\init.sqf";
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"


[] ExecVM "custom\loadouts.sqf";
execVM "SD\functions\missionveh.sqf";


diag_log "Fully loaded Init";


if (!isNil "server_name") then {
[] spawn {
waitUntil {(!isNull Player) and (alive Player) and (player == player)};
waituntil {!(isNull (findDisplay 46))};
5 cutRsc ["wm_disp","PLAIN"];
((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText server_name;
};
};