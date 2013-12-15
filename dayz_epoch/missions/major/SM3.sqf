//Medical Supply Camp by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)

private ["_coords","_MainMarker","_base","_wait"];
[] execVM "\z\addons\dayz_server\missions\SMGoMajor.sqf";

WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,50,0,20,0] call BIS_fnc_findSafePos;

//Mission start
[nil,nil,rTitleText,"Обнаружен бандитский склад оружия и медикаментов!", "PLAIN",10] call RE;
[nil,nil,rGlobalRadio,"Bandits have set up a medical re-supply camp! Check your map for the location!"] call RE;
[nil,nil,rHINT,"Bandits have set up a medical re-supply camp! Check your map for the location!"] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_baserunover = createVehicle ["land_fortified_nest_big",[(_coords select 0) - 20, (_coords select 1) - 10,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["Land_Fort_Watchtower",[(_coords select 0) - 10, (_coords select 1) + 10,-0.2],[], 0, "CAN_COLLIDE"];
_hummer = createVehicle ["HMMWV_DZ",[(_coords select 0) + 25, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

_baserunover2 setVariable ["Sarge",1,true];
_baserunover setVariable ["Sarge",1,true];
_hummer setVariable ["Sarge",1,true];

_crate = createVehicle ["USVehicleBox",[(_coords select 0) + 5, (_coords select 1),0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\missions\misc\fillBoxesM.sqf";
_crate setVariable ["Sarge",1,true];


_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) + 12, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\missions\misc\fillBoxesS.sqf";
_crate2 setVariable ["Sarge",1,true];

_aispawn = [_coords,80,6,3,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,3,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,3,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards


waitUntil{{isPlayer _x && _x distance _crate < 10  } count playableunits > 0}; 

//Mission accomplished
[nil,nil,rTitleText,"Склад зачищен, добыча в хороших руках.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"Survivors have taken control of the camp and medical supplies."] call RE;
[nil,nil,rHINT,"Survivors have taken control of the camp and medical supplies."] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";