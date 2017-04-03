disableSerialization;

AsReMixhud_Control = true;

while {true} do
{
    Humanity	=	Player getVariable["humanity",0];

	if((Humanity >= -4999) && (Humanity <= 4999)) then {
	Humanity_Icon = "<img image='SD\gui\icons\CivHumanity.paa'/>";
	Humanity_text = "<t color='#DDDDDD'>Survivor</t><br/>";};
	
	if(Humanity >= 5000) then {
	Humanity_Icon = "<img image='SD\gui\icons\HeroHumanity.paa'/>";
	Humanity_text = "<t color='#0045BD'>Hero</t><br/>";};
	
	if (Humanity <= -5000) then {
	Humanity_Icon = "<img image='SD\gui\icons\BanditHumanity.paa'/>";
	Humanity_text = "<t color='#C70000'>Bandit</t><br/>";};

	1000 cutRsc ["AsReMixhud","PLAIN"];

	_wpui = uiNameSpace getVariable "AsReMixhud";
    _vitals = _wpui displayCtrl 4900;
	_Player = player;

	Money 		        = 		_Player getVariable["cashMoney",0];
    Bank_Balance 		= 		_Player getVariable["bankMoney",0];


	_vitals ctrlSetStructuredText parseText format 
["
	<t size='1'> %1 </t><img size='1' align='right' image='SD\Player_Hud\icons\Money.paa'/><br/>
	<t size='1'> %2 </t><img size='1' align='right' image='SD\Player_Hud\icons\Bank.paa'/><br/>",
	
	[Money] call BIS_fnc_numberText,
	[Bank_Balance] call BIS_fnc_numberText
];
	_vitals ctrlCommit 0;
    sleep 1.5;
};