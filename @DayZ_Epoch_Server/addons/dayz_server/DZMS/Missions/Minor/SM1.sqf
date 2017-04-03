/*
	Bandit Hunting Party by lazyink (Full credit to TheSzerdi & TAW_Tonic for the code)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_vehicle","_code"];

_code = _this select 0;

//Name of the Mission
_missName = "Bandit Squad";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = ["Min", _code] call DZMSFindPos;

[nil,nil,rTitleText,"A Bandit Squad has been spotted!\nStop them from completing their patrol!", "PLAIN",10] call RE;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName,_code] ExecVM DZMSAddMinMarker;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,2,1,format ["DZMSUnitsMinor%1", _code]] call DZMSAISpawn;
sleep 5;
[_coords,2,1,format ["DZMSUnitsMinor%1", _code]] call DZMSAISpawn;
sleep 5;
[_coords,2,1,format ["DZMSUnitsMinor%1", _code]] call DZMSAISpawn;
sleep 5;
[_coords,2,1,format ["DZMSUnitsMinor%1", _code]] call DZMSAISpawn;
sleep 1;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,format ["DZMSUnitsMinor%1", _code]] call DZMSWaitMissionComp;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The Bandit Squad has been Wiped Out!", "PLAIN",6] call RE;
diag_log text format["[DZMS]: Minor SM1 Bandit Squad Mission has Ended."];
call compile format ["deleteMarker 'DZMSMinMarker%1';", _code];
call compile format ["deleteMarker 'DZMSMinDot%1';", _code];

//Let the timer know the mission is over
call compile format ["DZMSMinDone%1 = true;", _code];