if (isNil "JustBlock") then {
    private ["_timer","_fps"];
    JustBlock = true;
    disableSerialization;
    waituntil{!isnull (finddisplay 46)};
    _timer = 15;
    _trigger = false;
    while {_timer > 0} do {
        _timer = _timer - 0.1;
        if !(isnull (finddisplay 49)) then {
            findDisplay 106 closeDisplay 1;
            finddisplay 49 closeDisplay 2;
            _fps = round(diag_fps);

            switch true do {
                case (!(_trigger) && (_fps <= 4)): {_trigger = true; disableUserInput true;};
                case ((_trigger) && (_fps > 4)): {endLoadingScreen; _trigger = false; disableUserInput false;};
            };

            if (_trigger) then {startLoadingScreen [" <UKN anti-dupe> Very low FPS, you are blocked...", "DayZ_loadingScreen"];}
            else {systemchat format["<UKN anti-dupe> Cannot exit game for 15 seconds after accessing your inventory.", round(_timer)];};
        };
        uiSleep 0.1;
    };
    if (_trigger) then {endLoadingScreen; disableUserInput false;};
    JustBlock = nil;
};