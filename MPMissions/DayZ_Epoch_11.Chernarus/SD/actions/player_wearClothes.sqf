private ["_item","_skinpkg","_onLadder","_hasclothesitem","_config","_newConfig","_text","_myModel","_itemNew","_currentSex","_newSex","_model"];
DZE_ActionInProgress = false;
if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_83") , "PLAIN DOWN"] };
DZE_ActionInProgress = true;
if (typeName _this == "ARRAY") then {
	_item = _this select 0;
	_skinpkg = _this select 1;
} else {
	_item = _this;
	_skinpkg = _this;
};
call gear_ui_init;
closeDialog 1;

if (!isNil "SkinChangeInProgress") exitWith {
	DZE_ActionInProgress = false;
	cutText ['You have already changed your skin, please log to lobby and back to change your skin again!', 'PLAIN'];
};

_onLadder =	(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_player_21") , "PLAIN DOWN"]};
_config = configFile >> "CfgMagazines";
if (!isClass (_config >> _item)) then {
	_config = missionConfigFile >> "Skins";
};
_hasclothesitem = _skinpkg in magazines player;
if (!isClass (_config >> _item)) exitWith {DZE_ActionInProgress = false; cutText ["Can not find skin...", "PLAIN DOWN"]};
_text = getText (_config >> _item >> "displayName");
if (!_hasclothesitem) exitWith { DZE_ActionInProgress = false; cutText [format[(localize "str_player_31"),_text,"wear"] , "PLAIN DOWN"]};
if (vehicle player != player) exitWith { DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_85"), "PLAIN DOWN"]};
if (!isNull (unitBackpack player)) exitWith { 
DZE_ActionInProgress = false; 
systemchat "Drop your backpack in order to change clothes";
};
if ("CSGAS" in (magazines player)) exitWith { DZE_ActionInProgress = false; cutText [(localize "STR_EPOCH_ACTIONS_10"), "PLAIN DOWN"] };
_myModel = (typeOf player);
_itemNew = "Skin_" + _myModel;
_newConfig = if (!isClass(configFile >> "CfgMagazines" >> _itemNew)) then {
	(missionConfigFile >> "Skins")
} else {
	(configFile >> "CfgMagazines")
};
if (!isClass (_newConfig >> _itemNew)) exitWith {DZE_ActionInProgress = false; cutText ["Can not find new skin...", "PLAIN DOWN"]};
_currentSex = if (isClass(configFile >> "CfgSurvival" >> "Skins" >> _itemNew)) then {
	getText (configFile >> "CfgSurvival" >> "Skins" >> _itemNew >> "sex")
} else {
	getText (missionConfigFile >> "Skins" >> _itemNew >> "sex")
};
_newSex = if (isClass(configFile >> "CfgSurvival" >> "Skins" >> _item)) then {
	getText (configFile >> "CfgSurvival" >> "Skins" >> _item >> "sex")
} else {
	getText (missionConfigFile >> "Skins" >> _item >> "sex")
};
if(_currentSex != _newSex) exitWith {
	cutText [(localize "str_epoch_player_86"), "PLAIN DOWN"];
};
_model = if (isClass(configFile >> "CfgSurvival" >> "Skins" >> _item)) then {
	getText (configFile >> "CfgSurvival" >> "Skins" >> _item >> "playerModel")
} else {
	getText (missionConfigFile >> "Skins" >> _item >> "playerModel")
};
if (_model != _myModel) then {
	if(([player,_skinpkg] call BIS_fnc_invRemove) == 1) then {
		if (!isClass(configFile >> "CfgMagazines" >> _itemNew)) then {
			player addMagazine getText(missionConfigFile >> "Skins" >> _itemNew >> "package");
		} else {
			player addMagazine _itemNew;
		};
		[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
	};
};
DZE_ActionInProgress = false;