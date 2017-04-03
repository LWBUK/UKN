/*
	DayZ Mission System Timer by Vampire
	Based on fnc_hTime by TAW_Tonic and SMFinder by Craig
	This function is launched by the Init and runs continuously.
*/
private["_run","_timeDiff","_timeVar","_wait","_cntMis","_ranMis","_varName","_code","_coords"];

_code = _this select 0;

//Let's get our time Min and Max
_timeDiff = DZMSMajorMax - DZMSMajorMin;
_timeVar = _timeDiff + DZMSMajorMin;

diag_log text format ["[DZMS]: Major %1 Mission Clock Starting!", _code];

//Lets get the loop going
_run = true;
while {_run} do
{
	//Lets wait the random time
	_wait  = round(random _timeVar);
    [_wait,5] call DZMSSleep;
	
	//Let's check that there are missions in the array.
	//If there are none, lets end the timer.
	_cntMis = count DZMSMajorArray;
	if (_cntMis == 0) then { _run = false; };
	
	//Lets pick a mission
	_ranMis = floor (random _cntMis);
	_varName = DZMSMajorArray select _ranMis;
    
    // clean up all the existing units before starting a new one
    call compile format ["{if (alive _x) then {_x call DZMSPurgeObject;};} forEach DZMSUnitsMajor%1;", _code];
    
    // rebuild the array for the next mission
    call compile format ["DZMSUnitsMajor%1 = [];", _code];
    
	//Let's Run the Mission
	[_code] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_varName];
	diag_log text format ["[DZMS]: Running Major Mission %1.",_varName];
	
	//Let's wait for it to finish or timeout
	call compile format ["waitUntil {DZMSMajDone%1};", _code];
	DZMS_MajBlack set [_code-1, [[0,0,0],0]];
	DZMSBlacklistZones = DZMSBlacklistZonesOriginal+DZMS_MajBlack+DZMS_MinBlack;
	{
		private ["_coords"];
		call compile format["_coords = Maj%1_coord;", _code];
		if (_x select 0 == _coords select 0 && _x select 1 == _coords select 1 && _x select 2 == _coords select 2) then {
			DONN_DZMS_staticUSed set [_forEachIndex, [0,0,0]];
		};	
	} forEach DONN_DZMS_staticUSed;
	call compile format ["DZMSMajDone%1 = false;", _code];
};