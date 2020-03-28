// scr_dsmap_load_secure(map id, label)
var map_id = argument0;
var label = argument1;

var fileName = global.game_loaded + label+".dat";
if(file_exists(fileName)) {

    ds_map_destroy(global.mission_map);
    global.mission_map = ds_map_secure_load(fileName);

}
