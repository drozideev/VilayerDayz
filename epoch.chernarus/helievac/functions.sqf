HELIEVAC_debug = true;

HELIEVAC_call = {
	private ["_pos"];
	if ((_this select 1)) then {
		_pos = _this select 0;
		[_pos] call HELIEVAC_do;
	};
	onMapSingleClick "";
	openMap false;
};

HELIEVAC_do = {
	private ["_pickup", "_dest", "_marker_pickup", "_marker_dest"];
	_unit = player;

	_pickup_orig = [_unit, 20, getdir _unit] call BIS_fnc_relPos;
	_dest_orig = _this select 0;
	
	_pickup = [_pickup_orig] call HELIEVAC_findsafepos;
	_dest = [_dest_orig] call HELIEVAC_findsafepos;

	if ((count _pickup < 1) or (count _dest < 1)) exitWith {
		cutText ["Can not find safe landing position", "PLAIN DOWN"];
	};
	
	if (((_pickup_orig distance _pickup) > 400) or ((_dest_orig distance _dest) > 400)) exitWith {
		cutText ["Can not find safe landing position", "PLAIN DOWN"];
	};

	/*_pickup_flat = [_pickup, HELIEVAC_heli] call HELIEVAC_isflat;
	if (!_pickup_flat) exitWith {
		cutText ["The pickup position is not flat enough.", "PLAIN DOWN"];
	};

	_dest_flat = [_dest, HELIEVAC_heli] call HELIEVAC_isflat;
	if (!_dest_flat) exitWith {
		cutText ["The destination position is not flat enough.", "PLAIN DOWN"];
	};*/
	
	if ((_pickup distance _dest) < 1000) exitWith {
		cutText [format ["Evac destination is to close. %1m", _dist], "PLAIN DOWN"];
	};

	_marker_pickup = createMarkerLocal [ format ["HELIEVAC_pickup_location_%1", time], _pickup];
	_marker_pickup setMarkerShapeLocal "ICON";
	_marker_pickup setMarkerTypeLocal "mil_start";
	_marker_pickup setMarkerColorLocal 'ColorGreen';
	_marker_pickup setMarkerAlphaLocal 1;
	_marker_pickup setMarkerTextLocal "Pickup";

	_marker_dest = createMarkerLocal [ format ["HELIEVAC_dest_location_%1", time], _dest];
	_marker_dest setMarkerShapeLocal "ICON";
	_marker_dest setMarkerTypeLocal "mil_end";
	_marker_dest setMarkerColorLocal 'ColorRed';
	_marker_dest setMarkerAlphaLocal 1;
	_marker_dest setMarkerTextLocal "Destination";
	_unit removeWeapon "ItemRadio";
	cutText ["За вами уже вылетели!", "PLAIN DOWN"];
	dayzHeliEvac = [_pickup,_dest,player];
	publicVariable "dayzHeliEvac";
};

HELIEVAC_findsafepos = {
	_pos = _this select 0;
	_extraction_point = [];
	_max_distance = 50;
	waitUntil {!isNil "HELIEVAC_heli"};

	_loops = 0;
	while { (count _extraction_point < 1) and (_loops < 50) } do
	{
		_extraction_point = _pos findEmptyPosition[ 10 , _max_distance , HELIEVAC_heli ];
		_max_distance = _max_distance + 50;
		_loops = _loops + 1;
	};

	_extraction_point;
};

HELIEVAC_isflat = {
   private ["_pos", "_obj"];
   
   _pos = _this select 0;
   _obj = _this select 1;
   
   ((count (_pos isFlatEmpty [
      (sizeof _obj),
      0,
      60,
      (sizeof _obj),
      0,
      false,
      objNull
   ])) > 0)
};