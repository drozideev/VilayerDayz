private ["_player", "_heli", "_dest"];
_player = _this select 0;
_heli = _this select 1;
_dest = _this select 2;

while { (_heli distance _dest) > 500 } do { 
	_dist = round (_heli distance _dest);
	diag_log (format["HeliEVAC Helicopter is %1 km out", _dist]);
	[_player, format["Helicopter is %1m out", _dist]] call HELIEVAC_msg;
	sleep 5; 
};