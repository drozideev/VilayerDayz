_spawn = "HMMWV_M998_crows_M2_DES_EP1";
_posplr = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 0];
_dirplr = getDir player;
_spwnveh = _spawn createVehicle (_posplr);
_spwnveh setVariable ["Sarge",1,true];