if (isNil "canbuild") then {
    canbuild = true;
};

while {!canbuild} do {
            _entity_array = (getPos player) nearEntities ["CAManBase",100];
            {
                if (_x isKindof "zZombie_Base") then {
                    deletevehicle _x;
                };
            } forEach _entity_array;
            sleep 4;
        };