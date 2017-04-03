/*
	Bandit Heli Down! by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_crash","_crate","_code"];

_code = _this select 0;

//Name of the Mission
_missName = "Helicopter Crash";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = ["Min", _code] call DZMSFindPos;

[nil,nil,rTitleText,"A Helicopter has Crashed!\nGo Check for Survivors!", "PLAIN",10] call RE;

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName,_code] ExecVM DZMSAddMinMarker;

//Add the scenery
_crash = createVehicle ["UH60Wreck_DZ", _coords,[], 0, "CAN_COLLIDE"];

//DZMSProtectObj prevents it from disappearing
[_crash] call DZMSProtectObj;

//We create and fill the crates
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weapons"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,3,1,format ["DZMSUnitsMinor%1", _code]] call DZMSAISpawn;
sleep 1;
[_coords,3,1,format ["DZMSUnitsMinor%1", _code]] call DZMSAISpawn;
sleep 1;
[_coords,3,1,format ["DZMSUnitsMinor%1", _code]] call DZMSAISpawn;
sleep 1;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,format ["DZMSUnitsMinor%1", _code]] call DZMSWaitMissionComp;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The Helicopter Crash has been Secured by Survivors!", "PLAIN",6] call RE;
diag_log text format["[DZMS]: Minor SM4 Crash Site Mission has Ended."];
call compile format ["deleteMarker 'DZMSMinMarker%1';", _code];
call compile format ["deleteMarker 'DZMSMinDot%1';", _code];


//Let the timer know the mission is over
call compile format ["DZMSMinDone%1 = true;", _code];