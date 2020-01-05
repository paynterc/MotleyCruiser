// The grievance map only contains references to the ds_lists, not the lists themselves
// Iterate over the entire map and destroy each list, then destroy the map.
var key = ds_map_find_first(global.grievance_map);
var list;
while(!is_undefined(key)){    
    list = ds_map_find_value(global.grievance_map,key);
    show_debug_message("M Destroy list : " + string(list));
    ds_list_destroy(list);
    key = ds_map_find_next(global.grievance_map, key);
}
ds_map_clear(global.grievance_map);
