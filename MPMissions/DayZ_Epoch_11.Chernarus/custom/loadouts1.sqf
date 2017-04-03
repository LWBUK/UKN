/*
	By: NoxSicarius
	
	Disclaimer:
		This loadout script is offered FREE OF CHARE to anyone and everyone who wants it. If you wish to redistribute
		this script or use it in your own mod release then you must give credit to me and you MUST release it in
		accordance with copyleft and the GNU GPL v3 Licence agreement.
		This script is licensed under GNU GPL v3 and using/distributing this script constitutes your agreement to
		these terms.
*/

private ["_player","_UID"];
_player = player;
_UID = getPlayerUID _player;

if(isNil "AdminList") then {
	AdminList = ["0","0"]; // Admins (ONLY if you don't have my admin tool installed)
	ModList = ["0","0"];}; // Mods (ONLY if you don't have my admin tool installed)
	DonorList = ["0"]; // Donors USE THIS
	ProDonorList = ["76561198028236135","76561198312597166","76561198302675871","76561198053418320"]; // ProDonors Sniper kit
	
//Admin Loadout
if (_UID in AdminList) then {
	DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","ItemBandage","17Rnd_9x19_glock17","17Rnd_9x19_glock17","30Rnd_762x39_SA58","30Rnd_762x39_SA58","ItemMorphine","ItemPainkiller","ItemBloodbag","ItemSodaRabbit","FoodSteakCooked"];
	DefaultWeapons = ["glock17_EP1","Sa58V_RCO_EP1","NVGoggles","ItemGPS","ItemKnife","ItemToolbox","ItemCrowbar","ItemHatchet_DZE"];
	DefaultBackpack = "DZ_LargeGunBag_EP1";
	DefaultBackpackWeapon = "";
}else{
	//Moderator Loadout
	if(_UID in ModList) then {
		DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","ItemBandage","17Rnd_9x19_glock17","17Rnd_9x19_glock17","30Rnd_556x45_G36","30Rnd_556x45_G36","ItemMorphine","ItemPainkiller","ItemBloodbag","FoodSteakCooked","8Rnd_B_Saiga12_Pellets","8Rnd_B_Saiga12_Pellets","8Rnd_B_Saiga12_74Slug","ItemSodaRabbit"];
		DefaultWeapons = ["glock17_EP1","G36K_camo","NVGoggles","ItemMap","ItemToolbox"];
		DefaultBackpack = "DZ_Backpack_EP1";
		DefaultBackpackWeapon = "";
	}else{
		//Pro-Donor Loadout sniper
		if(_UID in ProDonorList) then {
			DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","ItemMorphine","ItemPainkiller","ItemBloodbag","FoodSteakCooked","PartVRotor","PartEngine","FoodSteakCooked","ItemSodaCoke","Skin_Sniper1_DZ"];
			DefaultWeapons = ["M9SD","DMR","ItemGPS","ItemRadio","ItemKnife","ItemToolbox","ItemEtool","ItemMap","ItemMatchbox","ItemCompass","ItemHatchet_DZE","Binocular_Vector"];
			DefaultBackpack = "DZ_LargeGunBag_EP1";
			DefaultBackpackWeapon = "";
		}else{
			//Donor Loadout
			if(_UID in DonorList) then {
				DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemMorphine","ItemPainkiller","ItemSodaCoke","ItemBloodbag","FoodSteakCooked","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","PartVRotor","PartEngine","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"];
				DefaultWeapons = ["M9SD","M4A1","ItemMap","ItemHatchet_DZE","ItemToolbox","ItemRadio","ItemKnife","ItemMatchbox","ItemEtool","ItemCompass"];
				DefaultBackpack = "DZ_ALICE_Pack_EP1";
				DefaultBackpackWeapon = "";
			}else{
				//Default Loadout for normal players
				DefaultMagazines = ["ItemBandage","ItemBandage","ItemMorphine","ItemPainkiller","15Rnd_9x19_M9","15Rnd_9x19_M9"];
				DefaultWeapons = ["M9","ItemMap","ItemHatchet_DZE","ItemRadio", "ItemToolbox"];
				DefaultBackpack = "DZ_Patrol_Pack_EP1";
				DefaultBackpackWeapon = "";
			};
		};
	};
};
