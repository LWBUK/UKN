waitUntil {sleep 5; !isNil "dayz_animalCheck"};
if (isClass(configFile >> "CfgWeapons" >> "RH_hk417sgleotech") && isClass(configFile >> "CfgWeapons" >> "Chainsaw")) exitWith {
	systemChat("<UKN> Overpoch is installed correctly. You can ignore all error messages. Have fun!");
};

if !(isClass(configFile >> "CfgWeapons" >> "Chainsaw")) then {
	systemChat("<UKN> Epoch is NOT installed/launched correctly!");
};
if !(isClass(configFile >> "CfgWeapons" >> "RH_hk417sgleotech")) then {
	systemChat("<UKN> Overwatch is NOT installed/launched correctly!");
};

cutText ["", "BLACK"];
_text = "<t size='1.2' color='#a81e13'>YOU NEED OVERPOCH</t><br/><t size='1.2' color='#a81e13'>(EPOCH AND OVERWATCH)</t><br/><t size='1.2' color='#a81e13'>TO PLAY ON THIS SERVER</t><br/>;
[_text,0,0,999999,2,0,998] spawn BIS_fnc_dynamicText;


[] spawn {
	while {true} do {
		sleep 30;
		cutText ["","BLACK",0];
	};
};
