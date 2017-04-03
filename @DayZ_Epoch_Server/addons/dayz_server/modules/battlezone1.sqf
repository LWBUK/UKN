 diag_log("////////////////////////Battlefield Running Starting in 3600 sec\\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
 
sleep 60;
 
if (isServer) then {

 
sleep 120; // don't not lower this timer first few messages will not show don't no why just don't  touch it !!! 
 
diag_log("///////////////////////Battlefield Spawnd\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"); // this logs to the rpt let you known mission is running
 
[nil,nil,rTitleText,"Battle Zone has started..Loot will spawn in 15 mins", "PLAIN",5] call RE;
 
_hint = parseText format["<t align='center' color='#f2cb0b' shadow='2' size='1.75'>Battle Zone</t><br/><t align='center' color='#ffffff'>Battle Zone has started..Loot will spawn in 15 mins</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";
 
diag_log("//////////////////////Battlefield message 1 done\\\\\\\\\\\\\\\\\\\\\\\\\\\");
 
sleep 300;
 
[nil,nil,rTitleText,"Battle Zone 10 mins until loot has spawned!!!!", "PLAIN",5] call RE;
 
_hint = parseText format["<t align='center' color='#f2cb0b' shadow='2' size='1.75'>Battle Zone</t><br/><t align='center' color='#ffffff'>10 mins until loot has spawned!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";
 
diag_log("/////////////////////Battlefield message 2 done\\\\\\\\\\\\\\\\\\\\\\\\\");
 
sleep 300;
 
[nil,nil,rTitleText,"Battle Zone  5 mins until loot spawn!!!!", "PLAIN",5] call RE;
 
_hint = parseText format["<t align='center' color='#f2cb0b' shadow='2' size='1.75'>Battle Zone</t><br/><t align='center' color='#ffffff'>5 mins until loot has spawned!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";
 
diag_log("////////////////////////////Battlefield message 3 done\\\\\\\\\\\\\\\\\\\\");
 
sleep 180;
 
[nil,nil,rTitleText,"Battle Zone 2 mins until loot spawn!!!!", "PLAIN",5] call RE;
 
_hint = parseText format["<t align='center' color='#f2cb0b' shadow='2' size='1.75'>Battle Zone</t><br/><t align='center' color='#ffffff'>2 mins until loot has spawned!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";
 
diag_log("///////////////////////////Battlefield message 5 done\\\\\\\\\\\\\\\\\\\\\\\\\\");
 
sleep 120;
 
diag_log("///////////////////////////Battlefield Loot Box spawning\\\\\\\\\\\\\\\\\\\\\\\\\\");
 
sleep 1;
 
[nil,nil,rTitleText,"Battle Zone loot has spawned!!!!", "PLAIN",5] call RE;
 
_hint = parseText format["<t align='center' color='#f2cb0b' shadow='2' size='1.75'>Battle Zone</t><br/><t align='center' color='#ffffff'>Loot has spawned!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";
 
diag_log("///////////////////////////Battlefield message 6 done\\\\\\\\\\\\\\\\\\\\\\\\\\\\");

_soundSource_2 = objNull;
if (true) then
{
  _soundSource_2 = createSoundSource ["Sound_Alarm", [4539.43, 10458.8, 0.0143433], [], 0];
};
 
 
_vehicle_67 = objNull;
if (true) then
{
    _this = createVehicle ["RUVehicleBox", [4539.43, 10458.8, 0.0143433], [], 0, "CAN_COLLIDE"];
    _vehicle_67 = _this;
    _uniqueid = str(round(random 999999));
    _this setVariable ["ObjectID", _uniqueid, true];
    _this setVariable ["ObjectUID", _uniqueid, true];
    _this setVariable ["permaLoot",true];
    clearWeaponCargoGlobal _this;
    clearMagazineCargoGlobal _this;
	
	_WepsArr = 
	[
		["M24", 1],
		["RH_Deaglemzb", 1],
		["Mk_48_DES_EP1", 5],
		["Mk_48_DZ", 5],
		["BAF_AS50_scoped", 1],
		["USSR_cheytacM200_sd", 1],
		["USSR_cheytacM200", 1],
		["ksvk", 1],
		["DMR", 2],
		["FHQ_ACR_WDL_TWS_SD_F", 1],
		["BAF_LRR_scoped", 1],
		["Binocular", 5],
		["Binocular_Vector", 5],
		["ItemCompass", 5],
		["ItemCrowbar", 5],
		["ItemEtool", 5],
		["ItemFishingPole", 5],
		["ItemFlashlight", 5],
		["ItemFlashlightRed", 5],
		["ItemFlashlight", 5],
		["ItemGPS", 5],
		["ItemHatchet_DZE", 5],
		["ItemKnife", 5],
		["ItemMatchbox_DZE", 5],
		["ItemRadio", 5],
		["ItemSledge", 5],
		["ItemToolbox", 5],
		["ItemWatch", 5],
		["NVGoggles", 5]
	];
	
    {_this addWeaponCargoGlobal _x;} ForEach  _WepsArr;
	
	_MagsArr = 
	[
		["100Rnd_762x51_M240", 20],
		["USSR_5Rnd_408", 5],
		["20Rnd_762x51_DMR", 20],
		["5Rnd_762x51_M24", 20],
		["SmokeShell", 20],
		["FHQ_rem_30Rnd_680x43_ACR_SD", 5],
		["5Rnd_127x99_as50", 5],
		["5Rnd_86x70_L115A1", 5],
		["ItemBriefcase100oz", 1],
		["metal_floor_kit",5],
		["cinder_wall_kit",5],
		["CinderBlocks",40],
		["MortarBucket",5],
		["ItemVault",3],
		["PartEngine", 5],
		["wooden_shed_kit", 3],
		["wood_ramp_kit", 3],
		["workbench_kit", 10],
		["PartFueltank", 5],
		["PartGeneric", 5],
		["PartGlass", 5],
		["PartVRotor", 5],
		["PartWheel", 5],
		["ItemWoodFloor", 5],
		["ItemWoodFloorHalf", 5],
		["ItemWoodFloorQuarter", 5],
		["ItemWoodLadder", 5],
		["ItemWoodStairs", 5],
		["ItemWoodStairsSupport", 5],
		["ItemWoodWall", 5],
		["ItemWoodWallDoor", 5],
		["ItemWoodWallDoorLg", 5],
		["ItemWoodWallGarageDoor", 5],
		["ItemWoodWallGarageDoorLocked", 5],
		["ItemWoodWallLg", 5],
		["ItemWoodWallThird", 5],
		["ItemWoodWallWindow", 5],
		["ItemWoodWallWindowLg", 5],
		["ItemWoodWallWithDoor", 5],
		["ItemWoodWallwithDoorLg", 5],
		["ItemWoodWallWithDoorLgLocked", 5],
		["ItemWoodWallWithDoorLocked", 5],
		["ItemJerrycan", 10],
		["deer_stand_kit", 10],
		["desert_large_net_kit", 10],
		["desert_net_kit", 10],
		["ItemTankTrap", 30],
		["bulk_ItemWire",  30],
		["30m_plot_kit", 5],
		["SmokeShellGreen", 20],
		["SmokeShellRed", 20],
		["ItemVault",2],
		["Skin_Bandit1_DZ", 5],
		["Skin_Bandit2_DZ", 5],
		["Skin_BanditW1_DZ", 5],
		["Skin_BanditW2_DZ", 5],
		["Skin_CZ_Soldier_Sniper_EP1_DZ", 5],
		["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 5],
		["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", 5],
		["Skin_Drake_Light_DZ", 5],
		["Skin_FR_OHara_DZ", 5],
		["Skin_FR_Rodriguez_DZ", 5],
		["Skin_Functionary1_EP1_DZ", 5],
		["Skin_Graves_Light_DZ", 5],
		["Skin_GUE_Commander_DZ", 5],
		["Skin_GUE_Soldier_2_DZ", 5],
		["Skin_GUE_Soldier_CO_DZ", 5],
		["Skin_GUE_Soldier_Crew_DZ", 5],
		["Skin_GUE_Soldier_MG_DZ", 5],
		["Skin_GUE_Soldier_Sniper_DZ", 5],
		["Skin_Haris_Press_EP1_DZ", 5],
		["Skin_Ins_Soldier_GL_DZ", 5],
		["Skin_Pilot_EP1_DZ", 5],
		["Skin_Priest_DZ", 5],
		["Skin_Rocker1_DZ", 5],
		["Skin_Rocker2_DZ", 5],
		["Skin_Rocker3_DZ", 5],
		["Skin_Rocker4_DZ", 5],
		["Skin_RU_Policeman_DZ", 5],
		["Skin_Sniper1_DZ", 5],
		["Skin_Soldier_Bodyguard_AA12_PMC_DZ", 5],
		["Skin_Soldier_Sniper_PMC_DZ", 5],
		["Skin_Soldier_TL_PMC_DZ", 5],
		["Skin_SurvivorW2_DZ", 5],
		["Skin_SurvivorW3_DZ", 5],
		["Skin_SurvivorWcombat_DZ", 5],
		["Skin_SurvivorWdesert_DZ", 5],
		["Skin_SurvivorWpink_DZ", 5],
		["Skin_SurvivorWsequishaD_DZ", 5],
		["Skin_TK_INS_Soldier_EP1_DZ", 5],
		["Skin_TK_INS_Warlord_EP1_DZ", 5],
		["ItemSodaMdew", 5],
		["FoodSteakCooked", 5],
		["HandChemBlue", 15],
		["HandChemGreen", 15],
		["HandChemRed", 15],
		["HandRoadFlare", 15],
		["ItemAntibiotic", 15],
		["ItemBandage", 15],
		["ItemBloodbag", 15]
	];
	 {_this addMagazineCargoGlobal _x;} ForEach _MagsArr;
	
 _this addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 0];
 _this setPos [7165.6841, 9682.8994, 3.0517578e-005];
};
sleep 1;
 
_vehicle_68 = objNull;
if (true) then
{
  _this = createVehicle ["SmokeShellGreen", [4536.43, 10458.8, 0.0143433], [], 0, "CAN_COLLIDE"];
  _vehicle_68 = _this;
  _this setDir -93.674492;
  _this setPos [4536.43, 10458.8, 0.0143433];
};
 
_vehicle_69 = objNull;
if (true) then
{
  _this = createVehicle ["SmokeShellRed", [4528.43, 10463.8, 0.0143433], [], 0, "CAN_COLLIDE"];
  _vehicle_69 = _this;
  _this setDir -93.674492;
  _this setPos [4528.43, 10463.8, 0.0143433];
};

 
diag_log("////////////////////////Battlefield Loot Box spawned\\\\\\\\\\\\\\\\\\\\\\\\\\\\");
 
sleep 1;
 
};