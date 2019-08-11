/// scr_gx_save_by_key(gx,gy,key,value)
/****
Write data to global.galaxy dsmap
****/
var gx = argument0;
var gy = argument1;
var key = argument2;
var value = argument3;

var sector_key = "x"+string(gx)+"y"+string(gy)+"~"+string(key);
ds_map_replace(global.galaxy, sector_key, value);
