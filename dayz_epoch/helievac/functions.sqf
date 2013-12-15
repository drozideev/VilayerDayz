HELIEVAC_create_heli = {
	private ["_pos","_group","_pilot","_vehicle"];
	_pickup = _this select 0;
	_pos = [_pickup,HELIEVAC_spawndist,HELIEVAC_spawndist,30,1,2000,0] call BIS_fnc_findSafePos;
	
	_group = CreateGroup resistance;
	_group setSpeedMode 'FULL';
	_group setCombatMode "BLUE";

	_pilot = _group createUnit ["USMC_Soldier_Pilot", [0,0,1], [], 0, "CAN_COLLIDE"];
	_pilot removeAllEventHandlers "handleDamage";
	_pilot addEventHandler ["handleDamage", {false}];
	_pilot allowDamage false;
	_pilot setBehaviour "CARELESS";

	diag_log (format["Helievac _pilot %1", _pilot]);

	_vehicle = createVehicle [HELIEVAC_heli, [_pos select 0, _pos select 1, HELIEVAC_spawnheight], [], 0, "FLY"];
	_vehicle setPos [_pos select 0, _pos select 1, HELIEVAC_spawnheight];
	_pilot moveInDriver _vehicle;
	_vehicle setVariable ["Sarge",1,true];

	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;

	// if someone gets in... maybe take 10oz gold or kick them out	
	_vehicle addEventHandler ["GetIn",{
		
	}];

	// If the heli is killed, delete the pilot
	_vehicle addEventHandler ["killed", { 
		deleteVehicle (driver (_this select 0)); 
		HELIEVAC_limit = HELIEVAC_limit + 1;
		publicVariable "HELIEVAC_limit";
	}];
	
	// If pilot gets out, delete both pilot and chopper
	_vehicle addEventHandler ["GetOut",{
		_v = _this select 0;
		_p = _this select 1;
		_u = _this select 2;
		if (_p == 'driver') then {
			deleteVehicle _u;
			deleteVehicle _v;
		};
 	}];
	_vehicle;
};

HELIEVAC_do = {
	private ["_pickup", "_dest", "_smoke", "_lzPickup", "_lzDropOff", "_heli", "_route"];
	_pickup = _this select 0;
	_dest = _this select 1;
	_player = _this select 2;
	_heli = [_pickup] call HELIEVAC_create_heli;
	
	// find random postion to fly away
	_pos = [getMarkerPos "center",10000,11000,30,1,2000,0] call BIS_fnc_findSafePos;
	_route = [_pickup, _dest, _pos];
	[_heli, _route, _player] execVM '\z\addons\dayz_server\helievac\fly.sqf';
	while { (alive _heli) and (_heli distance _pickup) > 500 } do {
		_smoke = "SmokeShellGreen" createvehicle _pickup;
		sleep 60;
	};
};

HELIEVAC_flyto_target = {
	private ["_targetPosition", "_heli", "_land"];
	_targetPosition = _this select 0;
	_heli = _this select 1;
	_land = _this select 2;
	diag_log (format["Helievac doMove %1", _targetPosition]);
	_heli flyInHeight HELIEVAC_flyheight;
	_heli doMove _targetPosition;
	while { ( (alive _heli) && !(unitReady _heli) ) } do { sleep 1; };
	if (_land == 'DELETE') then {
		deleteVehicle (driver _heli);
		deleteVehicle _heli;
	} else {
		if (alive _heli) then
		{
		    _heli land _land;
		};
		_time = time;
		// this is to try and stop the chopper from hanging if the landing it dodgy
		while { ((getPos _heli) select 2) > 2 or ((time - _time) > HELIEVAC_wait) } do { sleep 1; };
	};
};

HELIEVAC_msg = {
	customRemoteMessage = ['hint', (_this select 1), (_this select 0)];
	publicVariable "customRemoteMessage";
};

HELIEVAC_create_helipad = {
	private ["_pos", "_pad"];
	_pos = _this select 0;
	_pad = "HeliHEmpty" createVehicle _pos;
	_pad setPos _pos;
	_pad;
};