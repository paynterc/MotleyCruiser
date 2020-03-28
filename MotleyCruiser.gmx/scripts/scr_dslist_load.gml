// scr_dslist_load(list id, label)
var list_id = argument0;
var label = argument1;

ds_list_clear(list_id);

var i_string = ini_read_string(global.game_loaded, label, "");
if(i_string != ""){
    ds_list_read(list_id, i_string);
}
