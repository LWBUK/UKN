private ["_characterID","_minutes","_newObject","_playerID","_infected","_victim","_victimName","_killer","_killerName","_weapon","_distance","_message","_loc_message","_key","_death_record","_pic"];
//[unit, weapon, muzzle, mode, ammo, magazine, projectile]
_characterID = 	_this select 0;
_minutes =		_this select 1;
_newObject = 	_this select 2;
_playerID = 	_this select 3;
_infected =		_this select 4;
if (((count _this) >= 6) && {(typeName (_this select 5)) == "STRING"} && {(_this select 5) != ""}) then {
	_victimName =	_this select 5;
} else {
	_victimName =  if (alive _newObject) then {name _newObject;} else {"";};
};
_victim = _newObject;
_newObject setVariable ["bodyName", _victimName, true];
_newObject setVariable ["bodyUID", _playerID, true];

sleep 3;

_killer = _victim getVariable["AttackedBy", "nil"];
_killerName = _victim getVariable["AttackedByName", "nil"];

// when a zombie kills a player _killer, _killerName && _weapon will be "nil"
// we can use this to determine a zombie kill && send a customized message for that. right now no killmsg means it was a zombie.
if ((typeName _killer) != "STRING") then
{
	_weapon = _victim getVariable["AttackedByWeapon", "nil"];
	_distance = _victim getVariable["AttackedFromDistance", "nil"];

	if ((owner _victim) == (owner _killer)) then 
	{
		_message = format["%1 killed himself",_victimName];
		_loc_message = format["PKILL: %1 killed himself", _victimName];
	}
	else
	{
		_message = format["%1 was killed by %2 with weapon %3 from %4m",_victimName, _killerName, _weapon, _distance];
		_loc_message = format["PKILL: %1 was killed by %2 with weapon %3 from %4m", _victimName, _killerName, _weapon, _distance];
	
	
		_pic = _victim getVariable["AttackedByWeaponImg", "nil"];
		
                if ((gettext (configFile >> 'cfgWeapons' >> (currentWeapon _killer) >> 'displayName')) != "Throw") then {
			if (!isNil "_pic") then {
				_kill_txt = format ["<t align='left' size='0.7'>%1 </t>",_killerName,_pic,_victimName,(ceil _distance)];
				_kill_txt = _kill_txt + format ["<img size='0.9' align='left' image='%2'/>",_killerName,_pic,_victimName,(ceil _distance)];
				_kill_txt = _kill_txt + format ["<t align='left' size='0.7'> %3 </t>",_killerName,_pic,_victimName,(ceil _distance)];
				_kill_txt = _kill_txt + format ["<t align='left' size='0.7'>[%4m]</t>",_killerName,_pic,_victimName,(ceil _distance)];

				_msg = format ["<Playerkill>: %1 was killed by %2 with a %3 from %4 meters",_victimName,_killerName,_weapon,(ceil _distance)]; // <--- Edit HERE Your MSG
				customkillMessage = [_kill_txt,_msg];
				publicVariable "customkillMessage";
			};
		}; 
	
	
	};

	diag_log _loc_message;

	if(DZE_DeathMsgGlobal) then {
		[nil, nil, rspawn, [_killer, _message], { (_this select 0) globalChat (_this select 1) }] call RE;
	};
	/* needs customRemoteMessage
	if(DZE_DeathMsgGlobal) then {
		customRemoteMessage = ['globalChat', _message, _killer];
		publicVariable "customRemoteMessage";
	};
	*/
	if(DZE_DeathMsgSide) then {
		[nil, nil, rspawn, [_killer, _message], { (_this select 0) sideChat (_this select 1) }] call RE;
	};
	if(DZE_DeathMsgTitleText) then {
		[nil,nil,"per",rTITLETEXT,_message,"PLAIN DOWN"] call RE;
	};
    
	_pic = _victim getVariable["AttackedByWeaponImg", "nil"];
	
	// build array to store death messages to allow viewing at message board in trader citys.
	_death_record = [
	_victimName,
	_killerName,
	_weapon,
	_pic,
	_distance,
	ServerCurrentTime
];
PlayerDeaths set [count PlayerDeaths,_death_record];
PV_DeathBoard = PlayerDeaths;
publicVariable "PV_DeathBoard"; 

	// Cleanup
	_victim setVariable["AttackedBy", "nil", true];
	_victim setVariable["AttackedByName", "nil", true];
	_victim setVariable["AttackedByWeapon", "nil", true];
	_victim setVariable["AttackedFromDistance", "nil", true];
};

// Might not be the best way...
/*
if (isnil "dayz_disco") then {
	dayz_disco = [];
};
*/

// dayz_disco = dayz_disco - [_playerID];
_newObject setVariable["processedDeath",diag_tickTime];

if (typeName _minutes == "STRING") then
{
	_minutes = parseNumber _minutes;
};

diag_log ("PDEATH: Player Died " + _playerID);

if (_characterID != "0") then
{
	_key = format["CHILD:202:%1:%2:%3:",_characterID,_minutes,_infected];
	#ifdef DZE_SERVER_DEBUG_HIVE
	diag_log ("HIVE: WRITE: "+ str(_key));
	#endif
	_key call server_hiveWrite;
}
else
{
	deleteVehicle _newObject;
};