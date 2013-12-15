waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in ["2292868","75126342","2508420"]) then {
	sleep 30;
	player addaction [("<t color=""#0074E8"">" + ("Помощь администратору") +"</t>"),"admintools\Eexcute.sqf","",5,false,true,"",""];
};