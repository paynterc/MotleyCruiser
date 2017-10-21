/// scr_gx_loc_exists(sector x, sectory y, index)
// See if an index exists in gx_locations
var index = scr_make_loc_index(argument0,argument1,argument2);

if(!scr_gx_loc_find_value(index,LOC_TYPE)){
    return false;
}else{
    return true;
}
