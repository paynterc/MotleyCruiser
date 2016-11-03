/// Create an array with npc attributes
// Attribute names are contained in Macros/All configurations
var map = noone;

var race_index = irandom(array_height_2d(global.races) - 1);
var run_modifier = irandom(4)-2;
var hp_modifier = irandom(10)-5;
var names = totro_plus(1,4,2,0,0);

map[NPC_RACE_INDEX] = race_index;
map[NPC_NAME] = names[0] + " " + names[1];
map[NPC_NAME_FIRST] = names[0];
map[NPC_NAME_LAST] = names[1];
map[NPC_RUN_SPD] =  max(global.min_spd, global.races[race_index,RACE_BASE_SPD] + run_modifier);
map[NPC_HP] =  max(global.min_hp, global.races[race_index,RACE_BASE_HP] + hp_modifier);
map[NPC_HP_CURRENT] =  map[NPC_HP];
map[NPC_MISSION]=noone;

return map;
