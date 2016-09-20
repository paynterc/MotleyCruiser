/// Create a dsmap with attributes
//var map = scr_npc();
var map = ds_map_create();

map[? "race"]=noone;
map[? "name"]=noone;
map[? "run_speed"]=noone;
map[? "hp"]=noone;
map[? "hp_current"]=noone;
map[? "status"]='active';


var race_index = irandom(array_length_1d(global.races) - 1);
var run_modifier = irandom(4)-2;
var hp_modifier = irandom(10)-5;
var names = totro_plus(1,4,2,0,0);

var race = global.races[race_index];

map[? "race"]=race_index;
map[? "name"]=names[0] + " " + names[1];
map[? "run_speed"] = max(global.min_spd, race[? "base_spd"] + run_modifier);
map[? "hp"] = max(global.min_hp, race[? "base_hp"] + hp_modifier);
map[? "hp_current"] = map[? "hp"];

return map;
