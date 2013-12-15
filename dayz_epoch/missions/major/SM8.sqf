//Aircraft crash sidemission Created by TheSzerdi Edited by Falcyn [QF]

private ["_coords","_dummymarker","_wait","_coord1","_coord2","_coord3","_coord4","_coord5","_coord6","_coord7","_coord8","_coord9","_coord10","_coord11","_coord12"];
[] execVM "\z\addons\dayz_server\missions\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_coord1 = [4908.355,11216.505,0];
_coord2 = [6162.9888,11324.005,0];
_coord3 = [7761.3657,11569.265,0];
_coord4 = [8336.6055,10441.17,0];
_coord5 = [7201.0664,10400.667,0];
_coord6 = [6249.1104,9579.043,0];
_coord7 = [4763.3818,9802.2734,0];
_coord8 = [3675.6865,7353.2798,0];
_coord9 = [6815.6362,5599.0854,0];
_coord10 = [7532.0742,8164.3203,0];
_coord11 = [6046.6455,8771.2178,0];
_coord12 = [5266.6836,7273.8135,0];

_coords = [_coord1, _coord2, _coord3, _coord4, _coord5, _coord6, _coord7, _coord8, _coord9, _coord10, _coord11, _coord12] call BIS_fnc_selectRandom;

//Mission start
[nil,nil,rTitleText,"C-130 совершил аварийную посадку! Успейте забрать груз первыми.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A C-130 has crash landed! Secure it's cargo for yourself!"] call RE;
[nil,nil,rHINT,"A C-130 has crash landed! Secure it's cargo for yourself!"] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

c130wreck = createVehicle ["C130J_wreck_EP1",[(_coords select 0) + 30, (_coords select 1) - 5,0],[], 0, "NONE"];
_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "NONE"];
_crate2 = createVehicle ["USVehicleBox",[(_coords select 0) - 10, (_coords select 1) - 10,0],[], 0, "NONE"];

[_crate] execVM "\z\addons\dayz_server\missions\misc\fillBoxes1.sqf";
[_crate2] execVM "\z\addons\dayz_server\missions\misc\fillBoxes1.sqf";
_crate setVariable ["Sarge",1,true];
_crate2 setVariable ["Sarge",1,true];

_aispawn = [[(_coords select 0) + 2, _coords select 1,0],80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server4.sqf";//AI Guards
sleep 5;
_aispawn = [[(_coords select 0) + 2, _coords select 1,0],80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server4.sqf";//AI Guards
sleep 5;
_aispawn = [[(_coords select 0) + 2, _coords select 1,0],40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server4.sqf";//AI Guards
sleep 5;
_aispawn = [[(_coords select 0) + 2, _coords select 1,0],40,4,4,1] execVM "\z\addons\dayz_server\missions\add_unit_server4.sqf";//AI Guards



waitUntil{{isPlayer _x && _x distance c130wreck < 30  } count playableunits > 0}; 

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

//Mission accomplished
[nil,nil,rTitleText,"Место посадки самолета зачищено. Отличная работа!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"You've secured the crash site! Good work."] call RE;
[nil,nil,rHINT,"You've secured the crash site! Good work."] call RE;

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";
