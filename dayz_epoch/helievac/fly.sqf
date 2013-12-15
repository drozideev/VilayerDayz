private ["_route", "_heli", "_player", "_pos", "_pad", "_i"];

_heli = _this select 0;
_route = _this select 1;
_player = _this select 2;
diag_log (format["Helievac create fly.sqf %1 %2", _heli, _route]);
_pad1 = [(_route select 0)] call HELIEVAC_create_helipad;
_pad2 = [(_route select 1)] call HELIEVAC_create_helipad;
for "_x" from 0 to 2 do {
	_pos = _route select _x;
	diag_log (format["HeliEVAC Goto Location %1 %2", _x, _pos]);
	_heli setFuel 1;
	switch (_x) do {
		case 0: {
			[_player, _heli, _pos] execVM "\z\addons\dayz_server\helievac\message.sqf";
			[_pos, _heli, 'GET IN'] call HELIEVAC_flyto_target;
			while { 
				((getPos _heli) select 2) > 5 
			} do { 
				sleep 1; 
			};
			_time = time;
			_crew = [];
			WaitUntil { (_player in (crew _heli)) or ((time - _time) > HELIEVAC_wait) };
		};
		case 1: {
			[_pos, _heli, 'GET OUT'] call HELIEVAC_flyto_target;
			sleep 5;
			{
				if (_x != driver _heli) then {
					_x action ['Eject', _heli];
				};
			} foreach (crew _heli);
			deleteVehicle _pad1;
			deleteVehicle _pad2;
		};
		case 2: {
			HELIEVAC_limit = HELIEVAC_limit + 1;
			publicVariable "HELIEVAC_limit";
			[_pos, _heli, 'DELETE'] call HELIEVAC_flyto_target;
		};
	};
};