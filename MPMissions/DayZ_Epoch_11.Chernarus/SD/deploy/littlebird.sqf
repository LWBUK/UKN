_uidList = ["76561198028236135","76561198312597166","76561198086108921","76561198129069566","76561198302675871","76561198124456356","76561198219999328"]; 
if!((getPlayerUID player) in _uidList)exitWith{systemChat "This option is only for donators"; cutText ["This option is only for donators","PLAIN DOWN"];};

_itemsPlayer = items player;
_magazinesPlayer = magazines player;
_hasToolbox = 	"ItemToolbox" in _itemsPlayer;
if !(_hasToolbox) exitWith {cutText [format["a Toolbox is required to create a Littlebird"], "PLAIN DOWN"];};
if (dayz_combat == 1) then { 
    cutText [format["You are in Combat and cannot build a Littlebird."], "PLAIN DOWN"];
} else {
	player playActionNow "Medic";
	r_interrupt = false;
	player removeWeapon "ItemToolbox";
	_dis=30;
	_sfx = "repair";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
	
	sleep 6;
	
	_object = "AH6X_EP1" createVehicle (position player);
	_object setVariable ["MalSar",1,true];
	
	_object attachto [player,[0.0,5.0,2.0]];
	_object setfuel 0.5;
	sleep 3;
	detach _object;
	player reveal _object;

	cutText [format["You have built a Littlebird!"], "PLAIN DOWN"];
	
	r_interrupt = false;
	player switchMove "";
	player playActionNow "stop";
	
	sleep 10;
	
	cutText [format["Warning: Spawned Littlebirds DO NOT SAVE after server restart and CANNOT be packed!"], "PLAIN DOWN"];
	
};