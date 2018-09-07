// scr_dsmap_save(map id, label)
var map_id = argument0;
var label = argument1;

ds_map_clear(map_id);

var i_string = ini_read_string(global.game_loaded, label, "");
if(i_string != ""){
    ds_map_read(map_id, i_string);
}
