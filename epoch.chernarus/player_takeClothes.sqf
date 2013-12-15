// By Zabn 2013 @ BalotaBuddies.net
private["_itemNew","_onLadder","_skin","_body","_okSkin","_clothesTaken","_itemNewName","_result"];
_body = _this select 3;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText ["Вы не можете сделать это находясь на лестнице!" , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["Вы не можете сделать это из машины!", "PLAIN DOWN"]};

player removeAction s_player_clothes;
s_player_clothes = -1;

_skin = (typeOf _body);

_itemNew = _skin;

switch (_itemNew) do {
	case "Survivor3_DZ": {
		_itemNew = "Survivor2_DZ";
	};
	case "Bandit1_DZ": {
		_itemNew = "Survivor2_DZ";
	};
};

_itemNew = "Skin_" + _itemNew;
_okSkin = isClass (configFile >> "CfgMagazines" >> _itemNew);

if(_okSkin) then {
	player playActionNow "Medic";
	sleep 3;
	_clothesTaken = _body getVariable["clothesTaken",false];
	if(!_clothesTaken) then {
		_itemNewName = getText (configFile >> "CfgMagazines" >> _itemNew >> "displayName");
		_result = [player,_itemNew] call BIS_fnc_invAdd;
        if (_result) then {
			_body setVariable["clothesTaken",true,true];
			cutText [format["Один %1 был добавлен вам в снаряжение!",_itemNewName], "PLAIN DOWN"];
		} else {
			cutText [format["У вас нет свободного места для %1 :(",_itemNewName], "PLAIN DOWN"];
        };
	} else {
		cutText ["Одежда уже была снята!", "PLAIN DOWN"];
	};
} else {
	cutText [format["К сожалению, одежду с %1 нельзя снять.",_skin], "PLAIN DOWN"];
};