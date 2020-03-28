// scr_dsmap_save(map id, label)
var map_id = argument0;
var label = argument1;
ds_map_secure_save(map_id,global.game_loaded + label+".dat");

