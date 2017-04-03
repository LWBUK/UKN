private ["_body", "_hisMoney", "_myMoney"];

_body = _this select 3;
_walletCheck = _body getVariable ["cashMoney",0];
_PlayerNear = _body call dze_isnearest_player;

if (_walletCheck == 0) exitWith {cutText ["This is one poor motherfucker!.", "PLAIN DOWN"];};
if (_PlayerNear) exitWith {cutText [localize "str_pickup_limit_4", "PLAIN DOWN"]};

_name = _body getVariable ["bodyName","unknown"];
_hisMoney = _body getVariable ["cashMoney",0];
_myMoney = player getVariable ["cashMoney",0];
_myMoney = _myMoney + _hisMoney;
_body setVariable ["cashMoney", 0 , true];

player setVariable ["cashMoney", _myMoney , true];

systemChat format ['You took %1 Coins, From: %2 !',_hisMoney,_name];
sleep 2;

_cid =	player getVariable ["CharacterID","0"];
_cashMoney = player getVariable ["cashMoney",0];

if(_cashMoney > 0) then{

} else {

_cashMoney = 0;

};