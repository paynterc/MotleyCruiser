/// scr_gx_loc_find(index,key);
// Find a locaton in global.gx_locations
var index = argument0;
var key = argument1;

var result = ds_map_find_value(global.gx_locations, index + "," + string(key));

if(is_undefined(result)){
    return false;    
}else{
    return result;
}
