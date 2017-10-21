///scr_gx_loc_array_to_map(array);
// translate a location array to a dsmap record
// does a ds_map_replace into global.gx_locations

var arr = argument0;
var index = arr[LOC_INDEX];
for(var i=1; i<array_length_1d(arr); i++){
    scr_loc_add(index, i, arr[i]);
}
