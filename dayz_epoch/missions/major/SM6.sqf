//Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)

private ["_coords","_MainMarker","_wait"];
[] execVM "\z\addons\dayz_server\missions\SMGoMajor.sqf";

WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,30,0,2000,0] call BIS_fnc_findSafePos;

//Mission start
[nil,nil,rTitleText,"Бандиты получили поставку оружия и медикаментов! Примерное местоположение отмечено на карте.", "PLAIN",10] call RE;
[nil,nil,rGlobalRadio,"A medical supply crate has been secured by bandits! Check your map for the location!"] call RE;
[nil,nil,rHINT,"A medical supply crate has been secured by bandits! Check your map for the location!"] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_hummer = createVehicle ["HMMWV_DZ",[(_coords select 0) + 10, (_coords select 1) - 10,0],[], 0, "CAN_COLLIDE"];

_hummer setVariable ["Sarge",1,true];

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 1, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\missions\misc\fillBoxesM.sqf";
_crate setVariable ["Sarge",1,true];

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\missions\misc\fillBoxesS.sqf";
_crate2 setVariable ["Sarge",1,true];

_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards

waitUntil{{isPlayer _x && _x distance _crate < 10  } count playableunits > 0}; 

//Mission accomplished
[nil,nil,rTitleText,"Оружие и медикаменты теперь принадлежат выжившим!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"The medical crate is under survivor control!"] call RE;
[nil,nil,rHINT,"The medical crate is under survivor control!"] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";



SM1 = 5;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";
