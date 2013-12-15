Private ["_EH_Fired","_EH_Fired_vehicle","_incar","_incarlast","_antiBackpackThread","_antiBackpackThread2"];

if (isNil "inSafezone") then {
    inSafezone = false;
};
_incar = objNull;
_incarlast = objNull;
AGN_safeZoneDebug = false; //Debug notes on screen.
AGN_safeZone_Backpack_EnableAntiBackpack = true;			//Should players not be able to take from peoples bags?
AGN_safeZone_Backpack_AllowGearFromLootPiles = true;		//Should players be able to loot from loot piles?
AGN_safeZone_Backpack_AllowGearFromVehicles = false;		//Should players be able to loot from a vehicles gear?
AGN_safeZone_Backpack_AllowGearFromDeadPlayers = true;		//Should players be able to loot from a dead players corpse?
AGN_safeZone_Backpack_AllowFriendlyTaggedAccess = true;	//Should players who are tagged friendly be able to access eachothers bags?
AGN_safeZone_Vehicles_AllowGearFromWithinVehicles = true;	//Should players be able to open the gear screen while they are inside a vehicle?

while {true} do {

    waitUntil { inSafeZone };
	SZ_SkTyp = typeOf player;
	if (vehicle player != player) then {
	    titleText [format["Вы въезжаете в безопасную торговую зону. Оружие отключено."],"PLAIN DOWN"]; titleFadeOut 4;
		}
	else{
		titleText [format["Вы входите в безопасную торговую зону. Оружие отключено."],"PLAIN DOWN"]; titleFadeOut 4;
		};
 
    _EH_Fired = player addEventHandler ["Fired", {
        titleText ["Запрещено стрелять в торговой зоне!","PLAIN DOWN"]; titleFadeOut 4;
        NearestObject [_this select 0,_this select 4] setPos[0,0,0];
    }];
    player_zombieCheck = {};
    fnc_usec_damageHandler = {};
    thePlayer removeAllEventHandlers "handleDamage";
    thePlayer addEventHandler ["handleDamage", {false}];
    thePlayer allowDamage false; 
 
	{
		_EH_Fired = _thePlayer addEventHandler ["Fired", {
			titleText ["Вы не можете стрелять в безопасной зоне.","PLAIN DOWN"]; titleFadeOut 4;
			NearestObject [_this select 0,_this select 4] setPos[0,0,0];
		}];
	};
	
	if ( AGN_safeZone_Backpack_EnableAntiBackpack ) then
	{
		AGN_LastPlayerLookedAt = objNull;
		AGN_LastPlayerLookedAtCountDown = 5;
		_antiBackpackThread = [] spawn {
			private [ "_ct","_ip","_ia","_dis"] ;
			while {insafezone} do
			{
				if ( isNull AGN_LastPlayerLookedAt ) then
				{
					waitUntil {!isNull cursorTarget};
					_ct = cursorTarget;
					_ip = isPlayer _ct;
					if ( _ip ) then { _ia = alive _ct; _dis = _ct distance player; } else { _ia = false; _dis = 1000; };
					
					if ( (_ip && _ia) && (_dis < 6.5) ) then
					{
						AGN_LastPlayerLookedAt = _ct;
					};
				} else {
					AGN_LastPlayerLookedAtCountDown = AGN_LastPlayerLookedAtCountDown - 1;
					if ( AGN_LastPlayerLookedAtCountDown < 0 ) then { AGN_LastPlayerLookedAtCountDown = 5; AGN_LastPlayerLookedAt = objNull; };
					sleep 1;
				};
			};
		};
			
		_antiBackpackThread2 = [] spawn {
			private ["_to","_dis","_inchk","_ip","_ia","_skip","_ct","_iv","_lp","_inv","_ctOwnerID","_friendlies","_if"];
			_ctOwnerID = 0;
			while {insafezone} do
			{
				_ct = cursorTarget;
				_skip = false;
				
				if ( !isNull (_ct) ) then
				{
					_to = typeOf _ct;
					_dis = _ct distance player;
					_inchk = ["WeaponHolder","ReammoBox"];
					
					_lp = false;
					{
						if ( (_to isKindOf _x) && (_dis < 10) && AGN_safeZone_Backpack_AllowGearFromLootPiles ) then
						{
							_lp = true;
						};
					} forEach ( _inchk );

					_ip = isPlayer _ct;
					_ia = alive _ct;
					_iv = _ct isKindOf "AllVehicles";
					_inv = (vehicle player != player);
					
					_if = false;
					if ( _ip ) then {
						_ctOwnerID = _ct getVariable["CharacterID","0"];
						_friendlies	= player getVariable ["friendlyTo",[]];
						if(_ctOwnerID in _friendlies) then {	
							if ( AGN_safeZone_Backpack_AllowFriendlyTaggedAccess ) then
							{
								_if = true;
							};
						};
					};
					if ( AGN_safeZoneDebug ) then {
					hintSilent ( format["AGN Safezone Commander\n\nCursorTarget\n%1\n\nDistance\n%2\n\nLootpile\n%3 [%9]\n\nisPlayer\n%4\n\nAlive\n%5\n\nisVehicle\n%6\n\ninVehicle\n%7\n\nisFriendly\n%8 (%12) [%10]\n\nSkip: %11\n",
                                                _ct, _dis, _lp, _ip, _ia, _iv, _inv, _if, AGN_safeZone_Backpack_AllowGearFromLootPiles, AGN_safeZone_Backpack_AllowFriendlyTaggedAccess, _skip, _ctOwnerID] );
};

					
					//Lootpile check
					if ( _lp ) then {_skip = true;};
					
					//Dead body check
					if ( !(_ia) && AGN_safeZone_Backpack_AllowGearFromDeadPlayers ) then {_skip = true;};
					
					//Vehicle check
					if ( _iv && (_dis < 10) && !(_ip) && AGN_safeZone_Backpack_AllowGearFromVehicles ) then {_skip = true;};
					
					//In a vehicle check
					if ( _inv && AGN_safeZone_Vehicles_AllowGearFromWithinVehicles ) then { _skip = true; };
					
					//Is player friendly?
					if ( _if ) then { _skip = true; };
				};
				
				if( !isNull (FindDisplay 106) && !_skip ) then
				{
					if ( isNull AGN_LastPlayerLookedAt ) then
					{
						(findDisplay 106) closeDisplay 1;
						waitUntil { isNull (FindDisplay 106) };
						createGearDialog [(player), 'RscDisplayGear'];
						titleText ["Защита от воровства. Если вы хотите обменяться с игроком вещами - добавьте друг друга в друзья.","PLAIN DOWN"]; titleFadeOut 4;
						waitUntil { isNull (FindDisplay 106) };
					} else {
						titleText ["Не цельтесь в других игроков в течение 5 секунд и вы сможете открыть ваше снаряжение.","PLAIN DOWN"]; titleFadeOut 4;
						(findDisplay 106) closeDisplay 1;
						waitUntil { isNull (FindDisplay 106) };
					};
				};
				if ( _skip && _if ) then {
					sleep 2;
					titleText ["Этот игрок - друг, вы можете обмениваться с ним снаряжением.","PLAIN DOWN"]; titleFadeOut 4;
				};
			};
		};
	}; 
 
	while {inSafezone} do {
	sleep 0.1;
		if ( !(isNull _incar) && (vehicle player == player) ) then
		{
			_incar removeEventHandler ["Fired", _EH_Fired_vehicle];
			_incarlast = _incar;
			_incarlast removeEventHandler ["Fired", _EH_Fired_vehicle];
			_incar = objNull;
		};
		
		if ( (vehicle player != player) && (isNull _incar) ) then
		{
			_incar = vehicle player;
			_EH_Fired_vehicle = _incar addEventHandler ["Fired", {
				titleText ["Вы не можете стрелять в безопасной зоне.","PLAIN DOWN"]; titleFadeOut 4;
				NearestObject [_this select 0,_this select 4] setPos[0,0,0];
			}];
		};
		if (typeOf player != SZ_SkTyp) then
		{
		SZ_SkTyp = typeOf player;
		_EH_Fired = player addEventHandler ["Fired", {
        titleText ["Запрещено стрелять в торговой зоне!","PLAIN DOWN"]; titleFadeOut 4;
        NearestObject [_this select 0,_this select 4] setPos[0,0,0];
		}];
		player_zombieCheck = {};
		fnc_usec_damageHandler = {};
		thePlayer removeAllEventHandlers "handleDamage";
		thePlayer addEventHandler ["handleDamage", {false}];
		thePlayer allowDamage false; 
		};
	};
   
 	waitUntil { (!inSafezone) };
    titleText [format["Вы покидаете безопасную торговую зону."],"PLAIN DOWN"]; titleFadeOut 4;
    player removeEventHandler ["Fired", _EH_Fired];
	if ( !(isNull _incar) ) then
	{
		_incar removeEventHandler ["Fired", _EH_Fired_vehicle];
		_incar = objNull;
	};

    player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
    fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
    thePlayer addEventHandler ["handleDamage", {true}];
    thePlayer removeAllEventHandlers "handleDamage";
    thePlayer allowDamage true;
};