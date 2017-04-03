/*** Created by 0verHeaT ***/
class GarageDialog
{
	idd = 50003;
	movingenable = 0;
	onLoad = "uiNamespace setVariable ['GarageDialog', _this select 0]";
	class Controls {
		class RscTextT_5000300: Ga_RscTextT
		{
			idc = -1;
			x = 0.316666 * safezoneW + safezoneX;
			y = 0.266666 * safezoneH + safezoneY;
			w = 0.366666 * safezoneW;
			h = 0.459259 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscTextT_5000301: Ga_RscTextT
		{
			idc = -1;
			text = "Virtual Garage";
			x = 0.316666 * safezoneW + safezoneX;
			y = 0.266666 * safezoneH + safezoneY;
			w = 0.366666 * safezoneW;
			h = 0.051851 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscListbox_5000302: Ga_RscListBox
		{
			idc = 5200;
			x = 0.337500 * safezoneW + safezoneX;
			y = 0.385185 * safezoneH + safezoneY;
			w = 0.154166 * safezoneW;
			h = 0.222222 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
		};
		class RscListbox_5000303: Ga_RscListBox
		{
			idc = 5201;
			x = 0.508333 * safezoneW + safezoneX;
			y = 0.385185 * safezoneH + safezoneY;
			w = 0.154166 * safezoneW;
			h = 0.222222 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
		};
		class RscStructuredText_5000304: Ga_RscStructuredText
		{
			idc = 5202;
			x = 0.337500 * safezoneW + safezoneX;
			y = 0.340740 * safezoneH + safezoneY;
			w = 0.154166 * safezoneW;
			h = 0.037037 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscStructuredText_5000305: Ga_RscStructuredText
		{
			idc = 5203;
			x = 0.508333 * safezoneW + safezoneX;
			y = 0.340740 * safezoneH + safezoneY;
			w = 0.154166 * safezoneW;
			h = 0.037037 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscShortcutButton_5000306: Ga_RscShortcutButton
		{
			idc = -1;
			text = "Store";
			x = 0.420833 * safezoneW + safezoneX;
			y = 0.612222 * safezoneH + safezoneY;
			w = 0.070833 * safezoneW;
			h = 0.055016 * safezoneH;
			onButtonClick = "[(lbCurSel 5200)] spawn garage_storeVehicle;";
		};
		class RscShortcutButton_5000307: Ga_RscShortcutButton
		{
			idc = -1;
			text = "Spawn";
			x = 0.591666 * safezoneW + safezoneX;
			y = 0.612222 * safezoneH + safezoneY;
			w = 0.070833 * safezoneW;
			h = 0.055016 * safezoneH;
			onButtonClick = "[(lbCurSel 5201)] spawn garage_spawnVehicle;";
		};
		class RscShortcutButton_5000309: Ga_RscShortcutButton
		{
			idc = -1;
			text = "Close";
			x = 0.591666 * safezoneW + safezoneX;
			y = 0.664074 * safezoneH + safezoneY;
			w = 0.070833 * safezoneW;
			h = 0.055016 * safezoneH;
			onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 9000);";
		};
		class RscTextT_5000310: Ga_RscTextT
		{
			idc = -1;
			text = "Spawn Vehicle >>";
			x = 0.508333 * safezoneW + safezoneX;
			y = 0.622222 * safezoneH + safezoneY;
			w = 0.079166 * safezoneW;
			h = 0.022222 * safezoneH;
		};
		class RscTextT_5000311: Ga_RscTextT
		{
			idc = -1;
			text = "Store Vehicle >>";
			x = 0.337500 * safezoneW + safezoneX;
			y = 0.622222 * safezoneH + safezoneY;
			w = 0.079166 * safezoneW;
			h = 0.022222 * safezoneH;
		};
	};
};

