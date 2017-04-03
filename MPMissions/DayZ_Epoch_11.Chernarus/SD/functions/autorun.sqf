if (player != vehicle player) exitWith {};
if (surfaceIsWater (getPosASL player)) exitWith {systemChat('<UKN> Autorun currently unavailable.');};
if (r_fracture_legs or r_player_unconscious or deathHandled) exitWith {};
if (autoRunActive == 0) then {
	autoRunActive = 1;
	systemChat('<UKN> Autorun Activated');
	systemChat('<UKN> Check for missions or obstacles you may run into');
	autoRunThread = [] spawn 
	{
		while {autoRunActive == 1} do 
		{
			if ((player != vehicle player) or (surfaceIsWater (getPosASL player)) or 
			r_fracture_legs or r_player_unconscious or deathHandled) exitWith {call autoRunOff; systemChat('<UKN> Autorun Deactivated');};
			player playAction "FastF";
			uiSleep 0.5;
		};
	};
} else {
	call autoRunOff;
	systemChat('<UKN> Autorun Deactivated');
};
_handled = true;