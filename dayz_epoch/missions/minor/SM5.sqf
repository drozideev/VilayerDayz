//Hummer Wreck by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)

private ["_coords","_wait","_MainMarker75"];
[] execVM "\z\addons\dayz_server\missions\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords =  [getMarkerPos "center",0,4000,10,0,2000,0] call BIS_fnc_findSafePos;

//Mission accomplished
[nil,nil,rTitleText,"Хаммер разбился! Место аварии отмечено на карте.", "PLAIN",10] call RE;
[nil,nil,rGlobalRadio,"A Humvee has crashed! Check your map for the location!"] call RE;
[nil,nil,rHINT,"A Humvee has crashed! Check your map for the location!"] call RE;


MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_humveecrash = createVehicle ["HMMWVwreck",_coords,[], 0, "CAN_COLLIDE"];
_humveecrash setVariable ["Sarge",1,true];

_crate3 = createVehicle ["RULaunchersBox",[(_coords select 0) - 14, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate3] execVM "\z\addons\dayz_server\missions\misc\fillBoxesH.sqf";
_crate3 setVariable ["Sarge",1,true];

[_coords,40,4,3,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 1;
[_coords,40,4,3,1] execVM "\z\addons\dayz_server\missions\add_unit_server.sqf";//AI Guards
sleep 1;

waitUntil{{isPlayer _x && _x distance _crate3 < 10  } count playableunits > 0}; 

//Mission accomplished
[nil,nil,rTitleText,"Разбитый хаммер зачищен.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"The crash site has been secured by survivors!"] call RE;
[nil,nil,rHINT,"The crash site has been secured by survivors!"] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";


SM1 = 5;
[0] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf";
