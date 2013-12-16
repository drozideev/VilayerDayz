waitUntil {alive player};

while {true} do
{
	_kills = 		player getVariable["zombieKills",0];
	_killsH = 		player getVariable["humanKills",0];
	_killsB = 		player getVariable["banditKills",0];
	_humanity =		player getVariable["humanity",0];
	
	hintSilent parseText format ["
	<t size='1.25' font='Bitstream'align='center' color='#D60000'>DayZ Epoch RU 54</t><br/>
	<t size='1.15' font='Bitstream'align='center' color='#D60000'>vk.com/dayzru54</t><br/>
	<t size='1.15' font='Bitstream'align='center' color='#5882FA'>Прожито дней: %2</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Игроков онлайн: </t><t size='0.95 'font='Bitstream' align='right'>%3</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Убийств: </t><t size='0.95' font='Bitstream' align='right'>%4</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Бандитов убито: </t><t size='0.95' font='Bitstream' align='right'>%5</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Зомби убито: </t><t size='0.95' font='Bitstream' align='right'>%6</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Хуманити: </t><t size='0.95' font='Bitstream' align='right'>%7</t><br/>
    <t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Кровь: </t><t size='0.95' font='Bitstream' align='right'>%8</t><br/>
	<t size='1.15' font='Bitstream'align='center' color='#5882FA'>Минут до рестарта: %9</t><br/>",

	dayz_playerName,(dayz_Survived),(count playableUnits),_killsH,_killsB,_kills,round _humanity,r_player_blood,(round(179-(serverTime) / 60))
	];
sleep 1;
};