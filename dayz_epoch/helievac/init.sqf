waituntil {!isnil "bis_fnc_init"};
call compile preprocessFileLineNumbers "\z\addons\dayz_server\helievac\config.sqf";

spawn_heliEvac = compile preprocessFileLineNumbers "\z\addons\dayz_server\helievac\spawn.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\helievac\functions.sqf";
"dayzHeliEvac" addPublicVariableEventHandler {(_this select 1) spawn spawn_heliEvac};