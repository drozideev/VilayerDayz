//Helicopter crash Mission Created by TheSzerdi Edited by Falcyn [QF]

private ["_coords","_itemType","_itemChance","_weights","_index","_iArray","_num","_nearby","_checking","_people","_wait","_dummymarker"];
[] execVM "\z\addons\dayz_server\missions\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords =  [getMarkerPos "center",0,7000,10,0,2000,0] call BIS_fnc_findSafePos;

//Mission start
[nil,nil,rTitleText,"Вертолет потерпел крушение! Убейте выживших и заберите добычу.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"A helicopter has crashed! Kill any survivors and secure the loot!"] call RE;
[nil,nil,rHINT,"A helicopter has crashed! Kill any survivors and secure the loot!"] call RE;


MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

chopcrash = createVehicle ["UH60Wreck_DZ",_coords,[], 0, "CAN_COLLIDE"];
chopcrash setVariable ["Sarge",1,true];

[_coords,40,4,3,1] execVM "\z\addons\dayz_server\missions\add_unit_server4.sqf";//AI Guards
sleep 1;

if (isDedicated) then {

	_num = round(random 5) + 2;
	_itemType =		[["SCAR_H_LNG_Sniper","magazine"], ["SCAR_H_LNG_Sniper_SD","magazine"], ["FN_FAL", "weapon"], ["bizon_silenced", "weapon"], ["M14_EP1", "weapon"], ["BAF_AS50_scoped", "weapon"], ["MakarovSD", "weapon"], ["Mk_48_DZ", "weapon"], ["M249_DZ", "weapon"], ["DMR", "weapon"], ["", "military"], ["", "medical"], ["MedBox0", "object"], ["NVGoggles", "weapon"], ["AmmoBoxSmall_556", "object"], ["AmmoBoxSmall_762", "object"]  ];
	_itemChance =	[0.08, 									0.08,										0.02,					 0.05,							 0.05, 					0.01, 				0.03, 						0.02, 					0.03, 				0.05, 				0.1, 				0.1, 			0.2, 						0.07, 					0.01, 							0.01, 	];					
	
	waituntil {!isnil "fnc_buildWeightedArray"};
	
	_weights = [];
	_weights = 		[_itemType,_itemChance] call fnc_buildWeightedArray;
	//diag_log ("DW_DEBUG: _weights: " + str(_weights));	
	for "_x" from 1 to _num do {
		//create loot
		_index = _weights call BIS_fnc_selectRandom;
		sleep 1;
		if (count _itemType > _index) then {
			//diag_log ("DW_DEBUG: " + str(count (_itemType)) + " select " + str(_index));
			_iArray = _itemType select _index;
			_iArray set [2,_coords];
			_iArray set [3,5];
			_iArray call spawn_loot;
			_nearby = _coords nearObjects ["WeaponHolder",20];
			{
				_x setVariable ["permaLoot",true];
			} forEach _nearBy;
		};
	};
};

_checking = 1;
while {_checking == 1} do {
_people =  nearestObjects [_coords,["Man"],20];
if ({isPlayer _x} count _people > 0) then {_checking = 0};
sleep 1;
};

//Mission accomplished
[nil,nil,rTitleText,"Хорошая работа - место крушения вертолета зачищено.", "PLAIN",6] call RE;
[nil,nil,rGlobalRadio,"Good work you've secured the crash site!"] call RE;
[nil,nil,rHINT,"Good work you've secured the crash site!"] call RE;

[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 5;
[0] execVM "\z\addons\dayz_server\missions\minor\SMfinder.sqf";