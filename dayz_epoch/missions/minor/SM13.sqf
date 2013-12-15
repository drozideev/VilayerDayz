//Axe murderer script Created by TheSzerdi Edited by Falcyn [QF]

private ["_coords","_wait","_dummymarker","_grouparray","_group"];
[] execVM "\z\addons\dayz_server\missions\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords = [getMarkerPos "center",0,7000,2,0,2000,0] call BIS_fnc_findSafePos;

//Mission start
[nil,nil,rTitleText,"Сумасшедший маньяк с топором сбежал из больницы!", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A psychotic axe murderer has escaped from the hospital!"] call RE;
[nil,nil,rHINT,"A psychotic axe murderer has escaped from the hospital!"] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

[_coords,80,4,1,2] execVM "\z\addons\dayz_server\missions\add_unit_server5.sqf";//AI Guards
sleep 1;
waitUntil{({alive _x} count (units AxeMurderer)) < 1};

//Mission accomplished
[nil,nil,rTitleText,"Наконец-то! Маньяк погиб. Возможно, он нес немного украденного из больницы...", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"Finally! He died! Check the body for medical supplies!"] call RE;
[nil,nil,rHINT,"Finally! He died! Check the body for medical supplies!"] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\missions\Minor\SMfinder.sqf";
