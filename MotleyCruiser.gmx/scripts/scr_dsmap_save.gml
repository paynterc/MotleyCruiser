// scr_dsmap_save(map id, label)
var map_id = argument0;
var label = argument1;
ini_open(SAVE_GAME_FILE);
var i_string;
i_string = ds_map_write(map_id);
ini_write_string(global.game_loaded, label, i_string);
ini_close();
