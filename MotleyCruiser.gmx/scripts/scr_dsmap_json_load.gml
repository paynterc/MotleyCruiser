// scr_dsmap_json_load(map id, label)
var map_id = argument0;
var label = argument1;

//ds_map_clear(global.mission_map);

//Read save file into ds_map
var fileName = global.game_loaded + label +".json";
if(file_exists(fileName)) {
    var file = file_text_open_read(fileName);
    ds_map_destroy(global.mission_map);
    global.mission_map = json_decode(file_text_read_string(file));
    //ds_map_copy(global.mission_map,loadDS);
    //ds_map_destroy(loadDS);
    file_text_close(file);
}
