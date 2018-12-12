/// scr_gx_get_by_key(gx,gy,key)
/****
Get data from global.galaxy dsmap
****/
var gx = argument0;
var gy = argument1;
var key = argument2;

var sector_key = "x"+string(gx)+"y"+string(gy)+"~"+string(key);
return ds_map_find_value(global.galaxy,sector_key);
