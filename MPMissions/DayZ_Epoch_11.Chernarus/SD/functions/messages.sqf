If(isServer)exitWith{};
waitUntil {!isNil "dayz_animalCheck"};
_chattxt = "<UKN Overpoch>:";
sleep 35;
systemChat format["%1 %2",_chattxt,"Welcome to UKN Overpoch!"];
sleep 55;
for "_i" from 1 to 16 do {
	if !(alive player)exitwith{};
	_randmsg = [
	"Deploy Bike and Mozzie via toolbox, Press U for earplugs, 0 for autorun, Right Shift for Groups and END for debug toggle",
	"Bank ATM's are located around the map!",
	"Vehicles left in trade zones will be moved to the Pound!",
	"ADMINS: WARGASM, SOUPDRAGON AND TURMOIL",
	"Using mic side will get you auto killed!",
	"NO PVP WITHIN 200m OF TRADER SAFE ZONES excluding ATMS",
	"BASES MUST BE MAINTAINED VIA THE PLOT POLE AND SAFES USED EVERY 7 DAYS OR THEY MAY BE DELETED!!",
	"Vehicles will be deleted after 4 days of inactivity"
	] call BIS_fnc_selectRandom;
	systemChat format["%1 %2",_chattxt,_randmsg];
	sleep 600;
};