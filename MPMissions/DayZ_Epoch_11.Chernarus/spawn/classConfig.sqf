/*  

Class Configuration:

1. These classes are just examples to show what this mod can do. You can add or delete any class
in the _publicClasses list. Don't forget to leave off the last comma for the last element in the array.
You can even remove all gear to make this a skin selector only.

2. _startBag, _startMags and _startWeps make the default loadout. They will be added first, then the class loadout (if any) on top.
Use the base gear that you want all (or most) classes to have. Start binocs, pistols, pistol mags and bags are replaced if they 
are specified in the selected class. 

3. _customLoadout - List of UIDs with custom loadouts.
   _customLoadouts - List of custom loadouts. These must match the order of the first list. The first UID in _customLoadout corresponds with the first loadout in _customLoadouts and so on. 
   These will only show in the class dialog for the player who owns them. If multiple UIDs share the same loadout then add the same loadout multiple times to maintain order, 
   or consider making it a VIP class in _publicClasses instead. Each loadout must have a unique name just like regular classes. Do not include humanity or VIP level in these.
   
4. Regular class format:
	[Name,  Male Skin,  Female Skin,  Magazines and Items,  Weapons and Tools,  Bag,  Bag Mags and Items,  Bag Weps and Tools,  VIP Level,  Humanity Level, Coins]
	Name - Each class must have a unique name. Do not use double quotes " inside.
	Male Skin - Must be a skin compatible with your mod.
	Female Skin - This will be used if the player picked female on the gender selection screen.
	Magazines and Items - Mags and items to add in addition to _startMags. For multiple add the quantity after (i.e. "ItemBandage",3) The quantity is assumed to be 1 if not specified.  
	Weapons and Tools - Weps and tools to add in addition to _startWeps.
	Bag - Leave as "" for _startBag
	Bag Mags - Same format as magazines. Leave as [] for none
	Bag Weps - Same format as weapons. Leave as [] for none
	VIP Level -
		0 - Anyone can pick this class
		1 - Only players with UIDs in _classLevel1 can pick this class
		2 - Only players with UIDs in _classLevel2 can pick this class
		3 - Only players with UIDs in _classLevel3 can pick this class​
	Humanity Level -
		0 - Anyone can pick this class
		Negative # - Only players with humanity less than this number can pick this class
		Positive # - Only players with humanity greater than this number can pick this class​
	Coins
		0 - Does nothing, use if single currency is not installed
		Positive # - Gives player coins with loadout
		
5. Random class format:
	[
		Name, 
		[[Male Skins],[Female Skins]],
		Mags+Items, #ofItemPicks, 
		Tools, #ofToolPicks, 
		Primary, #ofPrimaryMags, 
		Pistol, #ofPistolMags, 
		Bags, 
		BagItems, #ofBagItemPicks, 
		BagTools, #ofBagToolPicks, 
		BagPrimary, #ofBagPrimaryMags, 
		BagPistol, #ofBagPistolMags, 
		VIPLevel, HumanityLevel, Coins
	]	
	Name - Can be anything unique, does not have to be "Random"
	Skins - One will be chosen at random for your gender.
	Mags+Items - Same format as regular.
	#ofItemPicks - # of unique items to pick randomly from the previous list. Never use a # higher than the # of unique Mags+Items.
	Tools - List of toolbelt items to be picked from randomly.
	#ofToolPicks - # of unique tools to pick randomly from the previous list. Never use a # higher than the # of unique Tools.
	Primary - List of primary weapons to be picked from randomly.
	#ofPrimaryMags - The quantity of mags you will always get for your primary weapon.
	Pistol - List of pistols to be picked from randomly.
	#ofPistolMags - The quantity of mags you will always get for your pistol.
	Bags - One will be selected at random.
	BagX,#ofBagX - Same as their respective non-bag counter parts, except they will be added to the backpack.
	VIPLevel, HumanityLevel, Coins - Same as regular.
	
5. Any of the _customLoadouts and _publicClasses can be made into random classes. They just need to be in the random format
and it will be automatically detected. You can have multiple random classes, i.e. Random LMG, Random Rifle, Random Sniper, Random 
Bandit, Random Hero, etc. You can make every class a random class if you want to.

6. Instead of repeating long strings of the same items multiple times you can use constants in this format:
		#define SHORT_HAND_NAME "Item1","Item2","Item3","Item4"
Then replace all occurrences of "Item1","Item2","Item3","Item4" with SHORT_HAND_NAME as I did with the VIP_ITEMS example below.

*/
#define VIP_ITEMS "ItemAntibiotic","ItemBloodbag","ItemMorphine","PartVRotor" // constant example, these can be removed if they are not used below
#define VIP_TOOLS "ItemCompass","ItemKnife","ItemGPS","ItemMatchbox","ItemEtool","ItemCrowbar"

