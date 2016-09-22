/// Create an array with npc attributes

var map = noone;

var race_index = irandom(array_length_1d(global.races) - 1);
var run_modifier = irandom(4)-2;
var hp_modifier = irandom(10)-5;
var names = totro_plus(1,4,2,0,0);

map[NPC_RACE_INDEX] = race_index;
map[NPC_NAME] = names[0] + " " + names[1];
map[NPC_RUN_SPD] =  max(global.min_spd, global.races[race_index,RACE_BASE_SPD] + run_modifier);
map[NPC_HP] =  max(global.min_hp, global.races[race_index,RACE_BASE_HP] + hp_modifier);
map[NPC_HP_CURRENT] =  map[NPC_HP];


return map;
