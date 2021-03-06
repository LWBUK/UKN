// Developed by [GZA] David for German Zombie Apocalypse Servers (https://zombieapo.eu/)
class vehicle_garage
{
	idd = 2800;
	name="vehicle_garage";
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class SAF_RscTitleBackground : SAF_RscText
		{
			colorBackground[] = {.2,.9,.1,1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground : SAF_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.7 - (22 / 250);
		};
		
		class Title : SAF_RscTitle
		{
			idc = 2801;
			text = "Garage";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class VehicleTitleBox : SAF_RscText
		{
			idc = -1;
			text = "Your Vehicles";
			colorBackground[] = {.2,.9,.1,1};
			x = 0.11; y = 0.26;
			w = 0.3;
			h = (1 / 25);
		};
		
		class VehicleInfoHeader : SAF_RscText
		{
			idc = 2830;
			text = "Vehicle Info";
			colorBackground[] = {.2,.9,.1,1};
			x = 0.42; y = 0.26;
			w = 0.46;
			h = (1 / 25);
		};
		
		class CloseBtn : SAF_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class RentCar : SAF_RscButtonMenu
		{
			idc = -1;
			text = "Get Vehicle";
			onButtonClick = "[] spawn player_getVehicle;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
	
	class controls
	{
		class VehicleList : SAF_RscListBox
		{
			idc = 2802;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "";
			
			//Position & height
			x = 0.11; y = 0.302;
			w = 0.303; h = 0.49;
		};
		
		class vehicleInfomationList : SAF_RscStructuredText
		{
			idc = 2803;
			text = "";
			sizeEx = 0.035;
			
			x = 0.41; y = 0.3;
			w = 0.5; h = 0.5;
		};
		
		class MainBackgroundHider : SAF_RscText
		{
			colorBackground[] = {0,0,0,1};
			idc = 2810;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.7 - (22 / 250);
		};
		
		class MainHideText : SAF_RscText
		{
			idc = 2811;
			text = "Search for vehicles ...";
			sizeEx = 0.06;
			x = 0.24; y = 0.5;
			w = 0.6;
			h = (1 / 15);
		};
	};
};


class vehicle_store_list
{
	idd = 3800;
	name="vehicle_store_list";
	movingEnabled = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class SAF_RscTitleBackground : SAF_RscText
		{
			colorBackground[] = {.2,.9,.1,1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground : SAF_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.7 - (22 / 250);
		};
		
		class Title : SAF_RscTitle
		{
			idc = 3801;
			text = "Vehicle List";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class VehicleTitleBox : SAF_RscText
		{
			idc = -1;
			text = "Vehicles nearby";
			colorBackground[] = {.2,.9,.1,1};
			x = 0.11; y = 0.26;
			w = 0.3;
			h = (1 / 25);
		};
		
		class VehicleInfoHeader : SAF_RscText
		{
			idc = 3830;
			text = "Vehicle Info";
			colorBackground[] = {.2,.9,.1,1};
			x = 0.42; y = 0.26;
			w = 0.46;
			h = (1 / 25);
		};
		
		class CloseBtn : SAF_RscButtonMenu
		{
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Rent1Car : SAF_RscButtonMenu
		{
			idc = -1;
			text = "Store Vehicle";
			onButtonClick = "_wogear = false; [_wogear] spawn player_storeVehicle;";
			x = 0.26 + (6.25 / 36) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 20);
			h = (1 / 25);
		};
	};
	
	class controls
	{
		class VehicleList : SAF_RscListBox
		{
			idc = 3802;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call vehicle_info;";
			
			//Position & height
			x = 0.11; y = 0.302;
			w = 0.303; h = 0.49;
		};
		
		class vehicleInfomationList : SAF_RscStructuredText
		{
			idc = 3803;
			text = "";
			sizeEx = 0.035;
			
			x = 0.41; y = 0.3;
			w = 0.5; h = 0.5;
		};
		
		class MainBackgroundHider : SAF_RscText
		{
			colorBackground[] = {0,0,0,1};
			idc = 3810;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.7 - (22 / 250);
		};
		
		class MainHideText : SAF_RscText
		{
			idc = 3811;
			text = "Search for vehicles ...";
			sizeEx = 0.06;
			x = 0.24; y = 0.5;
			w = 0.6;
			h = (1 / 15);
		};
	};
};