_currencyVariable = "cashMoney"; // Coins variable name
_startBag = "DZ_Patrol_Pack_EP1"; // Use "" for none
_startMags = ["ItemBandage",4,"ItemPainkiller",2,"ItemSodaRbull","ItemTunaCooked","PartEngine"];
_startWeps = ["ItemMap","ItemRadio","ItemToolbox","ItemHatchet_DZE","Binocular_Vector","NVGoggles"];
_customLoadout = [
	"76561198278477618", //SD admin
	"76561198134897152",  //SD player
	"76561198144498039"  //flunk admin
];
_customLoadouts = [
	["SD's Loadout","Sniper1_DZ","BanditW2_DZ",["100Rnd_762x51_M240",2,"30Rnd_9x19_UZI_SD",2,"Skin_Sniper1_DZ"],["Mk_48_DZ","UZI_SD_EP1"],"DZ_Backpack_EP1",[],[],0],
	["SD's Loadout","Sniper1_DZ","BanditW2_DZ",["100Rnd_762x51_M240",2,"30Rnd_9x19_UZI_SD",2],["Mk_48_DZ","UZI_SD_EP1"],"DZ_Backpack_EP1",[],[],0],
	["Flunk's Sexy Loadout","Sniper1_DZ","BanditW2_DZ",["5Rnd_86x70_L115A1",4,"30Rnd_9x19_UZI_SD",2],["BAF_LRR_scoped","UZI_SD_EP1"],"DZ_Backpack_EP1",[],[],0]
];
_classLevel1 = [
"76561198156080694",
"76561198115188017",	
"76561198071164173",	
"76561198241546756",	
"76561197989721810",	
"76561198278477618",	
"76561198134897152", 	
"76561198091523665"		
];
_classLevel2 = [
"76561198156080694",	
"76561198115188017",	
"76561198071164173",	
"76561198241546756",	
"76561197989721810",	
"76561198278477618",	
"76561198134897152" 	
];
_classLevel3 = [
"76561198156080694",	
"76561198115188017",	
"76561198071164173",	
"76561198241546756",	
"76561197989721810",	
"76561198278477618",	
"76561198134897152", 
"76561198091523665"	
];

// To give higher level VIPs access to lower level VIP classes too use +. For example:
// _classLevel2 = ["0","0","0"] + _classLevel1;
// _classLevel3 = ["0","0","0"] + _classLevel2;

