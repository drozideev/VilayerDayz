_pathtotools = "admintools\tools\";
_pathtoskins = "admintools\skins\";
_pathtoweapon = "admintools\weaponkits\";
_pathtoshields = "admintools\shields\";
_pathtovehicles = "admintools\vehicles\";
_pathtobuildings = "admintools\buildings\";
_pathtoitems = "admintools\items\";

_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';
_EXECscript2 = 'player execVM "'+_pathtoskins+'%1"';
_EXECscript3 = 'player execVM "'+_pathtoweapon+'%1"';
_EXECscript4 = 'player execVM "'+_pathtoshields+'%1"';
_EXECscript5 = 'player execVM "'+_pathtovehicles+'%1"';
_EXECscript6 = 'player execVM "'+_pathtobuildings+'%1"';
_EXECscript7 = 'player execVM "'+_pathtoitems+'%1"';


//customise these menus to fit your server
if ((getPlayerUID player) in ["2292868","75126342","2508420"]) then { //all admins
	if ((getPlayerUID player) in ["#####"]) then { //mods
        adminmenu =
        [
			["",true],
				["Инструменты", [2], "#USER:ModToolsMenu", -5, [["expression", ""]], "1", "1"],
				["Смена скинов", [3], "#USER:SkinsMenu", -5, [["expression", ""]], "1", "1"],
				["Комплекты оружия", [4], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
	if ((getPlayerUID player) in ["#####"]) then { //admins
        adminmenu =
        [
			["",true],
				["Инструменты", [2], "#USER:AdminToolsMenu", -5, [["expression", ""]], "1", "1"],
				["Смена скинов", [3], "#USER:SkinsMenu", -5, [["expression", ""]], "1", "1"],
				["Комплекты оружия", [4], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
        ];};
	if ((getPlayerUID player) in ["2292868","75126342","2508420"]) then { // super admins
		adminmenu =
		[
			["",true],
				["Инструменты", [2], "#USER:ToolsMenu", -5, [["expression", ""]], "1", "1"],
				["Смена скинов", [3], "#USER:SkinsMenu", -5, [["expression", ""]], "1", "1"],
				["Спавн машин", [5], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];};
};
//customise to fit
ModToolsMenu =
[
	["",true],
		["ESP", [2],  "", -5, [["expression", format[_EXECscript1,"dayzesp.sqf"]]], "1", "1"],
		["Неуязвимость", [3],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		["Неуязвимость машины", [4],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Вылечить игрока(ов)", [5],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
		["Ремонт техники", [6],  "", -5, [["expression", format[_EXECscript1,"looknrepair.sqf"]]], "1", "1"],
		["Ремонт зданий", [7],  "", -5, [["expression", format[_EXECscript1,"fixbuildings.sqf"]]], "1", "1"],
		["Наблюдение", [8],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ToolsMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
//customise to fit
AdminToolsMenu =
[
	["",true],
		["ESP / Теле", [2],  "", -5, [["expression", format[_EXECscript1,"dayzesp.sqf"]]], "1", "1"],
		["Неуязвимость", [3],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		["Неуязвимость машины", [4],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Вылечить игрока(ов)", [5],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
		["Ремонт техники", [6],  "", -5, [["expression", format[_EXECscript1,"looknrepair.sqf"]]], "1", "1"],
		["Ремонт зданий", [7],  "", -5, [["expression", format[_EXECscript1,"fixbuildings.sqf"]]], "1", "1"],
		["Наблюдение", [8],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ToolsMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
ToolsMenu =
[
	["",true],
		["ESP / Теле", [2],  "", -5, [["expression", format[_EXECscript1,"dayzesp.sqf"]]], "1", "1"],
		["Неуязвимость", [3],  "", -5, [["expression", format[_EXECscript1,"Godmode.sqf"]]], "1", "1"],
		["Неуязвимость машины", [4],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Вылечить игрока(ов)", [5],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
		["Ремонт техники", [6],  "", -5, [["expression", format[_EXECscript1,"looknrepair.sqf"]]], "1", "1"],
		["Ремонт зданий", [7],  "", -5, [["expression", format[_EXECscript1,"fixbuildings.sqf"]]], "1", "1"],
		["Наблюдение", [8],  "", -5, [["expression", format[_EXECscript1,"spectate.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ToolsMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
ToolsMenu2 = 
[
["",true],
		["Перевернуть технику", [2],  "", -5, [["expression", format[_EXECscript1,"flipvehicle.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
SkinsMenu =
[
	["",true],
		["Hero", [2],  "", -5, [["expression", format[_EXECscript2,"Hero.sqf"]]], "1", "1"],
		["Camo", [3],  "", -5, [["expression", format[_EXECscript2,"Camo.sqf"]]], "1", "1"],
		["Ghillie", [4],  "", -5, [["expression", format[_EXECscript2,"Ghille.sqf"]]], "1", "1"],
		["Suvivor", [5],  "", -5, [["expression", format[_EXECscript2,"Male.sqf"]]], "1", "1"],
		["Soldier", [6],  "", -5, [["expression", format[_EXECscript2,"Soldier.sqf"]]], "1", "1"],
		["Невидимка", [7],  "", -5, [["expression", format[_EXECscript2,"invisible.sqf"]]], "1", "1"],
		["Курица", [7],  "", -5, [["expression", format[_EXECscript2,"chiken.sqf"]]], "1", "1"],
		["Корова", [7],  "", -5, [["expression", format[_EXECscript2,"cow.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

WeaponMenu =
[
	["",true],
		["No Weapons", [2],  "", -5, [["expression", format[_EXECscript3,"items.sqf"]]], "1", "1"],
		["M4 Holo", [3],  "", -5, [["expression", format[_EXECscript3,"itemz.sqf"]]], "1", "1"],
		["M4 CCO SD", [4],  "", -5, [["expression", format[_EXECscript3,"itemz2.sqf"]]], "1", "1"],
		["AS50", [5],  "", -5, [["expression", format[_EXECscript3,"itemz3.sqf"]]], "1", "1"],
		["FN FAL", [6],  "", -5, [["expression", format[_EXECscript3,"itemz4.sqf"]]], "1", "1"],
		["M16 ACOG", [7],  "", -5, [["expression", format[_EXECscript3,"itemz5.sqf"]]], "1", "1"],
		["Pecheneg 50 cal", [8],  "", -5, [["expression", format[_EXECscript3,"itemz6.sqf"]]], "1", "1"],
		["Mk 48", [9],  "", -5, [["expression", format[_EXECscript3,"item7.sqf"]]], "1", "1"],
		["Gold AK", [10],  "", -5, [["expression", format[_EXECscript3,"item8.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:WeaponMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
WeaponMenu2 =
[
	["",true],
		["Aks Kobra", [2],  "", -5, [["expression", format[_EXECscript3,"item9.sqf"]]], "1", "1"],
		[".338 LAPUA", [3],  "", -5, [["expression", format[_EXECscript3,"item10.sqf"]]], "1", "1"],
		["DMR", [4],  "", -5, [["expression", format[_EXECscript3,"item11.sqf"]]], "1", "1"],
		["M4A1 HWS GL SD Camo", [5],  "", -5, [["expression", format[_EXECscript3,"item12.sqf"]]], "1", "1"],
		["M14 Aim", [6],  "", -5, [["expression", format[_EXECscript3,"item13.sqf"]]], "1", "1"],
		["Alice", [7],  "", -5, [["expression", format[_EXECscript3,"bp2.sqf"]]], "1", "1"],
		["Coyote", [8],  "", -5, [["expression", format[_EXECscript3,"bp1.sqf"]]], "1", "1"],
		["Delete gear", [9],  "", -5, [["expression", format[_EXECscript3,"cleanme.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:WeaponMenu3", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
//extra menu for custom kits remove "//" from lines below to use
WeaponMenu3 =
[
	["",true],
			//["", [2],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [3],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [4],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [5],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [6],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [7],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [8],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [9],  "", -5, [["expression", format[_EXECscript3,""]]], "1", "1"],
			//["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];


VehicleMenu = 
[
	["",true],
		["A10", [2],  "", -5, [["expression", format[_EXECscript5,"A10.sqf"]]], "1", "1"],
		["Little Bird", [3],  "", -5, [["expression", format[_EXECscript5,"AH64.sqf"]]], "1", "1"],
		["an2", [4],  "", -5, [["expression", format[_EXECscript5,"an2_prop.sqf"]]], "1", "1"],
		["Apache", [5],  "", -5, [["expression", format[_EXECscript5,"APACHE.sqf"]]], "1", "1"],
		["MTVR fors", [6],  "", -5, [["expression", format[_EXECscript5,"MTVRf.sqf"]]], "1", "1"],
		["MTVR des", [7],  "", -5, [["expression", format[_EXECscript5,"MTVR.sqf"]]], "1", "1"],
		["ATV", [8],  "", -5, [["expression", format[_EXECscript5,"ATV.sqf"]]], "1", "1"],
		["Bike", [9],  "", -5, [["expression", format[_EXECscript5,"Bike.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu2", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu2 =
[
["",true],
		["Bus", [2],  "", -5, [["expression", format[_EXECscript5,"bus.sqf"]]], "1", "1"],
		["C130", [3],  "", -5, [["expression", format[_EXECscript5,"C130.sqf"]]], "1", "1"],
		["Chinook", [4],  "", -5, [["expression", format[_EXECscript5,"chinook.sqf"]]], "1", "1"],
		["F35", [5],  "", -5, [["expression", format[_EXECscript5,"F35.sqf"]]], "1", "1"],
		["Boat 1", [6],  "", -5, [["expression", format[_EXECscript5,"FISH.sqf"]]], "1", "1"],
		["Boat 2", [7],  "", -5, [["expression", format[_EXECscript5,"FISH2.sqf"]]], "1", "1"],
		["Boat 3", [8],  "", -5, [["expression", format[_EXECscript5,"FISH3.sqf"]]], "1", "1"],
		["Gaz", [9],  "", -5, [["expression", format[_EXECscript5,"Gaz.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu3", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu3 =
[
["",true],
		["Hatchback", [2],  "", -5, [["expression", format[_EXECscript5,"Hatchback.sqf"]]], "1", "1"],
		["HMMV fors", [3],  "", -5, [["expression", format[_EXECscript5,"HMMV.sqf"]]], "1", "1"],
		["HMMV des", [4],  "", -5, [["expression", format[_EXECscript5,"HMMV_Fallu.sqf"]]], "1", "1"],
		["KA60 Namal", [5],  "", -5, [["expression", format[_EXECscript5,"KA60_namalsk.sqf"]]], "1", "1"],
		["Red Lada", [6],  "", -5, [["expression", format[_EXECscript5,"ladared.sqf"]]], "1", "1"],
		["White Lada", [7],  "", -5, [["expression", format[_EXECscript5,"Ladawhite.sqf"]]], "1", "1"],
		["Little Bird", [8],  "", -5, [["expression", format[_EXECscript5,"littleBird.sqf"]]], "1", "1"],
		["MI17", [9],  "", -5, [["expression", format[_EXECscript5,"MI17civ.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu4", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu4 =
[
["",true],
		["MI24", [2],  "", -5, [["expression", format[_EXECscript5,"MI24.sqf"]]], "1", "1"],
		["Mill Offroad", [3],  "", -5, [["expression", format[_EXECscript5,"militrayOffroad.sqf"]]], "1", "1"],
		["UH60", [4],  "", -5, [["expression", format[_EXECscript5,"UH60.sqf"]]], "1", "1"],
		["VW Golf", [5],  "", -5, [["expression", format[_EXECscript5,"miniHB.sqf"]]], "1", "1"],
		["Moto", [6],  "", -5, [["expression", format[_EXECscript5,"Moto.sqf"]]], "1", "1"],
		["Moto 2", [7],  "", -5, [["expression", format[_EXECscript5,"Moto2.sqf"]]], "1", "1"],
		["Moto 3", [8],  "", -5, [["expression", format[_EXECscript5,"Moto3.sqf"]]], "1", "1"],
		["Moto 4", [9],  "", -5, [["expression", format[_EXECscript5,"Moto4.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu5", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu5 =
[
["",true],
		["MV22", [2],  "", -5, [["expression", format[_EXECscript5,"MV22.sqf"]]], "1", "1"],
		["Offroad", [3],  "", -5, [["expression", format[_EXECscript5,"Offroad.sqf"]]], "1", "1"],
		["Offroad 2", [4],  "", -5, [["expression", format[_EXECscript5,"OFFROAD_d.sqf"]]], "1", "1"],
		["Offroad 3", [5],  "", -5, [["expression", format[_EXECscript5,"OFFROAD_w"]]], "1", "1"],
		["Red Offroad", [6],  "", -5, [["expression", format[_EXECscript5,"offroadRed.sqf"]]], "1", "1"],
		["Offroad Saffari", [7],  "", -5, [["expression", format[_EXECscript5,"offroadSaffari.sqf"]]], "1", "1"],
		["Offroad Tan", [8],  "", -5, [["expression", format[_EXECscript5,"offroadTan.sqf"]]], "1", "1"],
		["PBX", [9],  "", -5, [["expression", format[_EXECscript5,"PBX.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu6", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu6 =
[
["",true],
		["Sedan", [2],  "", -5, [["expression", format[_EXECscript5,"sedan.sqf"]]], "1", "1"],
		["SUV", [3],  "", -5, [["expression", format[_EXECscript5,"SUV.sqf"]]], "1", "1"],
		["MH6J", [4],  "", -5, [["expression", format[_EXECscript5,"MH6J.sqf"]]], "1", "1"],
		["Tank", [5],  "", -5, [["expression", format[_EXECscript5,"tank.sqf"]]], "1", "1"],
		["Tank Fallu", [6],  "", -5, [["expression", format[_EXECscript5,"TANKfall.sqf"]]], "1", "1"],
		["Tank Namal", [7],  "", -5, [["expression", format[_EXECscript5,"TANKnam.sqf"]]], "1", "1"],
		["Taxi", [8],  "", -5, [["expression", format[_EXECscript5,"taxi.sqf"]]], "1", "1"],
		["Tour Car", [9],  "", -5, [["expression", format[_EXECscript5,"tourcar.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu7", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu7 =
[
["",true],
		["SU25", [2],  "", -5, [["expression", format[_EXECscript5,"SU25.sqf"]]], "1", "1"],
		["Tractor 2", [3],  "", -5, [["expression", format[_EXECscript5,"Tractor.sqf"]]], "1", "1"],
		["Pickup Tubeframe", [4],  "", -5, [["expression", format[_EXECscript5,"tubeframe.sqf"]]], "1", "1"],
		["UAZ", [5],  "", -5, [["expression", format[_EXECscript5,"UAZ.sqf"]]], "1", "1"],
		["L39", [6],  "", -5, [["expression", format[_EXECscript5,"L39.sqf"]]], "1", "1"],
		["UH1H camo", [7],  "", -5, [["expression", format[_EXECscript5,"UH1H_TK.sqf"]]], "1", "1"],
		["UH1", [8],  "", -5, [["expression", format[_EXECscript5,"UH1.sqf"]]], "1", "1"],
		["Ural", [9],  "", -5, [["expression", format[_EXECscript5,"Ural.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu8", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu8 =
[
["",true],	
		["V3S", [2],  "", -5, [["expression", format[_EXECscript5,"V3S.sqf"]]], "1", "1"],
		["Van 2", [3],  "", -5, [["expression", format[_EXECscript5,"Van.sqf"]]], "1", "1"],
		["F35", [4],  "", -5, [["expression", format[_EXECscript5,"F35.sqf"]]], "1", "1"],
		["SergHamm", [5],  "", -5, [["expression", format[_EXECscript5,"SergHamm.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
BuildingMenu =
[
["",true],
		["Wood Floor", [2],  "", -5, [["expression", format[_EXECscript6,"ItemWoodFloor.sqf"]]], "1", "1"],
		["Wood Floor 1/2", [3],  "", -5, [["expression", format[_EXECscript6,"ItemWoodFloorHalf.sqf"]]], "1", "1"],
		["Wood Floor 1/4", [4],  "", -5, [["expression", format[_EXECscript6,"ItemWoodFloorQuarter.sqf"]]], "1", "1"],
		["Wood Stairs", [5],  "", -5, [["expression", format[_EXECscript6,"ItemWoodStairs.sqf"]]], "1", "1"],
		["Wood Stairs /w supp", [6],  "", -5, [["expression", format[_EXECscript6,"ItemWoodStairsSupport.sqf"]]], "1", "1"],
		["Wood Ladder", [7],  "", -5, [["expression", format[_EXECscript6,"ItemWoodLadder.sqf"]]], "1", "1"],
		["Wood Wall", [8],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWall.sqf"]]], "1", "1"],
		["Wood Wall 1/3", [9],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallThird.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:BuildingMenu2", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

BuildingMenu2 =
[
["",true],
		["Wood Wall Door", [2],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallDoor.sqf"]]], "1", "1"],
		["Wood Wall /w Door", [3],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallWithDoor.sqf"]]], "1", "1"],
		["Wood Wall /w Door Locked", [4],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallWithDoorLocked.sqf"]]], "1", "1"],
		["Wood Wall Window", [5],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallWindow.sqf"]]], "1", "1"],
		["Wood Stairs /w supp", [6],  "", -5, [["expression", format[_EXECscript6,"ItemWoodStairsSupport.sqf"]]], "1", "1"],
		["Wood Wall Large", [7],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallLg.sqf"]]], "1", "1"],
		["Wood Wall Garage Door", [8],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallGarageDoor.sqf"]]], "1", "1"],
		["Wood Wall Garage Door Locked", [9],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallGarageDoorLocked.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:BuildingMenu3", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

BuildingMenu3 =
[
["",true],
		["Wood Wall Door Large", [2],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallDoorLg.sqf"]]], "1", "1"],
		["Wood Wall /w Door Large", [3],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallWithDoorLg.sqf"]]], "1", "1"],
		["Wood Wall /w Door Large Locked", [4],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallWithDoorLgLocked.sqf"]]], "1", "1"],
		["Wood Wall Window Large", [5],  "", -5, [["expression", format[_EXECscript6,"ItemWoodWallWindowLg.sqf"]]], "1", "1"],
		["Wire", [6],  "", -5, [["expression", format[_EXECscript6,"ItemWire.sqf"]]], "1", "1"],
		["Sandbag", [7],  "", -5, [["expression", format[_EXECscript6,"ItemSandbag.sqf"]]], "1", "1"],
		["Sandbag Large", [8],  "", -5, [["expression", format[_EXECscript6,"ItemSandbagLarge.sqf"]]], "1", "1"],
		["Sandbag Extra Large", [9],  "", -5, [["expression", format[_EXECscript6,"ItemSandbagExLarge.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:BuildingMenu4", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

BuildingMenu4 =
[
["",true],
		["Tank Trap", [2],  "", -5, [["expression", format[_EXECscript6,"ItemTankTrap.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ItemMenu =
[
["",true],
		["Supply Crate Empty", [2],  "", -5, [["expression", format[_EXECscript7,"bulk_empty.sqf"]]], "1", "1"],
		["Gold Bar", [3],  "", -5, [["expression", format[_EXECscript7,"ItemGoldBar.sqf"]]], "1", "1"],
		["Gold Bar 10oz", [4],  "", -5, [["expression", format[_EXECscript7,"ItemGoldBar10oz.sqf"]]], "1", "1"],
		["Silver Bar", [5],  "", -5, [["expression", format[_EXECscript7,"ItemSilverBar.sqf"]]], "1", "1"],
		["Silver Bar 10oz", [6],  "", -5, [["expression", format[_EXECscript7,"ItemSilverBar10oz.sqf"]]], "1", "1"],
		["Copper Bar", [7],  "", -5, [["expression", format[_EXECscript7,"ItemCopperBar.sqf"]]], "1", "1"],
		["Copper Bar 10oz", [8],  "", -5, [["expression", format[_EXECscript7,"ItemCopperBar10oz.sqf"]]], "1", "1"],
		["Aluminium Bar", [9],  "", -5, [["expression", format[_EXECscript7,"ItemAluminumBar.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ItemMenu2", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ItemMenu2 =
[
["",true],
		["Aluminium Bar 10oz", [2],  "", -5, [["expression", format[_EXECscript7,"ItemAluminumBar10oz.sqf"]]], "1", "1"],
		["Tin Bar", [3],  "", -5, [["expression", format[_EXECscript7,"ItemTinBar.sqf"]]], "1", "1"],
		["Tin Bar 10oz", [4],  "", -5, [["expression", format[_EXECscript7,"ItemTinBar10oz.sqf"]]], "1", "1"],
		["Bronze Bar", [5],  "", -5, [["expression", format[_EXECscript7,"ItemBronzeBar.sqf"]]], "1", "1"],
		["Briefcase Empty", [6],  "", -5, [["expression", format[_EXECscript7,"ItemBriefcaseEmpty.sqf"]]], "1", "1"],
		["Briefcase Full", [7],  "", -5, [["expression", format[_EXECscript7,"ItemBriefcase100oz.sqf"]]], "1", "1"],
		["Fuel Barrel", [8],  "", -5, [["expression", format[_EXECscript7,"ItemFuelBarrel.sqf"]]], "1", "1"],
		["Fuel Barrel Empty", [9],  "", -5, [["expression", format[_EXECscript7,"ItemFuelBarrelEmpty.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ItemMenu3", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ItemMenu3 =
[
["",true],
		["Jerry Can", [2],  "", -5, [["expression", format[_EXECscript7,"ItemJerrycan.sqf"]]], "1", "1"],
		["Generator", [3],  "", -5, [["expression", format[_EXECscript7,"ItemGenerator.sqf"]]], "1", "1"],
		["Fuel Pump", [4],  "", -5, [["expression", format[_EXECscript7,"ItemFuelPump.sqf"]]], "1", "1"],
		["Safe", [5],  "", -5, [["expression", format[_EXECscript7,"ItemVault.sqf"]]], "1", "1"],
		["Sledgehammer Handle", [6],  "", -5, [["expression", format[_EXECscript7,"ItemSledgeHandle.sqf"]]], "1", "1"],
		["Sledgehammer Head", [7],  "", -5, [["expression", format[_EXECscript7,"ItemSledgeHead.sqf"]]], "1", "1"],
		["Radio", [8],  "", -5, [["expression", format[_EXECscript7,"TrapBear.sqf"]]], "1", "1"],
		["Cinder Wall Kit", [9],  "", -5, [["expression", format[_EXECscript7,"cinder_wall_kit.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ItemMenu4", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ItemMenu4 =
[
["",true],
		["Cinder Garage Kit", [2],  "", -5, [["expression", format[_EXECscript7,"cinder_garage_kit.sqf"]]], "1", "1"],
		["Cinder Door Kit", [3],  "", -5, [["expression", format[_EXECscript7,"cinder_door_kit.sqf"]]], "1", "1"],
		["Metal Floor Kit", [4],  "", -5, [["expression", format[_EXECscript7,"metal_floor_kit.sqf"]]], "1", "1"],
		["Cinderblocks", [5],  "", -5, [["expression", format[_EXECscript7,"CinderBlocks.sqf"]]], "1", "1"],
		["Mortar Bucket", [6],  "", -5, [["expression", format[_EXECscript7,"MortarBucket.sqf"]]], "1", "1"],
		["Deerstand Kit", [7],  "", -5, [["expression", format[_EXECscript7,"deer_stand_kit.sqf"]]], "1", "1"],
		["Desert Large Net Kit", [8],  "", -5, [["expression", format[_EXECscript7,"desert_large_net_kit.sqf"]]], "1", "1"],
		["Forest Large Net Kit", [9],  "", -5, [["expression", format[_EXECscript7,"forest_large_net_kit.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ItemMenu5", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ItemMenu5 =
[
["",true],
		["Desert Net Kit", [2],  "", -5, [["expression", format[_EXECscript7,"desert_net_kit.sqf"]]], "1", "1"],
		["Forest Net Kit", [3],  "", -5, [["expression", format[_EXECscript7,"forest_net_kit.sqf"]]], "1", "1"],
		["Fuel Pump Kit", [4],  "", -5, [["expression", format[_EXECscript7,"fuel_pump_kit.sqf"]]], "1", "1"],
		["Light Pole Kit", [5],  "", -5, [["expression", format[_EXECscript7,"light_pole_kit.sqf"]]], "1", "1"],
		["Stick Fence Kit", [6],  "", -5, [["expression", format[_EXECscript7,"stick_fence_kit.sqf"]]], "1", "1"],
		["Wooden Shed Kit", [7],  "", -5, [["expression", format[_EXECscript7,"wooden_shed_kit.sqf"]]], "1", "1"],
		["Wood Shack Kit", [8],  "", -5, [["expression", format[_EXECscript7,"wood_shack_kit.sqf"]]], "1", "1"],
		["M240 Nest Kit", [9],  "", -5, [["expression", format[_EXECscript7,"m240_nest_kit.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ItemMenu6", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ItemMenu6 =
[
["",true],
		["Sun Shade Kit", [2],  "", -5, [["expression", format[_EXECscript7,"sun_shade_kit.sqf"]]], "1", "1"],
		["Park Bench Kit", [3],  "", -5, [["expression", format[_EXECscript7,"park_bench_kit.sqf"]]], "1", "1"],
		["Rusty Gate Kit", [4],  "", -5, [["expression", format[_EXECscript7,"rusty_gate_kit.sqf"]]], "1", "1"],
		["Sandbag Nest Kit", [5],  "", -5, [["expression", format[_EXECscript7,"sandbag_nest_kit.sqf"]]], "1", "1"],
		["Outhouse Kit", [6],  "", -5, [["expression", format[_EXECscript7,"outhouse_kit.sqf"]]], "1", "1"],
		["Storage Shed Kit", [7],  "", -5, [["expression", format[_EXECscript7,"storage_shed_kit.sqf"]]], "1", "1"],
		["Hotwire Kit", [8],  "", -5, [["expression", format[_EXECscript7,"ItemHotwireKit.sqf"]]], "1", "1"],
		["Wood Ramp", [9],  "", -5, [["expression", format[_EXECscript7,"ItemDocumentRamp.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:ItemMenu7", -5, [["expression", ""]], "1", "1"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ItemMenu7 =
[
["",true],
		["30m Plot Pole", [2],  "", -5, [["expression", format[_EXECscript7,"30m_plot_kit.sqf"]]], "1", "1"],
		["Lightbulb", [3],  "", -5, [["expression", format[_EXECscript7,"ItemLightBulb.sqf"]]], "1", "1"],
		["Combolock", [4],  "", -5, [["expression", format[_EXECscript7,"ItemComboLock.sqf"]]], "1", "1"],
		["Lockbox", [5],  "", -5, [["expression", format[_EXECscript7,"ItemLockbox.sqf"]]], "1", "1"],
		["Corrugated Fence", [6],  "", -5, [["expression", format[_EXECscript7,"ItemCorrugated.sqf"]]], "1", "1"],
		["Metal Pole", [7],  "", -5, [["expression", format[_EXECscript7,"ItemPole.sqf"]]], "1", "1"],
		["Gunrack Kit", [8],  "", -5, [["expression", format[_EXECscript7,"ItemGunRackKit.sqf"]]], "1", "1"],
		["Workbench kit", [9],  "", -5, [["expression", format[_EXECscript7,"workbench_kit.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:adminmenu";