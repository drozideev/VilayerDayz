private ["_dest", "_pickup"];
_pickup = _this select 0;
_dest = _this select 1;
_player = _this select 2;

diag_log (format["Helievac %1 - %2", _pickup, _dest]);

if (HELIEVAC_limit > 0) then {
	HELIEVAC_limit = HELIEVAC_limit - 1;
	publicVariable "HELIEVAC_limit";
	[_pickup, _dest, _player] call HELIEVAC_do;
};