_publicClasses = [
	[
		//"Random",
		//[["Survivor2_DZ","Haris_Press_EP1_DZ","Rocker1_DZ"],["SurvivorW2_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ"]],
		//["ItemAntibiotic",2,"ItemMorphine","ItemEpinephrine"],2,
		//["ItemCompass","ItemHatchet","ItemCrowbar"],2,
		//["M4A1","AK_74","BAF_L85A2_RIS_Holo","Sa58P_EP1"],2,
		//["MakarovSD","Colt1911","revolver_EP1","M9","M9SD"],3,
		//["DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_Patrol_Pack_EP1"], // use [""] for none
		//[],4,
		//[],2,
		//[],2,
		//[],3,
		//0,0,0
	],
	["GUARDIAN*","Sniper1_DZ","SurvivorWurban_DZ",["5Rnd_86x70_L115A1",3,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["BAF_LRR_scoped","UZI_SD_EP1",VIP_TOOLS],"DZ_Backpack_EP1",[],[],0,400000,0],
	["ZEUS*","Sniper1_DZ","SurvivorWurban_DZ",["20Rnd_762x51_DMR",3,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["vil_M110sd","UZI_SD_EP1",VIP_TOOLS],"DZ_Backpack_EP1",[],[],0,200000,0],
	["Vigil","UN_CDF_Soldier_Guard_EP1","SurvivorWurban_DZ",["30Rnd_556x45_Stanag",3,"1Rnd_HE_M203",1,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["M16A4_ACG_GL","UZI_SD_EP1",VIP_TOOLS],"DZ_Backpack_EP1",[],[],0,100000,0],
	["Apollo","Soldier1_DZ","SurvivorWdesert_DZ",["30Rnd_556x45_G36",3,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["G36K","UZI_SD_EP1","ItemCompass"],"DZ_Backpack_EP1",[],[],0,50000,0],
	["Regulator","CZ_Special_Forces_GL_DES_EP1_DZ","SurvivorWdesert_DZ",["30Rnd_556x45_Stanag",2,VIP_ITEMS],["M4A1","ItemCompass"],"DZ_CivilBackpack_EP1",[],[],0,25000,0],
	["Ranger","Graves_Light_DZ","SurvivorWcombat_DZ",["10x_303",2,"ItemBloodbag",2],["LeeEnfield","ItemCompass"],"DZ_CivilBackpack_EP1",[],[],0,20000,0],
	["Merchant","Functionary1_EP1_DZ","SurvivorWurban_DZ",["30Rnd_9x19_MP5SD",2,"ItemBloodbag"],["MP5SD","ItemCompass"],"DZ_British_ACU",[],[],0,15000,0],
	["Hub Police","RU_Policeman_DZ","SurvivorWdesert_DZ",["8Rnd_B_Beneli_74Slug",3,"ItemBloodbag"],["Remington870_lamp"],"DZ_British_ACU",[],[],0,10000,0],
	["Hero (M9SD)","Soldier_Sniper_PMC_DZ","SurvivorWpink_DZ",["15Rnd_9x19_M9SD",2],["M9SD"],"DZ_TK_Assault_Pack_EP1",[],[],0,7500,0],
	["Citizen (M9)","Haris_Press_EP1_DZ","SurvivorW3_DZ",["15Rnd_9x19_M9",2],["M9"],"",[],[],0,5000,0],
	["Survivor","Survivor2_DZ","SurvivorW2_DZ",["8Rnd_9x18_Makarov",2],["Makarov"],"",[],[],0,0,0],
	["Predator VIP*","Sniper1_DZ","SurvivorWurban_DZ",["20rnd_762x51_SB_SCAR",3,"15Rnd_9x19_M9SD",3,VIP_ITEMS],["SCAR_H_CQC_CCO_SD","M9SD",VIP_TOOLS],"DZ_Backpack_EP1",[],[],1,0,0],
	["Assassin VIP**","Sniper1_DZ","SurvivorWurban_DZ",["100Rnd_762x51_M240",1,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["skavil_M60e3","UZI_SD_EP1",VIP_TOOLS],"DZ_Backpack_EP1",[],[],2,0,0],
	["Phantom VIP***","Sniper1_DZ","SurvivorWurban_DZ",["20Rnd_762x51_DMR",3,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["DMR","UZI_SD_EP1",VIP_TOOLS],"DZ_Backpack_EP1",[],[],3,0,0],
	["Dark Survivor","INS_Lopotev_DZ","SurvivorW2_DZ",["8Rnd_9x18_Makarov",2],["Makarov"],"",[],[],0,0,0],
	["Rebel (M9)","Bandit1_DZ","SurvivorW3_DZ",["15Rnd_9x19_M9",2],["M9"],"",[],[],0,-5000,0],
	["Bandit (M9SD)","Bandit2_DZ","BanditW1_DZ",["15Rnd_9x19_M9SD",2],["M9SD"],"",[],[],0,-7500,0],
	["Raider","Ins_Soldier_GL_DZ","BanditW1_DZ",["8Rnd_B_Beneli_74Slug",2],["M1014"],"DZ_TK_Assault_Pack_EP1",[],[],0,-10000,0],
	["Terrorist","TK_INS_Soldier_EP1_DZ","BanditW2_DZ",["30Rnd_9x19_MP5SD",2],["MP5SD"],"DZ_TK_Assault_Pack_EP1",[],[],0,-15000,0],
	["Outlaw","GUE_Commander_DZ","BanditW2_DZ",["10x_303",1],["LeeEnfield","ItemCompass"],"DZ_British_ACU",[],[],0,-20000,0],
	["Viper","GUE_Soldier_Crew_DZ","BanditW2_DZ",["30Rnd_545x39_AK",2,"ItemBloodbag"],["AK_74","ItemCompass"],"DZ_British_ACU",[],[],0,-25000,0],
	["Elite","GUE_Soldier_Sniper_DZ","BanditW2_DZ",["30Rnd_556x45_G36",3,"30Rnd_9x19_UZI_SD",2,"ItemBloodbag","ItemMorphine"],["G36K","UZI_SD_EP1","ItemCompass"],"DZ_CivilBackpack_EP1",[],[],0,-50000,0],
	["Warlord","Rocket_DZ","BanditW2_DZ",["30Rnd_556x45_Stanag",2,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["BAF_L85A2_RIS_Holo","UZI_SD_EP1","ItemCompass"],"DZ_Backpack_EP1",[],[],0,-100000,0],
	["Vanguard","GUE_Soldier_Sniper_DZ","BanditW2_DZ",["30Rnd_556x45_Stanag",3,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["m8_Sharpshooter","UZI_SD_EP1","ItemCompass","ItemGPS"],"DZ_Backpack_EP1",[],[],0,-200000,0],
	["OPPRESSOR*","Sniper1_DZ","BanditW2_DZ",["20Rnd_762x51_DMR",3,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["vil_M110sd","UZI_SD_EP1",VIP_TOOLS],"DZ_Backpack_EP1",[],[],0,-400000,0],
	["EXECUTIONER*","Sniper1_DZ","BanditW2_DZ",["5Rnd_86x70_L115A1",3,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["BAF_LRR_scoped","UZI_SD_EP1",VIP_TOOLS],"DZ_Backpack_EP1",[],[],0,-800000,0]
];

