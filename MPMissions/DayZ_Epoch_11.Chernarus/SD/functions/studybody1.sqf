private ["_body", "_name", "_kills", "_killsH", "_killsB", "_humanity","_diff","_dateNow","_deathTime","_body","_name","_method","_methodStr","_killerName","_weapon","_distance"];
 
_body =    _this select 3;
_name =    _body getVariable["bodyName","unknown"];
_method =    _body getVariable["deathType","unknown"];
_deathTime =    _body getVariable["deathTime",-1];
_methodStr = localize format ["str_death_%1",_method];
_killerName = _body getVariable["AttackedByName", "nil"];
_weapon = _body getVariable["AttackedByWeapon", "nil"];
_distance = _body getVariable["AttackedFromDistance", "nil"];
_kills = _body getVariable ["zombieKills",0];
_killsH = _body getVariable ["humanKills",0];
_killsB = _body getVariable ["banditKills",0];
_humanity = _body getVariable ["humanity",0];
 
 
cutText [format["Their name was %1.",_name], "PLAIN DOWN"];
sleep 5;
 
 
cutText [format["Zombie Kills: %1, Murders: %2, Bandit Kills: %3, Humanity: %4.",_kills,_killsH,_killsB,_humanity], "PLAIN DOWN"];
sleep 5;