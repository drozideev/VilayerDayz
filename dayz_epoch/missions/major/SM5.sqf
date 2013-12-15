//Medical Ural Attack by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)

private ["_coords","_MainMarker","_chopper","_wait"];
[] execVM "\z\addons\dayz_server\missions\SMGoMajor.sqf";

WaitUntil {MissionGo == 1};

_coords = [getMarkerPos "center",0,5500,30,0,20,0] call BIS_fnc_findSafePos;

//Mission start
[nil,nil,rTitleText,"Бандиты разбили Урал с медикаментами! Место аварии отмечено на карте.", "PLAIN",10] call RE;
[nil,nil,rGlobalRadio,"Bandits have destroyed a Ural carrying medical supplies and are securing the cargo! Check your map for the location!"] call RE;
[nil,nil,rHINT,"Bandits have destroyed a Ural carrying medical supplies and are securing the cargo! Check your map for the location!"] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_uralcrash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];
_uralcrash setVariable ["Sarge",1,true];

_hummer = createVehicle ["HMMWV_DZ",[(_coords select 0) + 30, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

_hummer setVariable ["Sarge",1,true];

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\missions\misc\fillBoxesM.sqf";
_crate setVariable ["Sarge",1,true];
_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\missions\misc\fillBoxesS.sqf";
_crate2 setVariable ["Sarge",1,true];

_aispawn = [_coords,80,6,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_coords,40,4,6,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 5;

waitUntil{{isPlayer _x && _x distance _uralcrash < 10  } count playableunits > 0}; 

//Mission accomplished
[nil,nil,rTitleText,"Урал с медикаментами отбит у бандитов.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"The medical supplies have been secured by survivors!"] call RE;
[nil,nil,rHINT,"The medical supplies have been secured by survivors!"] call RE;

[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";


SM1 = 5;
[0] execVM "\z\addons\dayz_server\missions\major\SMfinder.sqf";
