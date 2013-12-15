//Bandit Stash House by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)

private ["_coords","_wait","_MainMarker75"];
[] execVM "\z\addons\dayz_server\missions\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
publicVariable "MissionGoMinor";

_coords =  [getMarkerPos "center",0,5000,10,0,20,0] call BIS_fnc_findSafePos;

//Mission start
[nil,nil,rTitleText,"Бандиты устроили притон! Сходите, угостите их свинцом.", "PLAIN",10] call RE;
[nil,nil,rGlobalRadio,"A group of bandits have set up a stash house! Check your map for the location!"] call RE;
[nil,nil,rHINT,"A group of bandits have set up a stash house! Check your map for the location!"] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_baserunover = createVehicle ["Land_HouseV_1I3",[(_coords select 0) +2, (_coords select 1) +5,-0.3],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["Land_hut06",[(_coords select 0) - 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_baserunover3 = createVehicle ["Land_hut06",[(_coords select 0) - 7, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer = createVehicle ["HMMWV_DZ",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer2 = createVehicle ["SUV_TK_CIV_EP1",[(_coords select 0) - 25, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

_baserunover setVariable ["Sarge",1,true];
_baserunover2 setVariable ["Sarge",1,true];
_baserunover3 setVariable ["Sarge",1,true];
_hummer setVariable ["Sarge",1,true];
_hummer2 setVariable ["Sarge",1,true];

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\missions\misc\fillBoxes.sqf";
_crate setVariable ["Sarge",1,true];

[[(_coords select 0) - 20, (_coords select 1) - 15,0],40,4,2,0] execVM "\z\addons\dayz_server\missions\add_unit_server2.sqf";//AI Guards
sleep 3;
[[(_coords select 0) + 20, (_coords select 1) + 15,0],40,4,2,0] execVM "\z\addons\dayz_server\missions\add_unit_server2.sqf";//AI Guards
sleep 3;


waitUntil{{isPlayer _x && _x distance _baserunover < 20  } count playableunits > 0}; 

//Mission accomplished
[nil,nil,rTitleText,"Воровской притон уничтожен.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"The stash house is under survivor control!"] call RE;
[nil,nil,rHINT,"The stash house is under survivor control!"] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
publicVariable "MissionGoMinor";
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf";
