// scr_dslist_save(list id, label)
var list_id = argument0;
var label = argument1;
ini_open(SAVE_GAME_FILE);
var i_string;
i_string = ds_list_write(list_id);
ini_write_string(global.game_loaded, label, i_string);
ini_close();
