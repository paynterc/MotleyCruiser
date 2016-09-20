/// Create a dsmap for npc with attributes
var map = ds_map_create();

map[? "race"]=noone;
map[? "name"]=noone;
map[? "run_speed"]=noone;
map[? "hp"]=noone;
map[? "hp_current"]=noone;
map[? "status"]='active';

//maybe some character traits. We can find opposite ends of a spectrum and put them on a scale
/**
teetotler-addict
kind-cruel
courageous-cowardly
sensitive-callous
secure-insecure
aggressive-passive
modest-vain
honest-dishonest
fast-slow
old-young
hardworking-lazy
**/

return map;
