// scr_dsmap_json_save(map id, label)
var map_id = argument0;
var label = argument1;
var jsonSTR = json_encode(map_id);
var file = file_text_open_write(global.game_loaded + label + ".json");
var check = 1;
file_text_write_string(file, jsonSTR);
file_text_close(file);
