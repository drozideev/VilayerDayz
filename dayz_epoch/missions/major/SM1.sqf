//Weapons Cache by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)

private ["_coords","_MainMarker","_wait"];
[] execVM "\z\addons\dayz_server\missions\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,100,0,20,0] call BIS_fnc_findSafePos;

//Mission start
[nil,nil,rTitleText,"Бандиты раскопали тайник с оружием! Спеши, пока они все не забрали!", "PLAIN",10] call RE;
[nil,nil,rGlobalRadio,"Bandits have discovered a weapons cache! Check your map for the location!"] call RE;
[nil,nil,rHINT,"Bandits have discovered a weapons cache! Check your map for the location!"] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_hummer = createVehicle ["SUV_TK_CIV_EP1",[(_coords select 0) + 30, (_coords select 1) + 10,10],[], 0, "CAN_COLLIDE"];

_hummer setVariable ["Sarge",1,true];

_crate = createVehicle ["USVehicleBox",_coords,[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\missions\misc\fillBoxes.sqf";

_crate setVariable ["Sarge",1,true];

_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;

waitUntil{{isPlayer _x && _x distance _hummer < 10  } count playableunits > 0}; 

//Mission accomplished
[nil,nil,rTitleText,"Тайник с оружием отбит у бандитов.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"The weapons cache is under survivor control!"] call RE;
[nil,nil,rHINT,"The weapons cache is under survivor control!"] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";
