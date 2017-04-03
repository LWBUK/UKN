BankDialogTransferAmount = 13000;
BankDialogPlayerBalance = 13001;
BankDialogBankBalance = 13002;
BankDialogMaxAmount = 13003;
SCTraderDialogCatList = 32000;
SCTraderDialogItemList = 32001;
SCTraderDialogBuyPrice = 32002;
SCTraderDialogSellPrice = 32003;
GivePlayerDialogTransferAmount = 14000;
GivePlayerDialogPlayerBalance = 14001;

BankDialogUpdateAmounts = {
	ctrlSetText [BankDialogPlayerBalance, format["%1 %2", (player getVariable ['cashMoney', 0] call BIS_fnc_numberText), CurrencyName]];
	ctrlSetText [BankDialogBankBalance, format["%1 %2", (player getVariable ['bankMoney', 0] call BIS_fnc_numberText), CurrencyName]];
	ctrlSetText [BankDialogMaxAmount, format["Max: Unlimited", [MaxBankMoney] call BIS_fnc_numberText, CurrencyName]];
	if (getPlayerUID player in DonatorBank) then {ctrlSetText [BankDialogMaxAmount, format["Max: %1 %2", [MaxDonatorBankMoney] call BIS_fnc_numberText, CurrencyName]];};
	if (getPlayerUID player in Special1) then {ctrlSetText [BankDialogMaxAmount, format["Max: %1 %2", [Special1BankAmount] call BIS_fnc_numberText, CurrencyName]];};
	if (getPlayerUID player in Special2) then {ctrlSetText [BankDialogMaxAmount, format["Max: %1 %2", [Special2BankAmount] call BIS_fnc_numberText, CurrencyName]];};
};

GivePlayerDialogAmounts = {
	ctrlSetText [GivePlayerDialogPlayerBalance, format["%1 %2", (player getVariable ['cashMoney', 0] call BIS_fnc_numberText), CurrencyName]];
	ctrlSetText [14003, format["%1", (name cursorTarget)]];
};

BankDialogWithdrawAmount = {

	private ["_amount","_bank","_wealth"];

	_amount = parseNumber (_this select 0);	
	_bank = player getVariable ["bankMoney", 0];
	_wealth = player getVariable["cashMoney",0];
	
	if (LimitOnPlayer && ((_wealth + _amount ) >  MaxPlayerCoins )) exitWith { cutText ["You can only carry 5,000,000", "PLAIN DOWN"];};
	if(_amount > 5000000) exitWith { cutText ["You can not withdraw more then 5,000,000 coins at once.", "PLAIN DOWN"]; };
	if(_amount < 1 or _amount > _bank) exitWith { cutText ["You can not withdraw more than is in your bank.", "PLAIN DOWN"]; };

	player setVariable["cashMoney",(_wealth + _amount),true];
	player setVariable["bankMoney",(_bank - _amount),true];

	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";

	PVDZE_bank_Save = [player];
	publicVariableServer "PVDZE_bank_Save";

	cutText [format["You have withdrawn %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];

};

BankDialogDepositAmount = {

	private ["_amount","_bank","_wealth"];

	_amount = parseNumber (_this select 0);
	_bank = player getVariable ["bankMoney", 0];
	_wealth = player getVariable["cashMoney",0];

	if(_amount > 5000000) exitWith { cutText ["You can not deposit more then 5,000,000 coins at once.", "PLAIN DOWN"]; };
    if (_amount < 1 or _amount > _wealth) exitWith { cutText ["You can not deposit more than you have.", "PLAIN DOWN"]; };
	
	PVDZE_account_Doublecheck = [player];
    publicVariableServer "PVDZE_account_Doublecheck";

if(LimitOnBank && ((_bank + _amount ) >  MaxBankMoney )) then {
        if( (getPlayerUID player in Special1 ) && ((_bank + _amount ) <=  Special1BankAmount )) then {
                player setVariable["cashMoney",(_wealth - _amount),true];
                player setVariable["bankMoney",(_bank + _amount),true];        
                cutText [format["You have deposited %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];
        } else {
               
        };
        if( (getPlayerUID player in Special1) && ((_bank + _amount) > Special1BankAmount)) then {
                cutText [format["You can only have a max of %1 %3.", [Special1BankAmount] call BIS_fnc_numberText,[MaxDonatorBankMoney] call BIS_fnc_numberText,CurrencyName], "PLAIN DOWN"];
        } else {
 
        };
       
        if( (getPlayerUID player in Special2 ) && ((_bank + _amount ) <=  Special2BankAmount )) then {
                player setVariable["cashMoney",(_wealth - _amount),true];
                player setVariable["bankMoney",(_bank + _amount),true];        
                cutText [format["You have deposited %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];  
        } else {
               
        };
        if( (getPlayerUID player in Special2 ) && ((_bank + _amount ) > Special2BankAmount)) then {
                cutText [format["You can only have a max of %1 %3.", [Special2BankAmount] call BIS_fnc_numberText,[MaxDonatorBankMoney] call BIS_fnc_numberText,CurrencyName], "PLAIN DOWN"];
        } else {
 
        };

        if( (getPlayerUID player in Special1) || (getPlayerUID player in Special2 )) then {
        } else {
            cutText [format["You can only have a max of %1 %3.", [MaxBankMoney] call BIS_fnc_numberText,[MaxDonatorBankMoney] call BIS_fnc_numberText,CurrencyName], "PLAIN DOWN"];
        };
 
        } else {
        player setVariable["cashMoney",(_wealth - _amount),true];
        player setVariable["bankMoney",(_bank + _amount),true];
        cutText [format["You have deposited %1 %2", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];
        };

	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	PVDZE_bank_Save = [player];
	publicVariableServer "PVDZE_bank_Save";

};

GivePlayerAmount = {
	private ["_amount","_target","_wealth"];
	_amount = parseNumber (_this select 0);
	_target = cursorTarget;
	_wealth = player getVariable["cashMoney",0];
	_twealth = _target getVariable["cashMoney",0];
	_isMan = _target isKindOf "Man";
	
	if (_target getVariable ["tradingmoney", false]) exitWith {
		cutText ["You can not give to someone who is already trading.", "PLAIN DOWN"];
	};
	if (_amount < 1 or _amount > _wealth) exitWith {
		cutText ["You can not give more than you currently have.", "PLAIN DOWN"];
	};
	if (!_isMan) exitWith {
		cutText ["You are not looking correctly at a player", "PLAIN DOWN"];
	};
	if (_InTrd == 1) exitWith {
        cutText ["Other Player is busy, please wait.", "PLAIN DOWN"];
    };

PVDZE_account_Doublecheck = [player];
publicVariableServer "PVDZE_account_Doublecheck";
player setVariable["cashMoney",_wealth - _amount, true];
_target setVariable["cashMoney",_twealth + _amount, true];


PVDZE_plr_Save = [player,(magazines player),true,true] ;
publicVariableServer "PVDZE_plr_Save";
PVDZE_plr_Save = [_target,(magazines _target),true,true] ;
publicVariableServer "PVDZE_plr_Save";


cutText [format["You gave %1 %2.", _amount, CurrencyName], "PLAIN DOWN"];
};
