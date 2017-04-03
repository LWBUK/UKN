find_suitable_ammunition = {

	private["_weapon","_result","_ammoArray"];

	_result 	= false;
	_weapon 	= _this;
	_ammoArray 	= getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");

	if (count _ammoArray > 0) then {
		_result = _ammoArray select 0;
	};

	_result

};

loadout_fnc_selectRandom = {
    _this select (floor random (count _this))
};

_primary = ["G36C","M16A2","M4A1","Crossbow_DZ","Winchester1866","LeeEnfield","Saiga12K","huntingrifle"] call loadout_fnc_selectRandom;
_secondary = [
				"Colt1911","glock17_EP1","M9","M9SD","Makarov","MakarovSD","revolver_EP1","revolver_gold_EP1","UZI_EP1","UZI_SD_EP1","Sa61_EP1",
				"RH_Deagleg","RH_Deaglem","RH_Deagles","RH_Deaglemz","RH_Deaglemzb","RH_deagle","RH_anac","RH_anacg","RH_bull","RH_python",
				"RH_browninghp","RH_p226","RH_p226s","RH_p38","RH_ppk","RH_mk22","RH_mk22sd","RH_mk22v","RH_mk22vsd","RH_usp","RH_uspm","RH_uspsd","RH_m1911",
				"RH_m1911old","RH_m1911sd","RH_tt33","RH_mk2","RH_m9","RH_m93r","RH_m9c","RH_m9csd","RH_m9sd","RH_muzi","RH_g18","RH_g17","RH_g17sd","RH_g19","RH_g19t","RH_vz61","RH_tec9",
				"vil_Tt33","vil_APS","vil_apssd","Vil_PYA","vil_B_HP","vil_Glock","vil_Glock_o","vil_USP","vil_USPSD","vil_USP45","vil_USP45SD"
			 ] call loadout_fnc_selectRandom;
_ammo = _primary call find_suitable_ammunition;
_ammos = _secondary call find_suitable_ammunition;
_food = ["FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodMRE","FoodNutmix","FoodPistachio","FoodSteakCooked"] call loadout_fnc_selectRandom;
_drink = ["ItemSodaCoke","ItemSodaMdew","ItemSodaOrangeSherbet","ItemSodaPepsi","ItemSodaRbull","ItemWaterbottle"] call loadout_fnc_selectRandom;
_backpack = ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch"] call loadout_fnc_selectRandom;

DefaultMagazines = ["ItemBandage","ItemPainkiller",_ammos,_ammo ,_food,_drink]; 
DefaultWeapons = ["ItemToolbox","Binocular","ItemRadio","ItemHatchet_DZE","ItemMap",_primary,_secondary]; 
DefaultBackpack = _backpack; 
DefaultBackpackItems = [];
DZE_defaultSkin = [
					["Skin_INS_Lopotev_DZ","Skin_INS_Worker2_DZ","Skin_RU_Policeman_DZ","Skin_Pilot_EP1_DZ","Skin_Rocker1_DZ","Skin_Rocker3_DZ","Skin_Rocket_DZ"],
				    ["Skin_SurvivorW2_DZ","Skin_SurvivorW3_DZ","Skin_SurvivorWcombat_DZ","Skin_SurvivorWdesert_DZ","Skin_SurvivorWurban_DZ","Skin_SurvivorWpink_DZ"]
				  ];
