#define CT_STATIC 0
#define ST_LEFT           0x00
#define ST_PICTURE        48

class RscStructuredText {
	access = ReadAndWrite;
	type = 13;
	idc = -1;
	style = 2; 
	font = "Zeppelin33";
	size = "0.025 * safezoneH";
	colorText[] = {1,1,1,1};
	colorBackground[] = {0, 0, 0, 0};
	text = "";
	shadow = 1;
	class Attributes {
		align = "center";
		valign = "middle";	
	};
};
#include "dzgm\defines.hpp"
class RscTitles 
{
#include "dzgm\icons.hpp"
#include "dzgm\hud.hpp"
class playerStatusGUI {
        idd = 6900;
        movingEnable = 0;
        duration = 100000;
        name = "statusBorder";
        onLoad = "uiNamespace setVariable ['DAYZ_GUI_display', _this select 0];";
        class ControlsBackground {
			//PLAYER NAME
			class RscStructuredText_1199 : RscStructuredText {
				idc = 1199;
				x = 0.250001;
				y = 0.350001;
				w = 0.5;
				h = 0.1;
			};
			//FOOD BACKGROUND
            class RscPicture_1901: RscPictureGUI
            {
                idc = 1901;
                text = "SD\gui\status\status_bg.paa";
            x = 0.41 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
			//FOOD BORDER
            class RscPicture_1201: RscPictureGUI
            {
                idc = 1201;
                text = "SD\gui\status\status_food_border_ca.paa";
            x = 0.41 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
			//BLOOD BACKGROUND
            class RscPicture_1900: RscPictureGUI
            {
                idc = 1900;
                text = "SD\gui\status\status_bg.paa";
            x = 0.380 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
			//BLOOD BORDER
            class RscPicture_1200: RscPictureGUI
            {
                idc = 1200;
                text = "SD\gui\status\status_blood_border_ca.paa";
            x = 0.380 * safezoneW + safezoneX;
            y = 0.93* safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
			//THIRST BACKGROUND
            class RscPicture_1902: RscPictureGUI
            {
                idc = 1902;
                text = "SD\gui\status\status_bg.paa";
            x = 0.44 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
			//THIRST BORDER
            class RscPicture_1202: RscPictureGUI
            {
                idc = 1202;
                text = "SD\gui\status\status_thirst_border_ca.paa";
            x = 0.44 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//COMBAT BACKGROUND*
		class RscPicture_1907: RscPictureGUI
		{
            idc = 1907;
            text = "SD\gui\status\status_bg.paa";
            x = 0.475 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//COMBAT BORDER*
		class RscPicture_1207: RscPictureGUI
		{
            idc = 1207;
            text = "SD\gui\status\status_combat_border_CA.paa";
            x = 0.475 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
			//TEMP BACKGROUND
            class RscPicture_1908: RscPictureGUI
            {
                idc = 1908;
                text = "SD\gui\status\status_bg.paa";
            x = 0.350 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
			//TEMP BORDER
            class RscPicture_1208: RscPictureGUI
            {
                idc = 1208;
                text = "SD\gui\status\status_temp_outside_ca.paa";
            x = 0.350 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
			//BROKEN LEG
            class RscPicture_1203: RscPictureGUI
            {
                idc = 1203;
                text = "SD\gui\status\status_effect_brokenleg.paa";
            x = 0.32 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.055*safeZoneH;
                w = 0.033*safeZoneW;
            colorText[] = {1,1,1,1};
        };
			//NOISE BACKGROUND
            class RscPicture_1205: RscPictureGUI
            {
                idc = 1205;
                text = "SD\gui\status\status_bg.paa";
            x = 0.51 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
			//VISIBLE BACKGROUND
            class RscPicture_1206: RscPictureGUI
            {
                idc = 1206;
                text = "SD\gui\status\status_bg.paa";
            x = 0.54 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;			
        };
            /*--------------------------------------------*/
            //SURVIVOR ICON
			class RscPicture_1307: RscPictureGUI
            {
                idc = 1307;
                text = "SD\gui\status\st_humanity_survivor.paa";
			x = 0.66 * safezoneW + safezoneX;
			y = 0.90 * safezoneH + safezoneY;
			w = 0.027 * safezoneW;
			h = 0.037 * safezoneH;
			colorText[] = {1,1,1,1};
		};
			//BANDIT ICON
            class RscPicture_1309: RscPictureGUI
            {
                idc = 1309;
                text = "SD\gui\status\st_humanity_bandit.paa";
			x = 0.66 * safezoneW + safezoneX;
			y = 0.93 * safezoneH + safezoneY;
			w = 0.027 * safezoneW;
			h = 0.037 * safezoneH;
			colorText[] = {1,1,1,1};
		};
			//ZOMBIE ICON
            class RscPicture_1310: RscPictureGUI
            {
                idc = 1310;
                text = "SD\gui\status\zombie.paa";
			x = 0.66 * safezoneW + safezoneX;
			y = 0.96 * safezoneH + safezoneY;
			w = 0.027 * safezoneW;
			h = 0.037 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		//FPS BACKGROUND
        class RscText_1322: RscPictureGUI
        {
            idc = 1322;
            text = "SD\gui\status\status_bg.paa";
            x = 0.95 * safezoneW + safezoneX;
            y = 0.91 * safezoneH + safezoneY;
            w = 0.037 * safezoneW;
            h = 0.047 * safezoneH;
        };
      };
        class Controls {
			//FOOD ICON
            class RscPicture_1301: RscPictureGUI
            {
                idc = 1301;
                x = 0.41 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
            };
			//BLOOD ICON
            class RscPicture_1300: RscPictureGUI
            {
                idc = 1300;
                x = 0.38 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
            };	
			//THIRST ICON
            class RscPicture_1302: RscPictureGUI
            {
                idc = 1302;
                x = 0.44 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;				
            };
			//TEMP ICON
            class RscPicture_1306: RscPictureGUI
            {
                idc = 1306;
				x = 0.35 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
            };		
			//BLOOD ICON - BLEEDING
            class RscPicture_1303: RscPictureGUI
            {
                idc = 1303;
                text = "SD\gui\status\status_bleeding_ca.paa";
                x = 0.382 * safezoneW + safezoneX;
                y = 0.932 * safezoneH + safezoneY;
                h = 0.049*safeZoneH;
                w = 0.032*safeZoneW;				
                colorText[] = {1,1,1,0.5};
            };
			//NOISE ICON
            class RscPicture_1304: RscPictureGUI
            {
                idc = 1304;
                text = "SD\gui\status\status_noise.paa";
                x = 0.51 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;				
            };
			//FPS
            class RscText_1321: RscTextGUIK
            {
                idc = 1321;
                text = "fps";
                x = 0.95 * safezoneW + safezoneX;
                y = 0.91 * safezoneH + safezoneY;
                w = 0.037 * safezoneW;
                h = 0.047 * safezoneH;
                size = 0.065;
                sizeEx = 0.065;
                colorText[] = {1,1,1,0.0};
            };
			//VISIBLE ICON
            class RscPicture_1305: RscPictureGUI
            {
                idc = 1305;
                text = "SD\gui\status\status_visible.paa";
                x = 0.54 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;				
            };
			//COMBAT ICON*
			class RscPicture_1307: RscPictureGUI
            {
                idc = 1307;
                text = "SD\gui\status\status_combat_inside_ca.paa";
                x = 0.475 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
            };
            //SURVIVOR KILLS
			class RscText_1400: RscTextGUIK
            {
			idc = 1400;
			text = "1000";
			x = 0.673 * safezoneW + safezoneX;
			y = 0.90 * safezoneH + safezoneY;
			w = 0.037 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
			//BANDIT KILLS
            class RscText_1402: RscTextGUIK
            {
			idc = 1402;
			text = "1000";
			x = 0.673 * safezoneW + safezoneX;
			y = 0.93 * safezoneH + safezoneY;
			w = 0.037 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
			//ZOMBIE KILLS
            class RscText_1403: RscTextGUIK
            {
			idc = 1403;
			text = "1000";
			x = 0.673 * safezoneW + safezoneX;
			y = 0.96 * safezoneH + safezoneY;
			w = 0.037 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
			//BLOOD AMOUNT
			class RscText_1420: RscTextGUIK
            {
			idc = 1420;
			text = "1000";
			x = 0.40 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.040 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {0.8,0.07,0.06,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
			//HUMANITY AMOUNT
			class RscText_1421: RscTextGUIK
            {
			idc = 1421;
			text = "1000";
			x = 0.49 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.040 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		//SERVER RESTART AMOUNT
		class RscText_1422: RscTextGUIK
		{
			idc = 1422;
			text = "1000";
			x = 0.61 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.040 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,0.8,0,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
			//BLOOD LABEL
			class RscText_1423: RscTextGUIK
            {
			idc = 1423;
			text = "Blood Left:";
			x = 0.33 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
			//HUMANITY LABEL
			class RscText_1424: RscTextGUIK
            {
			idc = 1424;
			text = "Humanity:";
			x = 0.43 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		//RESTART LABEL
		class RscText_1425: RscTextGUIK
		{
			idc = 1425;
			text = "Restart in (min):";
			x = 0.53 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		
		class RscText_1426: RscTextGUIK
		{
			idc = 1426;
			text = "Press F1 for Rules";
			x = 0.88 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {.2,.9,.1,0.8};
			size = 0.03;
			sizeEx = 0.03;
		};
		/*
		class RscText_1427: RscTextGUIK
		{
			idc = 1427;
			text = "UKN Overpoch";
			x = 0.88 * safezoneW + safezoneX;
			y = 0.96 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		*/
		class RscText_1428: RscTextGUIK
		{
			idc = 1428;
			text = "";
			x = 0.882 * safezoneW + safezoneX;
			y = 0.86 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {};
			size = 0.045;
			sizeEx = 0.045;
		};
		class RscText_1429: RscTextGUIK
		{
			idc = 1429;
			text = "";
			x = 0.89 * safezoneW + safezoneX;
			y = 0.88 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
        };
    };
	class wm_disp {
    idd = -1;
    onLoad = "uiNamespace setVariable ['wm_disp', _this select 0]";
    fadein = 0;
    fadeout = 0;
    duration = 10e10;
    controlsBackground[] = {};
    objects[] = {};
    class controls {
    class wm_text2 {
    idc = 1;
    x = safeZoneX+0.027;//safeZoneW*0.01;
    y = safeZoneY+safeZoneH-0.16;
    w = 1.151*safeZoneH;
    h = 0.057*safeZoneH;
    shadow = 4;
    class Attributes
    {
    font = "EtelkaNarrowMediumPro";
    color = "#24FFFFFF";
    align = "left"; // put "center" here if you want some background
    valign = "middle";
    shadow = 2;
    };
    colorBackground[] = { 1, 0.3, 0, 0 };  // uncomment and increase 4th number to have a background
    font = "EtelkaNarrowMediumPro";
    size = 0.06*safeZoneH;
    type = 13;
    style = 0;
    text="";
            };
        };
    };
};