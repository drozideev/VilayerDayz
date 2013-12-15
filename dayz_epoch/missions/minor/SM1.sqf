//Bandit Hunting Party by lazyink (Full credit to TheSzerdi & TAW_Tonic for the code)

private ["_coords","_wait","_MainMarker75"];
[] execVM "\z\addons\dayz_server\missions\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords = [getMarkerPos "center",0,5500,2,0,2000,0] call BIS_fnc_findSafePos;

//Mission start
[nil,nil,rTitleText,"Бандиты взяли УАЗик и решили покататься-пострелять.. Испортите им веселье!", "PLAIN",10] call RE;
[nil,nil,rGlobalRadio,"A bandit hunting party has been spotted! Check your map for the location!"] call RE;
[nil,nil,rHINT,"A bandit hunting party has been spotted! Check your map for the location!"] call RE;


MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_hummer = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer setVariable ["Sarge",1,true];

[_coords,80,4,2,1] execVM "\z\addons\dayz_server\missions\add_unit_server2.sqf";//AI Guards
sleep 5;
[_coords,80,4,2,1] execVM "\z\addons\dayz_server\missions\add_unit_server2.sqf";//AI Guards
sleep 5;
[_coords,80,4,2,1] execVM "\z\addons\dayz_server\missions\add_unit_server2.sqf";//AI Guards
sleep 1;

waitUntil{({alive _x} count (units SniperTeam)) < 1};

//Mission accomplished
[nil,nil,rTitleText,"Команда бандитов была уничтожена.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"The hunting party has been wiped out!"] call RE;
[nil,nil,rHINT,"The hunting party has been wiped out!"] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf";