/// scr_loc_add(index, key, value)
// index should be in the form "sectorx,sectory,indexnum". ie "0,1,7"
var key = argument0 + "," + string(argument1);
var value = argument2;
ds_map_replace(global.gx_locations, key, value);

