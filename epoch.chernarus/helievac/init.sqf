private ["_choppersAvailable"];

WaitUntil { !isNil 'HELIEVAC_limit'; };
_choppersAvailable = (HELIEVAC_limit > 0);
if (_choppersAvailable) then {
	"Heli Evac" hintC ["Чтобы выбрать точку назначения, держите ALT и кликните мышкой в ту точку, куда вам надо.", "Если все сработало успешно, то маркер появится в точке назначения, а там, где вас заберут - появится зеленый дым."];
	onMapSingleClick "[_pos,_alt] call HELIEVAC_call;";
	openMap true;
} else {
	cutText ["К сожалению, в данный момент нет свободных вертолетов...", "PLAIN DOWN"];
};
